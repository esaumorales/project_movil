import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:ustay_project/features/authentication/controller/auth_controller.dart';
import 'package:ustay_project/shared/button/custom_button.dart';
import 'package:ustay_project/shared/widgets/custom_social_media.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authController = Provider.of<AuthController>(context);

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
                    labelText: 'Contraseña',
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
                  onPressed: authController.isLoading
                      ? null
                      : () async {
                    final email = _emailController.text.trim();
                    final password = _passwordController.text.trim();

                    if (email.isEmpty || password.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Por favor ingresa correo y contraseña.'),
                        ),
                      );
                      return;
                    }

                    final isValid = await authController.verify(email, password);
                    if (isValid) {
                      await authController.login(email, password);

                      if (authController.isUserAuthenticated) {
                        Navigator.pushReplacementNamed(context, '/userDashboard');
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(authController.errorMessage)),
                        );
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Credenciales inválidas.'),
                        ),
                      );
                    }
                  },
                  isLoading: authController.isLoading,
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
