import 'package:flutter/material.dart';
import 'package:ustay_project/core/utils/navigation_utils.dart';
import 'package:ustay_project/shared/widgets/custom_footer.dart';
import 'package:ustay_project/presentation/user/screens/user_dashboard_screen.dart';
import 'package:ustay_project/presentation/user/screens/user_person_screen.dart';
import 'package:ustay_project/shared/card/large_card.dart';
import 'package:ustay_project/shared/filter/filter_dialog.dart';

class UserFavoriteScreen extends StatefulWidget {
  @override
  _UserFavoriteScreenState createState() => _UserFavoriteScreenState();
}

class _UserFavoriteScreenState extends State<UserFavoriteScreen> {
  int _currentIndex = 1;

  // Lista de inmuebles favoritos (con datos ficticios realistas)
  final List<Map<String, dynamic>> favoriteInmuebles = [
    {
      "imageUrl": "https://example.com/room_14.jpg",
      "partnerName": "Residencial Sunset",
      "price": "250",
      "type": "Suite Premium",
      "isAvailable": true,
      "rating": 4.9,
      "isFavorite": true,
    },
    {
      "imageUrl": "https://example.com/room_15.jpg",
      "partnerName": "Hotel Primavera",
      "price": "180",
      "type": "Habitación Estándar",
      "isAvailable": false,
      "rating": 4.6,
      "isFavorite": true,
    },
    {
      "imageUrl": "https://example.com/room_16.jpg",
      "partnerName": "Hostal La Paz",
      "price": "120",
      "type": "Habitación Económica",
      "isAvailable": true,
      "rating": 4.3,
      "isFavorite": true,
    },
  ];

  void _onIconTap(int index) {
    setState(() {
      _currentIndex = index;
    });

    switch (index) {
      case 0:
        navigateWithoutAnimation(context, UserDashboardScreen());
        break;
      case 1:
        navigateWithoutAnimation(context, UserFavoriteScreen());
        break;
      case 2:
        navigateWithoutAnimation(context, UserPersonScreen());
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120),
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () {
                    Navigator.pushNamed(context, '/userDashboard');
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Tus favoritos",
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
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: favoriteInmuebles.map((inmueble) {
              return Column(
                children: [
                  Stack(
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
                      // Ícono de corazón rojo en la esquina superior derecha
                      Positioned(
                        top: 8,
                        right: 8,
                        child: Icon(
                          Icons.favorite,
                          color: inmueble["isFavorite"] ? Colors.red : Colors.grey,
                          size: 24,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                ],
              );
            }).toList(),
          ),
        ),
      ),
      bottomNavigationBar: CustomFooter(
        currentIndex: _currentIndex,
        onTap: _onIconTap,
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
