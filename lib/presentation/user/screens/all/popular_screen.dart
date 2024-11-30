import 'package:flutter/material.dart';
import 'package:ustay_project/shared/filter/filter_dialog.dart';
import 'package:ustay_project/shared/card/large_card.dart';

class PopularScreen extends StatefulWidget {
  @override
  _PopularScreenState createState() => _PopularScreenState();
}

class _PopularScreenState extends State<PopularScreen> {
  // Datos realistas para las tarjetas de populares
  final List<Map<String, dynamic>> popularInmuebles = [
    {
      "imageUrl": "https://img-us-1.trovit.com/img1pe/6W1p1uZ4_H/6W1p1uZ4_H.6_11.jpg",
      "partnerName": "Cuarto Central",
      "price": "300",
      "type": "Suite Deluxe",
      "isAvailable": true,
      "rating": 4.9,
    },
    {
      "imageUrl": "https://img-us-1.trovit.com/img1pe/i1W51IGJ3R/i1W51IGJ3R.5_11.jpg",
      "partnerName": "Residencial Primavera",
      "price": "250",
      "type": "Habitación Doble",
      "isAvailable": true,
      "rating": 4.8,
    },
    {
      "imageUrl": "https://img-us-1.trovit.com/img1pe/1Ux1s111UJC1X/1Ux1s111UJC1X.1_11.jpg",
      "partnerName": "Cuarto El Sol",
      "price": "200",
      "type": "Habitación Simple",
      "isAvailable": false,
      "rating": 4.7,
    },
    {
      "imageUrl": "https://img-us-1.trovit.com/img1pe/161C1x191H1PK14/161C1x191H1PK14.12_11.jpg",
      "partnerName": "Departamento Urbano",
      "price": "350",
      "type": "Suite Presidencial",
      "isAvailable": true,
      "rating": 5.0,
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
                    "Los más populares",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  _buildFilterButton(
                    "Filtro",
                    onPressed: () {
                      _showFilterBottomSheet(context); // Muestra el filtro
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: popularInmuebles.length,
                itemBuilder: (context, index) {
                  final inmueble = popularInmuebles[index];
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
                          debugPrint(
                              "Inmueble seleccionado: ${inmueble["type"]}");
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
