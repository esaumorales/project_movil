import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ustay_project/core/widgets/custom_button.dart'; // Botón reutilizable
import 'package:ustay_project/core/widgets/custom_social_media.dart';
import 'package:ustay_project/data/auth_service.dart';
import 'package:ustay_project/domain/entities/user.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _fecharegistroController = TextEditingController();

  final AuthService _authService = AuthService(); // Instancia de AuthService
  bool _isLoading = false; // Estado de carga
  int _currentStep = 1; // Controla el paso actual

  // Método para registrar usuario
  Future<void> _register() async {
    String name = _nameController.text.trim();
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();
    String fecharegistro = _fecharegistroController.text.trim();
    String confirmPassword = _confirmPasswordController.text.trim();

    // Validación básica
    if (name.isEmpty || email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Por favor complete todos los campos")),
      );
      return;
    }

    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Las contraseñas no coinciden")),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      Usuario newUser = Usuario(
        nombre: name,
        correo: email,
        contrasena: password,
        fechaRegistro:  fecharegistro,
      );

      await _authService.register(newUser); // Llamada al servicio de registro

      // Muestra la animación de agradecimiento
      _showThankYouAnimation();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: ${e.toString()}")),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  // Muestra la animación de agradecimiento con efecto especial
  void _showThankYouAnimation() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Fondo oscuro con opacidad
              Container(
                color: Colors.black.withOpacity(0.6),
              ),
              // Animación de entrada especial
              TweenAnimationBuilder(
                tween: Tween<double>(begin: 0.0, end: 1.0),
                duration: const Duration(seconds: 2),
                curve: Curves.easeOut,
                builder: (context, double scale, child) {
                  return Transform.scale(
                    scale: scale,
                    child: Opacity(
                      opacity: scale,
                      child: child,
                    ),
                  );
                },
                child: Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.orange,
                        size: 80,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "¡Registro Exitoso!",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.kadwa(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Gracias por unirte a nosotros",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.kadwa(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );

    // Después de 2.5 segundos, redirigir a la página principal
    Future.delayed(const Duration(seconds: 2, milliseconds: 500), () {
      Navigator.pop(context); // Cierra el diálogo
      Navigator.pushReplacementNamed(context, '/userDashboard'); // Redirige a la página principal
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
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
                  height: 160,
                  width: 160,
                ),
                const SizedBox(height: 20),

                // Título
                Text(
                  "Ingrese sus credenciales",
                  style: GoogleFonts.kadwa(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),

                // Contenido del paso actual
                if (_currentStep == 1)
                  _buildStepOne()
                else
                  _buildStepTwo(),

                const SizedBox(height: 20),

                // Botones de acción
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (_currentStep == 2)
                      Expanded(
                        child: CustomButton(
                          text: 'Volver',
                          onPressed: () {
                            setState(() {
                              _currentStep = 1;
                            });
                          },
                          backgroundColor: Colors.grey,
                        ),
                      ),
                    if (_currentStep == 2) const SizedBox(width: 10),
                    Expanded(
                      child: CustomButton(
                        text: _currentStep == 1 ? 'Siguiente' : 'Registrarte',
                        onPressed: _currentStep == 1
                            ? () {
                          setState(() {
                            _currentStep = 2;
                          });
                        }
                            : _register, // Llama al método _register en el paso 2
                        isLoading: _isLoading,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Redes sociales (solo en el paso 1)
                if (_currentStep == 1)
                  Column(
                    children: [
                      Row(
                        children: [
                          const Expanded(
                            child: Divider(color: Colors.grey, thickness: 1),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              "O iniciar con",
                              style: GoogleFonts.kadwa(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const Expanded(
                            child: Divider(color: Colors.grey, thickness: 1),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
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
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Paso 1: Nombre y Correo
  Widget _buildStepOne() {
    return Column(
      children: [
        _buildTextField("Nombre", _nameController),
        const SizedBox(height: 15),
        _buildTextField("Correo", _emailController),
      ],
    );
  }

  // Paso 2: Contraseña y Confirmación
  Widget _buildStepTwo() {
    return Column(
      children: [
        _buildTextField("Contraseña", _passwordController, obscureText: true),
        const SizedBox(height: 15),
        _buildTextField("Repita contraseña", _confirmPasswordController, obscureText: true),
      ],
    );
  }

  // Campo de texto reutilizable
  Widget _buildTextField(String label, TextEditingController controller, {bool obscureText = false}) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
