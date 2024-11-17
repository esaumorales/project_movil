import 'package:http/http.dart' as http;
import 'package:ustay_project/core/utils/config.dart';
import 'dart:convert';
import 'package:ustay_project/domain/entities/user.dart';

class AuthService {
  // Método para iniciar sesión
  Future<Usuario?> login(String correo, String contrasena) async {
    final url = Uri.parse('${Config.baseUrlUsuario}/login');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'correo': correo,
        'contrasena': contrasena,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return Usuario.fromJson(data);
    } else if (response.statusCode == 401) {
      throw Exception('Credenciales incorrectas. Verifica tu correo y contraseña.');
    } else {
      throw Exception('Error en el servidor. Intenta nuevamente más tarde.');
    }
  }

  // Método para registrar un nuevo usuario
  Future<void> register(Usuario usuario) async {
    final url = Uri.parse('${Config.baseUrlUsuario}/save');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(usuario.toJson()),
    );

    if (response.statusCode != 201) {
      throw Exception('Error al registrar usuario: ${response.body}');
    }
  }
}
