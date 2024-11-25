import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ustay_project/core/utils/navigation_utils.dart';
import 'package:ustay_project/core/widgets/custom_footer.dart';
import 'package:ustay_project/core/widgets/custom_header.dart';
import 'package:ustay_project/presentation/user/screens/user_favorite_screen.dart';
import 'package:ustay_project/presentation/user/screens/user_person_screen.dart';
import 'package:ustay_project/presentation/widgets/room_carousel_cards.dart';
import 'package:ustay_project/presentation/widgets/small_card.dart';

class UserDashboardScreen extends StatefulWidget {
  @override
  _UserDashboardScreenState createState() => _UserDashboardScreenState();
}

class _UserDashboardScreenState extends State<UserDashboardScreen> {
  int _currentIndex = 0;

  // Datos estáticos de ejemplo
  final List<Map<String, dynamic>> staticRooms = [
    {
      "title": "Habitación Deluxe",
      "price": "S/250",
      "partnerName": "Juan Perez.",
      "description": "Cerca al centro",
      "imageUrl": "https://example.com/room_1.jpg",
      "rating": 4.8,
      "services": [Icons.local_laundry_service, Icons.tv, Icons.wifi],
    },
    {
      "title": "Habitación Económica",
      "price": "S/150",
      "partnerName": "Juan P.",
      "description": "Zona tranquila",
      "imageUrl": "https://example.com/room_2.jpg",
      "rating": 4.5,
      "services": [Icons.home, Icons.kitchen, Icons.pool],
    },
    {
      "title": "Habitación Duo",
      "price": "S/220",
      "partnerName": "Olimpio R.",
      "description": "Cerca al centro",
      "imageUrl": "https://example.com/room_1.jpg",
      "rating": 4.8,
      "services": [Icons.local_laundry_service, Icons.tv, Icons.wifi],
    },

  ];

  final List<Map<String, dynamic>> staticSmallRooms = [
    {
      "title": "Cuarto A",
      "price": "S/200",
      "partnerName": "Partner 1",
      "imageUrl": "https://example.com/room_3.jpg",
    },
    {
      "title": "Cuarto B",
      "price": "S/300",
      "partnerName": "Partner 2",
      "imageUrl": "https://example.com/room_4.jpg",
    },
  ];

  final List<Map<String, dynamic>> popularRooms = [
    {
      "title": "Habitación Popular 1",
      "price": "S/180",
      "partnerName": "Socio 1",
      "imageUrl": "https://example.com/room_5.jpg",
      "rating": 4.7,
    },
    {
      "title": "Habitación Popular 2",
      "price": "S/220",
      "partnerName": "Socio 2",
      "imageUrl": "https://example.com/room_6.jpg",
      "rating": 4.6,
    },
  ];

  final List<Map<String, dynamic>> bestPriceRooms = [
    {
      "title": "Habitación Económica 1",
      "price": "S/120",
      "partnerName": "Socio 3",
      "imageUrl": "https://example.com/room_7.jpg",
      "rating": 4.2,
    },
    {
      "title": "Habitación Económica 2",
      "price": "S/130",
      "partnerName": "Socio 4",
      "imageUrl": "https://example.com/room_8.jpg",
      "rating": 4.3,
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
      appBar: CustomHeader(title: "Habitaciones"),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 200,
                  decoration: const BoxDecoration(
                    color: Color(0xFF010B1A),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(100),
                      bottomRight: Radius.circular(100),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildSectionHeader(
                        title: "Lo mejor de lo mejor",
                        isSpecialFont: true,
                      ),
                      const SizedBox(height: 16),
                      RoomCarouselWithCards(rooms: staticRooms), // Nuevo carrusel de tarjetas
                      const SizedBox(height: 32),
                      _buildSectionHeader(
                        title: "Lista de inmuebles",
                        isSpecialFont: false,
                        onTap: () {
                          Navigator.pushNamed(context, '/userInmueble');
                        },
                      ),
                      const SizedBox(height: 16),
                      _buildSmallRoomList(staticSmallRooms),
                      const SizedBox(height: 32),
                      _buildSectionHeader(
                        title: "Los más populares",
                        isSpecialFont: false,
                        onTap: () {
                          Navigator.pushNamed(context, '/userPopular');
                        },
                      ),
                      const SizedBox(height: 16),
                      _buildSmallRoomList(popularRooms),
                      const SizedBox(height: 32),
                      _buildSectionHeader(
                        title: "Los mejores precios",
                        isSpecialFont: false,
                        onTap: () {
                          Navigator.pushNamed(context, '/userPrice');
                        },
                      ),
                      const SizedBox(height: 16),
                      _buildSmallRoomList(bestPriceRooms),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomFooter(
        currentIndex: _currentIndex,
        onTap: _onIconTap,
      ),
    );
  }

  Widget _buildSmallRoomList(List<Map<String, dynamic>> rooms) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: rooms.map((room) {
        return SmallCard(
          title: room["title"] ?? "Sin título",
          price: room["price"] ?? "S/0.00",
          partnerName: room["partnerName"] ?? "Sin partner",
          rating: room["rating"] ?? 0.0,
          imageUrl: room["imageUrl"] ?? 'assets/images/common/room_placeholder.png',
          onTap: () {
            debugPrint("Habitación seleccionada: ${room["title"]}");
          },
        );
      }).toList(),
    );
  }

  Widget _buildSectionHeader({
    required String title,
    required bool isSpecialFont,
    VoidCallback? onTap,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: isSpecialFont
              ? GoogleFonts.spicyRice(
            fontSize: 20,
            color: const Color(0xFFF3E652),
            fontWeight: FontWeight.bold,
          )
              : const TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        if (onTap != null)
          GestureDetector(
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.orange, width: 2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                "Ver todo",
                style: TextStyle(fontSize: 14, color: Colors.orange),
              ),
            ),
          ),
      ],
    );
  }
}
