import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  bool _isStepOne = true; // Controla si está en el paso 1 o 2

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
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Logo
                Image.asset(
                  'assets/images/common/app-logo.png',
                  height: 150,
                  width: 150,
                ),
                const SizedBox(height: 20),

                // Título
                Text(
                  'Ingrese sus credenciales',
                  style: GoogleFonts.kadwa(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 20),

                // Formulario según el paso
                if (_isStepOne) _buildStepOne() else _buildStepTwo(),

                const SizedBox(height: 20),

                // Botones de acción
                Row(
                  children: [
                    if (!_isStepOne)
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _isStepOne = true;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 15),
                          ),
                          child: const Text(
                            'Volver',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    if (!_isStepOne) const SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          if (_isStepOne) {
                            setState(() {
                              _isStepOne = false;
                            });
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Registro completado")),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 15),
                        ),
                        child: Text(
                          _isStepOne ? 'Siguiente' : 'Registrarte',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
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
                const SizedBox(height: 10),

                // Botones de Google y Facebook
                Column(
                  children: [
                    _buildSocialButton("Continuar con Google", "assets/images/common/google-logo.png"),
                    const SizedBox(height: 10),
                    _buildSocialButton("Continuar con Facebook", "assets/images/common/facebook-logo.png"),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Paso 1: Formulario con nombre y correo
  Widget _buildStepOne() {
    return Column(
      children: [
        _buildTextField("Nombre", _nameController),
        const SizedBox(height: 15),
        _buildTextField("Correo", _emailController),
      ],
    );
  }

  // Paso 2: Formulario con contraseña y confirmación
  Widget _buildStepTwo() {
    return Column(
      children: [
        _buildTextField("Contraseña", _passwordController, obscureText: true),
        const SizedBox(height: 15),
        _buildTextField("Repita contraseña", _confirmPasswordController, obscureText: true),
      ],
    );
  }

  // Botones sociales reutilizables
  Widget _buildSocialButton(String text, String iconPath) {
    return SizedBox(
      width: double.infinity, // Ocupa todo el ancho disponible
      child: OutlinedButton.icon(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("$text (solo diseño)")),
          );
        },
        icon: Image.asset(
          iconPath,
          width: 20,
          height: 20,
        ),
        label: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 15),
          side: const BorderSide(color: Colors.grey),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }

  // Campos de texto reutilizables con bordes
  Widget _buildTextField(String hintText, TextEditingController controller, {bool obscureText = false}) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: hintText,
        labelStyle: GoogleFonts.inter(color: Colors.black),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    );
  }
}
