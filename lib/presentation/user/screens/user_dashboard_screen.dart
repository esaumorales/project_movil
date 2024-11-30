import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ustay_project/core/utils/navigation_utils.dart';
import 'package:ustay_project/shared/card/room_carousel_cards.dart';
import 'package:ustay_project/shared/widgets/custom_footer.dart';
import 'package:ustay_project/shared/widgets/custom_header.dart';
import 'package:ustay_project/presentation/user/screens/user_favorite_screen.dart';
import 'package:ustay_project/presentation/user/screens/user_person_screen.dart';
import 'package:ustay_project/shared/card/small_card.dart';

class UserDashboardScreen extends StatefulWidget {
  @override
  _UserDashboardScreenState createState() => _UserDashboardScreenState();
}

class _UserDashboardScreenState extends State<UserDashboardScreen> {
  int _currentIndex = 0;

  // Datos estáticos de ejemplo
  final List<Map<String, dynamic>> staticRooms = [
    {
      "title": "Cerca a alameda",
      "price": "S/250",
      "partnerName": "Andres Perez",
      "description": "Cerca al centro",
      "imageUrl": "https://http2.mlstatic.com/D_NQ_NP_2X_791141-MPE79945196099_102024-N.webp",
      "rating": 4.8,
      "services": [Icons.local_laundry_service, Icons.tv, Icons.wifi],
    },
    {
      "title": "Cerca al parque",
      "price": "S/150",
      "partnerName": "Juan P.",
      "description": "5 min de la universidad",
      "imageUrl": "https://i0.wp.com/myhogar.pe/wp-content/uploads/2023/11/1-3.png?resize=1170%2C785&ssl=1",
      "rating": 4.9,
      "services": [Icons.home, Icons.kitchen, Icons.pool],
    },
    {
      "title": "Shalom",
      "price": "S/150",
      "partnerName": "Moises P.",
      "description": "Zona A",
      "imageUrl": "https://cdn2.infocasas.com.uy/repo/img/9bea0dd4ff832d1b2a5d8b09e3269c974ddfa5ed.jpg",
      "rating": 4.8,
      "services": [Icons.home, Icons.kitchen, Icons.pool],
    },
    {
      "title": "Habitación Económica",
      "price": "S/250",
      "partnerName": "Jesus P.",
      "description": "Sin gatos",
      "imageUrl": "https://http2.mlstatic.com/D_NQ_NP_2X_809754-MPE76838007979_062024-N.webp",
      "rating": 4.5,
      "services": [Icons.home, Icons.kitchen, Icons.pool],
    },
  ];

  final List<Map<String, dynamic>> staticSmallRooms = [
    {
      "title": "Costado de Roma",
      "price": "S/230",
      "partnerName": "Luis Perez",
      "imageUrl": "https://img-us-1.trovit.com/img1pe/1A1YSXCVs1c/1A1YSXCVs1c.6_11.jpg",
    },
    {
      "title": "Cuarto B",
      "price": "S/300",
      "partnerName": "Partner 2",
      "imageUrl": "https://img-us-1.trovit.com/img1pe/1A1YSXCVs1c/1A1YSXCVs1c.11_11.jpg",
    },
  ];

  final List<Map<String, dynamic>> popularRooms = [
    {
      "title": "Lobaton",
      "price": "S/180",
      "partnerName": "Alex V.",
      "imageUrl": "https://i0.wp.com/myhogar.pe/wp-content/uploads/2023/11/5-1.png?resize=1170%2C785&ssl=1",
      "rating": 4.9,
    },
    {
      "title": "Inti",
      "price": "S/200",
      "partnerName": "Asin",
      "imageUrl": "https://img10.naventcdn.com/avisos/111/01/44/94/85/56/360x266/1493855550.jpg?isFirstImage=true",
      "rating": 4.8,
    },
  ];

  final List<Map<String, dynamic>> bestPriceRooms = [
    {
      "title": "Caseta",
      "price": "S/120",
      "partnerName": "Juanito H.",
      "imageUrl": "https://img10.naventcdn.com/avisos/111/00/59/34/58/17/360x266/309993962.jpg?isFirstImage=true",
      "rating": 4.2,
    },
    {
      "title": "Inti",
      "price": "S/130",
      "partnerName": "Alexis del Castillo",
      "imageUrl": "assets/images/common/cards/card3.jpg",
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
          imageUrl: room["imageUrl"] ?? 'assets/images/common/cards/cards2.jpg',
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
