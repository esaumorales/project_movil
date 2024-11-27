import 'package:dio/dio.dart';
import 'package:ustay_project/core/utils/dio_config.dart';
import 'package:ustay_project/domain/models/user.dart';

class AuthService {
  // Inicialización de Dio con la URL base específica para el servicio
  final Dio _dio = DioConfig.getClient('http://10.0.2.2:8861/apiusuario');

  /// Método para iniciar sesión
  Future<Usuario?> login(String correo, String contrasena) async {
    try {
      final response = await _dio.post(
        '/login',
        data: {
          'correo': correo,
          'contrasena': contrasena,
        },
      );

      if (response.statusCode == 200) {
        // Convertir la respuesta JSON en un objeto Usuario
        return Usuario.fromJson(response.data);
      } else {
        throw Exception('Error al iniciar sesión. Código: ${response.statusCode}');
      }
    } on DioException catch (e) {
      // Manejo detallado de errores de Dio
      if (e.response?.statusCode == 401) {
        throw Exception('Credenciales incorrectas. Verifica tu correo y contraseña.');
      } else {
        throw Exception('Error en el servidor: ${e.response?.data ?? e.message}');
      }
    }
  }

  /// Método para registrar un nuevo usuario
  Future<void> register(Usuario usuario) async {
    try {
      final response = await _dio.post(
        '/save',
        data: usuario.toJson(),
      );

      if (response.statusCode != 201) {
        throw Exception('Error al registrar usuario: ${response.data}');
      }
    } on DioException catch (e) {
      throw Exception('Error en el servidor: ${e.response?.data ?? e.message}');
    }
  }
}
