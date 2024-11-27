import 'package:dio/dio.dart';

class DioClient {
  final Dio _dio;

  // Constructor que recibe un cliente Dio ya configurado
  DioClient(this._dio);

  // Método genérico para realizar una solicitud GET
  Future<Response> get(
      String endpoint, {
        Map<String, dynamic>? queryParameters,
        Options? options,
      }) async {
    try {
      return await _dio.get(
        endpoint,
        queryParameters: queryParameters,
        options: options,
      );
    } catch (e) {
      rethrow; // Lanza el error para que sea manejado por quien lo llame
    }
  }

  // Método genérico para realizar una solicitud POST
  Future<Response> post(
      String endpoint, {
        Map<String, dynamic>? data,
        Options? options,
      }) async {
    try {
      return await _dio.post(
        endpoint,
        data: data,
        options: options,
      );
    } catch (e) {
      rethrow;
    }
  }

  // Método genérico para realizar una solicitud PUT
  Future<Response> put(
      String endpoint, {
        Map<String, dynamic>? data,
        Options? options,
      }) async {
    try {
      return await _dio.put(
        endpoint,
        data: data,
        options: options,
      );
    } catch (e) {
      rethrow;
    }
  }

  // Método genérico para realizar una solicitud DELETE
  Future<Response> delete(
      String endpoint, {
        Map<String, dynamic>? data,
        Options? options,
      }) async {
    try {
      return await _dio.delete(
        endpoint,
        data: data,
        options: options,
      );
    } catch (e) {
      rethrow;
    }
  }
}
