import 'package:flutter/material.dart';
import 'package:ustay_project/core/utils/navigation_utils.dart';
import 'package:ustay_project/core/widgets/custom_footer.dart';
import 'package:ustay_project/presentation/user/screens/user_bag_screen.dart';
import 'package:ustay_project/presentation/user/screens/user_dashboard_screen.dart';
import 'package:ustay_project/presentation/user/screens/user_favorite_screen.dart';
import 'package:ustay_project/presentation/user/screens/user_navigator_screen.dart';

class UserPersonScreen extends StatefulWidget {
  @override
  _UserPersonScreenState createState() => _UserPersonScreenState();
}

class _UserPersonScreenState extends State<UserPersonScreen> {
  int _currentIndex = 2; // Posición del perfil en el footer

  void _onIconTap(int index) {
    setState(() {
      _currentIndex = index;
    });

    // Navegación según el índice seleccionado
    switch (index) {
//      case 0:
// navigateWithoutAnimation(context, UserNavigatorScreen());
//                break;
//      case 1:
//        navigateWithoutAnimation(context, UserBagScreen());
//        break;
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
      backgroundColor: Colors.purple.shade50,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            // Imagen de perfil
            CircleAvatar(
              radius: 60,
              backgroundImage: const AssetImage("assets/images/common/avatar.png"),
              backgroundColor: Colors.grey.shade200,
            ),
            const SizedBox(height: 20),
            // Nombre del usuario y rol
            Text(
              "Nombre de Usuario",
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const Text(
              "Usuario registrado",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 30),
            // Información adicional
            _buildInfoCard("Your Email", "correo@ejemplo.com", Icons.email),
            _buildInfoCard("Registration Date", "2024-11-15", Icons.calendar_today),
            const SizedBox(height: 30),
          ],
        ),
      ),
      bottomNavigationBar: CustomFooter(
        currentIndex: _currentIndex,
        onTap: _onIconTap,
      ),
    );
  }

  // Tarjetas de información
  Widget _buildInfoCard(String label, String? value, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: ListTile(
          leading: Icon(icon, color: Colors.purple),
          title: Text(label, style: const TextStyle(fontSize: 14, color: Colors.grey)),
          subtitle: Text(
            value ?? "No disponible",
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
