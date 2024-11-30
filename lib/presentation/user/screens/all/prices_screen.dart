import 'package:flutter/material.dart';
import 'package:ustay_project/shared/filter/filter_dialog.dart';
import 'package:ustay_project/shared/card/large_card.dart';

class PricesScreen extends StatefulWidget {
  @override
  _PricesScreenState createState() => _PricesScreenState();
}

class _PricesScreenState extends State<PricesScreen> {
  // Datos realistas para los mejores precios
  final List<Map<String, dynamic>> bestPriceInmuebles = [
    {
      "imageUrl": "https://static.readytotrip.com/upload/information_system_24/1/5/7/item_1572678/photo_83742237.jpg",
      "partnerName": "Residencial Miraflores",
      "price": "120",
      "type": "Cuarto Básica",
      "isAvailable": true,
      "rating": 4.4,
    },
    {
      "imageUrl": "https://cf.bstatic.com/xdata/images/hotel/max1024x768/306822834.jpg?k=60c6ec1357ab11f34673192b9562dd62b5de266f943ecd6d5eadb09b30cc3fbf&o=&hp=1",
      "partnerName": "Cuarto La Esperanza",
      "price": "100",
      "type": "Cuarto Simple",
      "isAvailable": false,
      "rating": 4.3,
    },
    {
      "imageUrl": "https://cf.bstatic.com/xdata/images/hotel/max1024x768/466770860.jpg?k=074e77e35e0c13cff7599c783ea1ac544f17d7434f543294a7c2fd9910725c4f&o=&hp=1",
      "partnerName": "Cuarto El Prado",
      "price": "150",
      "type": "Habitación Doble",
      "isAvailable": true,
      "rating": 4.6,
    },
    {
      "imageUrl": "https://img-us-1.trovit.com/img1pe/fm1Vecjn8/fm1Vecjn8.13_11.jpg",
      "partnerName": "Cuarto El Sol",
      "price": "110",
      "type": "Suite Económica",
      "isAvailable": true,
      "rating": 4.5,
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
                    "Mejores precios",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  _buildFilterButton(
                    "Filtro",
                    onPressed: () {
                      _showFilterBottomSheet(context);
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: bestPriceInmuebles.length,
                itemBuilder: (context, index) {
                  final inmueble = bestPriceInmuebles[index];
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
          heightFactor: 0.7,
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
