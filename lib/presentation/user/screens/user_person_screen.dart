import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ustay_project/core/utils/navigation_utils.dart';
import 'package:ustay_project/domain/models/user.dart';
import 'package:ustay_project/services/partner_service.dart';
import 'package:ustay_project/presentation/user/screens/user_dashboard_screen.dart';
import 'package:ustay_project/presentation/user/screens/user_favorite_screen.dart';
import 'package:ustay_project/domain/models/partner.dart';
import 'package:ustay_project/services/user_service.dart';
import 'package:ustay_project/shared/widgets/custom_footer.dart';

class UserPersonScreen extends StatefulWidget {
  @override
  _UserPersonScreenState createState() => _UserPersonScreenState();
}

class _UserPersonScreenState extends State<UserPersonScreen> {
  final PartnerService partnerService = PartnerService();
  final UsuarioService usuarioService = UsuarioService();

  int _currentIndex = 2; // Posición del perfil en el footer

  /// Obtiene los datos del usuario o partner
  Future<Map<String, dynamic>> _fetchUserData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final int userId = prefs.getInt('userId') ?? 0; // ID del usuario
      debugPrint("ID del usuario obtenido: $userId");

      if (userId == 0) {
        return {
          'nombre': 'No definido',
          'rol': 'Indefinido',
          'correo': 'No disponible',
          'telefono': 'No disponible',
        };
      }

      // Intenta obtener datos del Partner
      try {
        final Partner partner = await partnerService.listarPorId(userId);
        return {
          'nombre': "${partner.usuario?.nombre ?? 'Sin nombre'} ${partner.usuario?.apellido ?? ''}".trim(),
          'rol': 'Partner',
          'correo': partner.usuario?.correo ?? 'Sin correo',
          'telefono': partner.telefonoEmpresa ?? 'Sin teléfono',
          'direccion': partner.direccion ?? 'Sin dirección',
        };
      } catch (e) {
        debugPrint("El usuario no es un partner: $e");
      }

      // Si no es Partner, intenta obtener datos del Usuario
      try {
        final Usuario usuario = await usuarioService.listarPorId(userId);
        return {
          'nombre': "${usuario.nombre ?? 'Sin nombre'} ${usuario.apellido ?? ''}".trim(),
          'rol': 'Usuario',
          'correo': usuario.correo,
          'telefono': usuario.resenas != null && usuario.resenas!.isNotEmpty
              ? usuario.resenas!.first.telefono
              : 'Sin teléfono',
          'favoritos': usuario.favoritos != null && usuario.favoritos!.isNotEmpty
              ? usuario.favoritos!.map((fav) => fav.nombreFavorito).toList()
              : [],
        };
      } catch (e) {
        debugPrint("Error al obtener datos del usuario: $e");
      }

      return {
        'nombre': 'Esau Morales',
        'rol': 'Indefinido',
        'correo': 'No disponible',
        'telefono': 'No disponible',
      };
    } catch (e) {
      debugPrint("Error al obtener datos del usuario: $e");
      return {
        'nombre': 'Jose Morales',
        'rol': 'Indefinido',
        'correo': '1@gmail.com',
        'telefono': 'Aun no definido',
      };
    }
  }



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
      body: FutureBuilder<Map<String, dynamic>>(
        future: _fetchUserData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                "Error al cargar perfil: ${snapshot.error}",
                style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
            );
          }

          final userData = snapshot.data!;

          return SingleChildScrollView(
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
                  userData['nombre']!,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  userData['rol']!,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 30),
                // Secciones desplegables
                _buildExpandableSection(
                  title: "Datos generales",
                  iconPath: "assets/icons/icon-person.png",
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Nombre: ${userData['nombre']}", style: const TextStyle(fontSize: 16)),
                      Text("Rol: ${userData['rol']}", style: const TextStyle(fontSize: 16)),
                      Text("Correo: ${userData['correo']}", style: const TextStyle(fontSize: 16)),
                      Text("Teléfono: ${userData['telefono']}", style: const TextStyle(fontSize: 16)),
                      if (userData['rol'] == 'Usuario' && (userData['favoritos'] as List).isNotEmpty)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Favoritos:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                            ...userData['favoritos'].map((fav) => Text("- $fav", style: const TextStyle(fontSize: 16))),
                          ],
                        ),
                    ],
                  ),
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
                    final prefs = await SharedPreferences.getInstance();
                    await prefs.clear(); // Limpia todas las preferencias guardadas

                    // Redirigir al modo sin usuario
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      '/nonUserDashboard',
                          (Route<dynamic> route) => false,
                    );
                  },
                ),
                const SizedBox(height: 30),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: CustomFooter(
        currentIndex: _currentIndex,
        onTap: _onIconTap,
      ),
    );
  }

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
