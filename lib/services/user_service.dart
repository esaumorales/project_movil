import 'package:dio/dio.dart';
import 'package:ustay_project/core/utils/dio_config.dart';
import 'package:ustay_project/domain/models/user.dart';

class UsuarioService {
  final Dio _dio = DioConfig.getClient('http://10.0.2.2:8861/apiusuario');

  /// Obtiene todos los usuarios
  Future<List<Usuario>> listarTodo() async {
    try {
      final response = await _dio.get('/lista');
      return (response.data as List).map((json) => Usuario.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Error al listar usuarios: $e');
    }
  }

  /// Obtiene un usuario por ID
  Future<Usuario> listarPorId(int id) async {
    try {
      final response = await _dio.get('/id/$id');
      return Usuario.fromJson(response.data);
    } catch (e) {
      throw Exception('Error al obtener usuario: $e');
    }
  }

  /// Guarda un nuevo usuario
  Future<void> guardar(Usuario usuario) async {
    try {
      await _dio.post('/save', data: usuario.toJson());
    } catch (e) {
      throw Exception('Error al guardar usuario: $e');
    }
  }

  /// Actualiza un usuario existente
  Future<void> actualizar(int id, Usuario usuario) async {
    try {
      await _dio.put('/update/$id', data: usuario.toJson());
    } catch (e) {
      throw Exception('Error al actualizar usuario: $e');
    }
  }

  /// Elimina un usuario por ID
  Future<void> eliminar(int id) async {
    try {
      await _dio.delete('/delete/$id');
    } catch (e) {
      throw Exception('Error al eliminar usuario: $e');
    }
  }
}
