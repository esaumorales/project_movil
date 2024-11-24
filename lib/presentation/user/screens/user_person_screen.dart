import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ustay_project/core/utils/navigation_utils.dart';
import 'package:ustay_project/core/widgets/custom_footer.dart';
import 'package:ustay_project/presentation/user/screens/user_dashboard_screen.dart';
import 'package:ustay_project/presentation/user/screens/user_favorite_screen.dart';

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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            // Imagen de perfil
            CircleAvatar(
              radius: 60,
              backgroundColor: Colors.grey.shade200,
              child: Icon(
                Icons.person,
                color: Colors.grey,
                size: 60,
              ),
            ),
            const SizedBox(height: 20),
            // Nombre del usuario y rol
            Text(
              "Olimpio R. Suarez M.",
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const Text(
              "Partner",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 30),
            // Secciones desplegables
            _buildExpandableSection(
              title: "Datos generales",
              iconPath: "assets/icons/icon-person.png",
              content: const Text("Aquí van los datos generales del usuario."),
            ),
            _buildExpandableSection(
              title: "Cambiar contraseña",
              iconPath: "assets/icons/icon-password.png",
              content: const Text("Aquí se colocará el formulario para cambiar la contraseña."),
            ),
            _buildExpandableSection(
              title: "Cambiar correo",
              iconPath: "assets/icons/icon-email.png",
              content: const Text("Aquí se colocará el formulario para cambiar el correo."),
            ),
            _buildSimpleButton(
              title: "Cerrar Sesión",
              iconPath: "assets/icons/icon-session.png",
              onTap: () async {
                // Eliminar datos del usuario almacenados localmente
                final prefs = await SharedPreferences.getInstance();
                await prefs.clear(); // Limpia todas las preferencias guardadas

                // Redirigir al modo sin usuario
                Navigator.of(context).pushNamedAndRemoveUntil(
                  '/nonUserDashboard', // Cambia esto según la ruta de tu pantalla inicial sin usuario
                      (Route<dynamic> route) => false,
                );
              },
            ),
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

  // Sección desplegable
  Widget _buildExpandableSection({
    required String title,
    required String iconPath,
    required Widget content,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
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
        child: ExpansionTile(
          leading: Image.asset(
            iconPath,
            width: 24,
            height: 24,
          ),
          title: Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: content,
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  // Botón simple (Cerrar Sesión)
  Widget _buildSimpleButton({
    required String title,
    required String iconPath,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
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
          child: Row(
            children: [
              Image.asset(
                iconPath,
                width: 24,
                height: 24,
              ),
              const SizedBox(width: 16),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
