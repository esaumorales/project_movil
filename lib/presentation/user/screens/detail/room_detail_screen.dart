import 'package:flutter/material.dart';
import 'package:ustay_project/data/inmueble_service.dart';
import 'package:ustay_project/data/edificio_service.dart';
import 'package:ustay_project/data/partner_service.dart';
import 'package:ustay_project/data/especificaciones_service.dart';

class RoomDetailScreen extends StatefulWidget {
  final int inmuebleId;

  const RoomDetailScreen({Key? key, required this.inmuebleId}) : super(key: key);

  @override
  _RoomDetailScreenState createState() => _RoomDetailScreenState();
}

class _RoomDetailScreenState extends State<RoomDetailScreen> {
  final InmuebleService inmuebleService = InmuebleService();
  final EdificioService edificioService = EdificioService();
  final PartnerService partnerService = PartnerService();
  final EspecificacionesService especificacionesService = EspecificacionesService();

  late Future<Map<String, dynamic>> _roomDetails;

  @override
  void initState() {
    super.initState();
    _roomDetails = _fetchRoomDetails();
  }

  Future<Map<String, dynamic>> _fetchRoomDetails() async {
    try {
      // Llamada al servicio de inmueble por ID
      final inmueble = await inmuebleService.fetchInmuebleById(widget.inmuebleId);

      // Relación con el edificio
      final edificio = await edificioService.fetchEdificioById(inmueble.edificioId!);

      // Relación con el partner
      final partner = await partnerService.fetchPartnerById(edificio['partnerId']);

      // Relación con las especificaciones
      final especificaciones = await especificacionesService.fetchEspecificaciones(widget.inmuebleId);

      return {
        "inmueble": inmueble,
        "partnerName": partner['usuario']['nombre'], // Nombre del usuario que es partner
        "especificaciones": especificaciones,
        "edificio": edificio,
      };
    } catch (e) {
      throw Exception("Error al cargar los detalles del cuarto: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detalles del Cuarto"),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: _roomDetails,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Error: ${snapshot.error}"),
            );
          } else if (!snapshot.hasData) {
            return const Center(child: Text("No se pudieron cargar los datos"));
          }

          final data = snapshot.data!;
          final inmueble = data["inmueble"];
          final partnerName = data["partnerName"];
          final especificaciones = data["especificaciones"];
          final edificio = data["edificio"];

          return SingleChildScrollView(
            child: Column(
              children: [
                // Carrusel de imágenes
                SizedBox(
                  height: 250,
                  child: PageView.builder(
                    itemCount: especificaciones.length,
                    itemBuilder: (context, index) {
                      return Image.network(
                        especificaciones[index],
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          // Imagen de respaldo si no carga
                          return Image.asset(
                            'assets/images/placeholder.png',
                            fit: BoxFit.cover,
                          );
                        },
                      );
                    },
                  ),
                ),
                const SizedBox(height: 16),

                // Información principal
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Precio
                      Text(
                        "S/${inmueble['precio']} por mes",
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange,
                        ),
                      ),
                      const SizedBox(height: 8),

                      // Nombre del partner (usuario autoproclamado partner)
                      Text(
                        partnerName,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),

                      // Ubicación (Dirección del edificio)
                      Row(
                        children: [
                          const Icon(Icons.location_on, color: Colors.red),
                          const SizedBox(width: 4),
                          Text(
                            edificio['direccion'],
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),

                      // Periodo
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            edificio['reglaCasa'] ?? "Sin reglas específicas",
                            style: const TextStyle(fontSize: 14),
                          ),
                          Text(
                            inmueble['disponibilidad'] ? "DISPONIBLE" : "NO DISPONIBLE",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: inmueble['disponibilidad'] ? Colors.green : Colors.red,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),

                      // Especificaciones
                      const Text(
                        "Especificaciones",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Wrap(
                        spacing: 8,
                        children: especificaciones
                            .map<Widget>((spec) => Chip(
                          label: Text(spec),
                          backgroundColor: Colors.orange.shade100,
                        ))
                            .toList(),
                      ),
                      const SizedBox(height: 16),

                      // Servicios
                      const Text(
                        "Servicios",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ListTile(
                        leading: const Icon(Icons.check, color: Colors.green),
                        title: const Text("Agua"),
                        subtitle: Text(inmueble['servicios']['agua'] ? "Incluido" : "No incluido"),
                      ),
                      ListTile(
                        leading: const Icon(Icons.check, color: Colors.green),
                        title: const Text("Luz"),
                        subtitle: Text(inmueble['servicios']['luz'] ? "Incluido" : "No incluido"),
                      ),
                      ListTile(
                        leading: const Icon(Icons.check, color: Colors.green),
                        title: const Text("Wifi"),
                        subtitle: Text(inmueble['servicios']['wifi'] ? "Incluido" : "No incluido"),
                      ),

                      // Descripción
                      const SizedBox(height: 16),
                      const Text(
                        "Descripción",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        inmueble['descripcion'],
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
