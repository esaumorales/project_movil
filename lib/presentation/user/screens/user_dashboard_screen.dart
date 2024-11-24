import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ustay_project/core/utils/navigation_utils.dart';
import 'package:ustay_project/core/widgets/custom_footer.dart';
import 'package:ustay_project/core/widgets/custom_header.dart';
import 'package:ustay_project/presentation/user/screens/user_favorite_screen.dart';
import 'package:ustay_project/presentation/user/screens/user_person_screen.dart';

class UserDashboardScreen extends StatefulWidget {
  @override
  _UserDashboardScreenState createState() => _UserDashboardScreenState();
}

class _UserDashboardScreenState extends State<UserDashboardScreen> {
  int _currentIndex = 0;

  void _onIconTap(int index) {
    setState(() {
      _currentIndex = index;
    });

    // Navega según el índice seleccionado
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
      appBar: CustomHeader(title: "Habitaciones"), // Tu Header reutilizable
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Fondo redondeado en la parte superior
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
                      // Sección "Lo mejor de lo mejor"
                      _buildSectionHeader(
                        title: "Lo mejor de lo mejor",
                        isSpecialFont: true,
                      ),
                      const SizedBox(height: 16),
                      _buildPlaceholder(
                        text: "Aquí se pondrán las tarjetas de 'Lo mejor de lo mejor'.",
                        height: 200,
                      ),
                      const SizedBox(height: 32),

                      // Sección "Lista de inmuebles"
                      _buildSectionHeader(
                        title: "Lista de inmuebles",
                        isSpecialFont: false,
                        onTap: () {
                          Navigator.pushNamed(context, '/userInmueble');
                        },
                      ),
                      const SizedBox(height: 16),
                      _buildPlaceholder(
                        text: "Aquí se pondrán las tarjetas de 'Lista de inmuebles'.",
                        height: 120,
                      ),
                      const SizedBox(height: 32),

                      // Sección "Los más populares"
                      _buildSectionHeader(
                        title: "Los más populares",
                        isSpecialFont: false,
                        onTap: () {
                          Navigator.pushNamed(context, '/userPopular');
                        },
                      ),
                      const SizedBox(height: 16),
                      _buildPlaceholder(
                        text: "Aquí se pondrán las tarjetas de 'Los más populares'.",
                        height: 120,
                      ),
                      const SizedBox(height: 32),

                      // Sección "Los mejores precios"
                      _buildSectionHeader(
                        title: "Los mejores precios",
                        isSpecialFont: false,
                        onTap: () {
                          Navigator.pushNamed(context, '/userPrice');
                        },
                      ),
                      const SizedBox(height: 16),
                      _buildPlaceholder(
                        text: "Aquí se pondrán las tarjetas de 'Los mejores precios'.",
                        height: 120,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomFooter(
        currentIndex: _currentIndex, // Footer reutilizable
        onTap: _onIconTap,
      ),
    );
  }

  Widget _buildSectionHeader({
    required String title,
    required bool isSpecialFont,
    VoidCallback? onTap, // Cambiar a opcional
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: isSpecialFont
              ? GoogleFonts.spicyRice(
            fontSize: 20,
            color: const Color(0xFFF3E652), // Amarillo
            fontWeight: FontWeight.bold,
          )
              : const TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        if (onTap != null) // Renderizar solo si se proporciona `onTap`
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
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.orange,
                  fontWeight: FontWeight.normal, // Sin negrita
                ),
              ),
            ),
          ),
      ],
    );
  }


  Widget _buildPlaceholder({required String text, required double height}) {
    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.black54, fontSize: 14),
        ),
      ),
    );
  }
}