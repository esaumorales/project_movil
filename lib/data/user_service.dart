import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ustay_project/core/utils/config.dart';
import 'package:ustay_project/domain/entities/user.dart';

class UsuarioService {
  final String baseUrl = Config.baseUrlUsuario; // Define esto en tu archivo Config

  /// Obtiene todos los usuarios
  Future<List<Usuario>> listarTodo() async {
    final response = await http.get(Uri.parse('$baseUrl/lista'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Usuario.fromJson(json)).toList();
    } else if (response.statusCode == 204) {
      // Cuando no hay contenido
      return [];
    } else {
      throw Exception('Error al listar usuarios: ${response.reasonPhrase}');
    }
  }

  /// Obtiene un usuario por ID
  Future<Usuario> listarPorId(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/id/$id'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return Usuario.fromJson(data);
    } else if (response.statusCode == 404) {
      throw Exception('Usuario no encontrado.');
    } else {
      throw Exception('Error al obtener usuario: ${response.reasonPhrase}');
    }
  }

  /// Guarda un nuevo usuario
  Future<void> guardar(Usuario usuario) async {
    final response = await http.post(
      Uri.parse('$baseUrl/save'),
      body: json.encode(usuario.toJson()),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode != 201) {
      throw Exception('Error al guardar usuario: ${response.reasonPhrase}');
    }
  }

  /// Actualiza un usuario existente
  Future<void> actualizar(int id, Usuario usuario) async {
    final response = await http.put(
      Uri.parse('$baseUrl/update/$id'),
      body: json.encode(usuario.toJson()),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode != 200) {
      throw Exception('Error al actualizar usuario: ${response.reasonPhrase}');
    }
  }

  /// Elimina un usuario por ID
  Future<void> eliminar(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/delete/$id'));

    if (response.statusCode != 200) {
      throw Exception('Error al eliminar usuario: ${response.reasonPhrase}');
    }
  }
}
