import 'package:dio/dio.dart';

class DioConfig {
  // Método para obtener una instancia de Dio con configuración base
  static Dio getClient(String baseUrl) {
    return Dio(BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 5), // Tiempo de espera para conectar (5 segundos)
      receiveTimeout: const Duration(seconds: 3), // Tiempo de espera para recibir respuesta (3 segundos)
      headers: {
        'Content-Type': 'application/json', // Tipo de contenido predeterminado
      },
    ))
      ..interceptors.add(LogInterceptor(
        request: true,
        requestBody: true,
        responseBody: true,
        error: true,
      ));
  }
}
