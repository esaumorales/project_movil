import 'package:flutter/material.dart';
import 'package:ustay_project/presentation/user/screens/user_favorite_screen.dart';

class DetailRoomScreen extends StatelessWidget {
  final Inmueble inmueble;

  DetailRoomScreen({required this.inmueble});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          inmueble.descripcion,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.orange,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.share, size: 28),
            onPressed: () {
              // Implementar acción de compartir si es necesario
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Carrusel de imágenes
              Container(
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: PageView(
                  children: inmueble.imagenes.map((image) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        image,
                        width: double.infinity,
                        height: 250,
                        fit: BoxFit.cover,
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 16),

              // Ubicación, Precio y Rating
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Ubicación: ${inmueble.ubicacion}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  Text(
                    '\$${inmueble.precio}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    'Pago: ${inmueble.tiempo}',
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                  Spacer(),
                  // Rating en la parte superior derecha
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.orange, size: 20),
                      Text(
                        ' ${inmueble.rating}',
                        style: TextStyle(fontSize: 16, color: Colors.orange),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Partner info
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(inmueble.fotoPartner),
                    radius: 22,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    inmueble.nombrePartner,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: Image.asset(inmueble.whatsapp, width: 30, height: 30),
                    onPressed: () {
                      // Agregar lógica para WhatsApp si es necesario
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Título para la descripción
              Text(
                'Descripción',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              // Descripción del cuarto
              Text(
                inmueble.descripcionCuarto,
                style: TextStyle(fontSize: 16, color: Colors.black87),
              ),
              const SizedBox(height: 16),

              // Título de Especificaciones con fondo naranja
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Color(0xFFF8AA02),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'Especificaciones: ',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              // Especificaciones
              ...inmueble.especificaciones.map((spec) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Text(
                  '- $spec',
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
              )).toList(),
              const SizedBox(height: 16),

              // Servicios
              _buildSectionTitle('Servicios:'),
              Table(
                border: TableBorder.all(
                  color: Colors.white,
                  width: 1.0,
                ),
                columnWidths: {
                  0: FlexColumnWidth(3),
                  1: FlexColumnWidth(2),
                },
                children: [
                  for (var i = 0; i < inmueble.servicios.length; i++)
                    TableRow(
                      decoration: BoxDecoration(
                        color: i % 2 == 0
                            ? Colors.grey.shade100
                            : Colors.white,
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            inmueble.servicios[i],
                            style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Disponible',
                            style: TextStyle(fontSize: 14, color: Colors.black38),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
              const SizedBox(height: 16),

              // Reglas de la casa
              _buildSectionTitle('Reglas de la casa:'),
              const SizedBox(height: 8),
              ...inmueble.reglasCasa.map((rule) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Text(
                  '* $rule',
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
              )).toList(),
              const SizedBox(height: 16),

              // Contacto y Correo con borde
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.orange),
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.orange,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Contacto:',
                            style: TextStyle(fontSize: 14, color: Colors.black87),
                          ),
                          Text(
                            '${inmueble.contacto}',
                            style: TextStyle(fontSize: 14, color: Colors.black87),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.orange),
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.orange,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Correo:',
                            style: TextStyle(fontSize: 14, color: Colors.black87),
                          ),
                          Text(
                            '${inmueble.correo}',
                            style: TextStyle(fontSize: 14, color: Colors.black87),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  // Método para construir los títulos de secciones con fondo naranja
  Widget _buildSectionTitle(String title) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Color(0xFFF8AA02),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
