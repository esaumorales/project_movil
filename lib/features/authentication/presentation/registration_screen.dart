import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ustay_project/features/authentication/controller/auth_controller.dart';
import 'package:ustay_project/shared/button/custom_button.dart';
import 'package:ustay_project/domain/models/user.dart';
import 'package:ustay_project/shared/widgets/custom_social_media.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _fecharegistroController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  bool _isLoading = false;
  int _currentStep = 1;

  // Método para registrar usuario
  void _register() {
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

    // Crear el objeto Usuario
    Usuario newUser = Usuario(
      nombre: name,
      correo: email,
      contrasena: password,
      fechaRegistro: fecharegistro, // Asumiendo que se requiere este parámetro
    );

    // Usar el AuthController para registrar al usuario
    final authController = context.read<AuthController>();

    authController.register(newUser).then((_) {
      _showThankYouAnimation();
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: ${error.toString()}")),
      );
    }).whenComplete(() {
      setState(() {
        _isLoading = false;
      });
    });
  }

  void _showThankYouAnimation() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                color: Colors.black.withOpacity(0.6),
              ),
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

    Future.delayed(const Duration(seconds: 2, milliseconds: 500), () {
      Navigator.pop(context);
      Navigator.pushReplacementNamed(context, '/userDashboard');
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
                Image.asset(
                  'assets/images/common/app-logo.png',
                  height: 160,
                  width: 160,
                ),
                const SizedBox(height: 20),
                Text(
                  "Ingrese sus credenciales",
                  style: GoogleFonts.kadwa(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                if (_currentStep == 1)
                  _buildStepOne()
                else
                  _buildStepTwo(),
                const SizedBox(height: 20),
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
                            : _register,
                        isLoading: _isLoading,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
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
                            const SnackBar(content: Text("Google login")),
                          );
                        },
                      ),
                      const SizedBox(height: 20),
                      SocialMediaButton(
                        text: "Continuar con Facebook",
                        iconPath: "assets/images/common/facebook-logo.png",
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Google login")),
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

  Widget _buildStepOne() {
    return Column(
      children: [
        TextField(
          controller: _nameController,
          decoration: InputDecoration(labelText: 'Nombre completo'),
        ),
        const SizedBox(height: 20),
        TextField(
          controller: _emailController,
          decoration: InputDecoration(labelText: 'Correo electrónico'),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildStepTwo() {
    return Column(
      children: [
        TextField(
          controller: _passwordController,
          obscureText: true,
          decoration: InputDecoration(labelText: 'Contraseña'),
        ),
        const SizedBox(height: 20),
        TextField(
          controller: _confirmPasswordController,
          obscureText: true,
          decoration: InputDecoration(labelText: 'Confirmar Contraseña'),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
