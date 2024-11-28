import 'package:dio/dio.dart';
import 'package:ustay_project/core/utils/dio_config.dart';
import 'package:ustay_project/domain/models/edificio.dart';

class EdificioService {
  final Dio _dio = DioConfig.getClient('http://10.0.2.2:8864/api/edificio');

  /// Lista todos los edificios
  Future<List<Edificio>> listarTodo() async {
    try {
      final response = await _dio.get('/listar-todo');

      if (response.data == null) {
        throw Exception('No data received from the server');
      }

      // Aseguramos que la respuesta sea una lista antes de procesarla
      return (response.data as List).map((json) => Edificio.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Error al listar edificios: $e');
    }
  }

  /// Lista un edificio por ID
  Future<Edificio> listarPorId(int id) async {
    try {
      final response = await _dio.get('/listar/$id');
      if (response.data == null) {
        throw Exception('No data received for the building with ID: $id');
      }
      return Edificio.fromJson(response.data);
    } catch (e) {
      throw Exception('Error al cargar edificio: $e');
    }
  }

  /// Guarda un nuevo edificio
  Future<void> guardar(Edificio edificio) async {
    try {
      await _dio.post('/save', data: edificio.toJson());
    } catch (e) {
      throw Exception('Error al guardar edificio: $e');
    }
  }
}
