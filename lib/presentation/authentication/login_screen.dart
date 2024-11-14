import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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

  Future<void> _login() async {
    // Obtén el email y contraseña ingresados
    String email = _emailController.text;
    String password = _passwordController.text;

    try {
      // Llama a `authenticate` en `AuthService`
      final user = await _authService.authenticate(email, password);

      if (user == null) {
        // Si el usuario no se encuentra, muestra un mensaje de error
        setState(() {
          errorMessage = 'Correo o contraseña incorrectos';
        });
      } else {
        // Si el usuario existe, redirige según su rol
        setState(() {
          errorMessage = '';
        });

        String userRole = 'user'; // Asigna el rol del usuario si está disponible
        if (userRole == 'user') {
          Navigator.pushNamed(context, '/userDashboard');
        } else if (userRole == 'partner') {
          Navigator.pushNamed(context, '/partnerDashboard');
        }
      }
    } catch (e) {
      // Maneja cualquier error de red o autenticación
      setState(() {
        errorMessage = 'Error en la autenticación. Inténtalo de nuevo.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xFFE9E9E9),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Imagen del logo
                  Image.asset(
                    'assets/images/common/app-logo.png',
                    width: 150,
                    height: 150,
                  ),
                  const SizedBox(height: 20),

                  // Texto alineado a la izquierda
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Text(
                        'Ingrese sus credenciales',
                        style: GoogleFonts.kadwa(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Campo de Email
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        fillColor: Color(0xFFE9E9E9),
                        filled: true,
                        hintText: 'Correo',
                        contentPadding: const EdgeInsets.only(left: 20.0),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 2.0),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(8),
                            bottomRight: Radius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Campo de Contraseña
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        fillColor: Color(0xFFE9E9E9),
                        filled: true,
                        hintText: 'Contraseña',
                        contentPadding: const EdgeInsets.only(left: 20.0),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 2.0),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(8),
                            bottomRight: Radius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Mensaje de error
                  if (errorMessage.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Text(
                        errorMessage,
                        style: TextStyle(color: Colors.red, fontSize: 14),
                      ),
                    ),
                  const SizedBox(height: 12),

                  // Botón de Ingresar
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: GestureDetector(
                      onTap: _login,
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: const Color(0xFFE16B15),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Center(
                          child: Text(
                            'Ingresar',
                            style: TextStyle(
                              color: Color(0xffF0EDD4),
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Olvidó su contraseña y O bien en una columna
                  Column(
                    children: [
                      const Text(
                        '¿Olvidó su contraseña?',
                        style: TextStyle(
                          color: Color(0xFF00006B),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8), // Espacio entre los textos
                      const Text(
                        'O bien',
                        style: TextStyle(
                          color: Color(0xFF000000),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Botón de Google
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: GestureDetector(
                          onTap: () {
                            // Lógica para autenticación con Google
                          },
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(1),
                              color: Color(0xFFE9E9E9),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/common/google-logo.png',
                                  width: 20,
                                  height: 20,
                                ),
                                const SizedBox(width: 10),
                                const Text(
                                  'Continuar con Google',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      // Botón de Facebook
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: GestureDetector(
                          onTap: () {
                            // Lógica para autenticación con Facebook
                          },
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(1),
                              color: Color(0xFFE9E9E9),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/common/facebook-logo.png',
                                  width: 20,
                                  height: 20,
                                ),
                                const SizedBox(width: 10),
                                const Text(
                                  'Continuar con Facebook',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
