import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ustay_project/core/utils/config.dart';
import 'package:ustay_project/domain/entities/user.dart';


class UserService {
  final String baseUrl = '${Config.baseUrlUsuario}/apiusuario';

  // Obtener todos los usuarios
  Future<List<Usuario>> getAllUsuarios() async {
    final response = await http.get(Uri.parse('$baseUrl/lista'));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Usuario.fromJson(json)).toList();
    } else {
      throw Exception('Error al cargar usuarios');
    }
  }

  // Obtener usuario por ID
  Future<Usuario> getUsuarioById(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/id/$id'));

    if (response.statusCode == 200) {
      return Usuario.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Usuario no encontrado');
    }
  }

  // Verificar usuario con correo y contraseña
  Future<bool> verifyUser(String correo, String contrasena) async {
    final response = await http.post(
      Uri.parse('$baseUrl/verify'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'correo': correo, 'contrasena': contrasena}),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body) as bool;
    } else {
      throw Exception('Error al verificar usuario');
    }
  }

  // Crear un nuevo usuario
  Future<String> createUsuario(Usuario usuario) async {
    final response = await http.post(
      Uri.parse('$baseUrl/save'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(usuario.toJson()),
    );

    if (response.statusCode == 201) {
      return 'Usuario guardado';
    } else {
      throw Exception('Error al crear usuario');
    }
  }

  // Actualizar un usuario existente
  Future<String> updateUsuario(int id, Usuario usuario) async {
    final response = await http.put(
      Uri.parse('$baseUrl/update/$id'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(usuario.toJson()),
    );

    if (response.statusCode == 200) {
      return 'Usuario actualizado';
    } else if (response.statusCode == 404) {
      return 'No existe el usuario';
    } else {
      throw Exception('Error al actualizar usuario');
    }
  }

  // Eliminar un usuario por ID
  Future<String> deleteUsuario(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/delete/$id'));

    if (response.statusCode == 200) {
      return 'Usuario eliminado';
    } else if (response.statusCode == 404) {
      return 'No existe el usuario';
    } else {
      throw Exception('Error al eliminar usuario');
    }
  }
}