import 'package:flutter/material.dart';
import 'package:ustay_project/data/person_service.dart';
import 'package:ustay_project/data/user_service.dart';

import 'package:ustay_project/domain/entities/person.dart';
import 'package:ustay_project/domain/entities/user.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterStepTwoScreen extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String middleName;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _telefonoController = TextEditingController();

  final PersonService _personService = PersonService();
  final UserService _userService = UserService();

  RegisterStepTwoScreen({
    required this.firstName,
    required this.lastName,
    required this.middleName,
  });

  void _registerUser(BuildContext context) async {
    if (_passwordController.text != _confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Las contraseñas no coinciden")),
      );
      return;
    }

    // Crear una nueva instancia de Persona
    final newPerson = Persona(
      nombre: firstName,
      apellido: lastName,
      correo: _emailController.text,
      telefono: _telefonoController.text,
      fechaRegistro: DateTime.now(),
    );

    try {
      // Guardar la Persona en el backend
      final personaId = await _personService.createPersona(newPerson);

      // Crear el Usuario con la información de registro
      final newUser = Usuario(
        nombre: firstName,
        apellido: lastName,
        correo: _emailController.text,
        contrasena: _passwordController.text,
        fechaRegistro: DateTime.now(),
      );

      // Guardar el Usuario en el backend
      await _userService.createUsuario(newUser);

      // Mostrar mensaje de éxito y navegar hacia atrás o a otra pantalla
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Usuario registrado exitosamente")),
      );
      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error al registrar usuario")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
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
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 12,
                    backgroundColor: Colors.grey[300],
                    child: Text(
                      '1',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  Container(
                    width: 40,
                    height: 2,
                    color: Colors.grey,
                  ),
                  CircleAvatar(
                    radius: 12,
                    backgroundColor: Colors.orange,
                    child: Text(
                      '2',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                "Complete la última información:",
                style: GoogleFonts.kadwa(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Nombre: $firstName $lastName $middleName",
                style: GoogleFonts.inter(fontSize: 16),
              ),
              SizedBox(height: 20),
              _buildTextField("Correo", _emailController),
              SizedBox(height: 15),
              _buildTextField("Teléfono", _telefonoController),
              SizedBox(height: 15),
              _buildTextField("Ingrese contraseña", _passwordController, obscureText: true),
              SizedBox(height: 15),
              _buildTextField("Repita contraseña", _confirmPasswordController, obscureText: true),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _registerUser(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  shadowColor: Colors.orangeAccent,
                  elevation: 5,
                ),
                child: Text(
                  "Registrarme",
                  style: GoogleFonts.mada(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String hintText, TextEditingController controller, {bool obscureText = false}) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: hintText,
        labelStyle: GoogleFonts.inter(color: Colors.black),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
    );
  }
}
