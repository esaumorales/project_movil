import 'package:flutter/material.dart';
import 'package:ustay_project/presentation/widgets/large_card.dart';
import 'package:ustay_project/presentation/widgets/filter_dialog.dart'; // Importa el widget reutilizable para el filtro.

class InmuebleScreen extends StatefulWidget {
  @override
  _InmuebleScreenState createState() => _InmuebleScreenState();
}

class _InmuebleScreenState extends State<InmuebleScreen> {
  // Datos estáticos para las LargeCards
  final List<Map<String, dynamic>> inmuebles = [
    {
      "imageUrl": "https://example.com/room_1.jpg",
      "partnerName": "Partner 1",
      "price": "250",
      "type": "Habitación Deluxe",
      "isAvailable": true,
      "rating": 4.8,
    },
    {
      "imageUrl": "https://example.com/room_2.jpg",
      "partnerName": "Partner 2",
      "price": "150",
      "type": "Habitación Económica",
      "isAvailable": true,
      "rating": 4.5,
    },
    {
      "imageUrl": "https://example.com/room_3.jpg",
      "partnerName": "Partner 3",
      "price": "180",
      "type": "Habitación Popular",
      "isAvailable": false,
      "rating": 4.2,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Botón de "Volver"
            IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Lista de inmuebles",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  _buildFilterButton(
                    "Filtro",
                    onPressed: () {
                      _showFilterBottomSheet(context); // Usa el filtro reutilizable
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: inmuebles.length,
                itemBuilder: (context, index) {
                  final inmueble = inmuebles[index];
                  return Column(
                    children: [
                      LargeCard(
                        imageUrl: inmueble["imageUrl"] ?? "",
                        partnerName: inmueble["partnerName"] ?? "Sin información",
                        price: inmueble["price"] ?? "0.00",
                        type: inmueble["type"] ?? "Sin descripción",
                        isAvailable: inmueble["isAvailable"] ?? false,
                        rating: inmueble["rating"] ?? 0.0,
                        onTap: () {
                          debugPrint("Inmueble seleccionado: ${inmueble["type"]}");
                        },
                      ),
                      const SizedBox(height: 16),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterButton(String text, {required VoidCallback onPressed}) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.orange, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.orange,
            fontWeight: FontWeight.normal,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  void _showFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: 0.7, // Ajusta el tamaño del modal
          child: FilterWidget(
            onClose: () {
              Navigator.pop(context);
            },
          ),
        );
      },
    );
  }
}
