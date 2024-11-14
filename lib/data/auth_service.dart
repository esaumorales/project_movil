import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ustay_project/core/utils/config.dart';
import 'package:ustay_project/domain/entities/user.dart';

class AuthService {
  final String baseUrl = '${Config.baseUrlUsuario}/verify';

  // Método para autenticar al usuario
  Future<Usuario?> authenticate(String email, String password) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'correo': email,
        'contrasena': password,
      }),
    );

    if (response.statusCode == 200) {
      // El backend debería devolver los datos completos del usuario en JSON
      final data = jsonDecode(response.body);
      if (data is Map<String, dynamic>) {
        return Usuario.fromJson(data); // Devuelve el usuario con datos completos
      } else if (data == true) {
        // Si solo devuelve `true`, crea un Usuario básico (sin detalles)
        return Usuario(
          correo: email,
          contrasena: password,
          nombre: '',
          apellido: '',
          fechaRegistro: DateTime.now(),
        );
      } else {
        // Si las credenciales son incorrectas y devuelve `false`
        return null;
      }
    } else if (response.statusCode == 401) {
      // Si las credenciales son incorrectas, devuelve null
      return null;
    } else {
      // Si ocurre algún otro error
      throw Exception('Error en la autenticación');
    }
  }
}
