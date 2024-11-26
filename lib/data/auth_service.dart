import 'package:dio/dio.dart';
import 'package:ustay_project/core/utils/config.dart';
import 'package:ustay_project/domain/entities/user.dart';

class AuthService {
  final Dio _dio = Dio(BaseOptions(baseUrl: Config.baseUrlUsuario));

  // Método para iniciar sesión
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
        return Usuario.fromJson(response.data);
      } else if (response.statusCode == 401) {
        throw Exception('Credenciales incorrectas. Verifica tu correo y contraseña.');
      } else {
        throw Exception('Error en el servidor. Intenta nuevamente más tarde.');
      }
    } on DioError catch (e) {
      if (e.response != null && e.response?.statusCode == 401) {
        throw Exception('Credenciales incorrectas.');
      } else {
        throw Exception('Error en el servidor: ${e.message}');
      }
    }
  }

  // Método para registrar un nuevo usuario
  Future<void> register(Usuario usuario) async {
    try {
      final response = await _dio.post(
        '/save',
        data: usuario.toJson(),
      );

      if (response.statusCode != 201) {
        throw Exception('Error al registrar usuario: ${response.data}');
      }
    } on DioError catch (e) {
      throw Exception('Error en el servidor: ${e.message}');
    }
  }
}
