import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ustay_project/core/widgets/custom_button.dart'; // Widget para botones personalizados
import 'package:ustay_project/core/widgets/custom_social_media.dart';
import 'package:ustay_project/data/auth_service.dart';
import 'package:ustay_project/domain/entities/user.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthService _authService = AuthService();
  String errorMessage = '';
  bool _isLoading = false;

  // Validación de formato de correo
  bool _isValidEmail(String email) {
    final emailRegex = RegExp(r'^[a-zA-Z0-9._]+@[a-zA-Z0-9]+\.[a-zA-Z]+$');
    return emailRegex.hasMatch(email);
  }

  Future<void> _login() async {
    setState(() {
      _isLoading = true;
      errorMessage = '';
    });

    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      setState(() {
        _isLoading = false;
        errorMessage = 'Por favor ingresa correo y contraseña';
      });
      return;
    }

    if (!_isValidEmail(email)) {
      setState(() {
        _isLoading = false;
        errorMessage = 'Por favor ingresa un correo válido';
      });
      return;
    }

    try {
      Usuario? user = await _authService.login(email, password);
      if (user != null) {
        Navigator.pushNamed(context, '/userDashboard', arguments: user);
      }
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Logo
                Image.asset(
                  'assets/images/common/app-logo.png',
                  height: 150,
                ),
                const SizedBox(height: 20),

                // Título
                Text(
                  'Ingrese sus credenciales',
                  style: GoogleFonts.kadwa(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),

                // Campo de correo
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Correo',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                const SizedBox(height: 15),

                // Campo de contraseña
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                // Recordar inicio de sesión y recuperar contraseña
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: false, // Cambiar según tu lógica
                          onChanged: (value) {
                            // Implementar lógica para "Recordar inicio de sesión"
                          },
                        ),
                       // const Text('Recordar inicio de sesión'),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/sendEmail'); // Redirige a la ruta '/sendEmail'
                      },
                      child: const Text(
                        '¿Olvidó su contraseña?',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Botón de iniciar sesión
                CustomButton(
                  text: 'INICIAR SESIÓN',
                  onPressed: _isLoading ? null : _login,
                  isLoading: _isLoading,
                ),
                const SizedBox(height: 20),

                // Separador con "o iniciar con"
                Row(
                  children: [
                    const Expanded(
                      child: Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        'o iniciar con',
                        style: GoogleFonts.kadwa(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Expanded(
                      child: Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Botones de redes sociales
                SocialMediaButton(
                  text: "Continuar con Google",
                  iconPath: "assets/images/common/google-logo.png",
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Google seleccionado")),
                    );
                  },
                ),
                const SizedBox(height: 10),
                SocialMediaButton(
                  text: "Continuar con Facebook",
                  iconPath: "assets/images/common/facebook-logo.png",
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Facebook seleccionado")),
                    );
                  },
                ),
                const SizedBox(height: 20),

                // Registro
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/register'); // Redirige a la ruta '/register'
                  },
                  child: Text.rich(
                    TextSpan(
                      text: '¿No tienes una cuenta? ',
                      style: const TextStyle(color: Colors.grey),
                      children: [
                        TextSpan(
                          text: 'Regístrese ahora',
                          style: GoogleFonts.kadwa(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
