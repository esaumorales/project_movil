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
      // Si la autenticación es exitosa, el backend devuelve un JSON del usuario
      final data = jsonDecode(response.body);
      if (data == true) {
        // Aquí puedes devolver un objeto Usuario o solo true, dependiendo de tu lógica
        return Usuario(
          correo: email,
          contrasena: password,
          nombre: '', // Opcional, según tu backend
          apellido: '',
          fechaRegistro: DateTime.now(),
        );
      } else {
        // Si las credenciales son incorrectas
        return null;
      }
    } else {
      // Si ocurre algún error en la solicitud
      throw Exception('Error en la autenticación');
    }
  }
}
