import 'package:dio/dio.dart';
import 'package:ustay_project/core/utils/dio_config.dart';
import 'package:ustay_project/domain/models/especificacion.dart';

class EspecificacionesService {
  final Dio _dio = DioConfig.getClient('http://10.0.2.2:8866/especificacion');

  /// Lista todas las especificaciones
  Future<List<Especificacion>> listar() async {
    try {
      final response = await _dio.get('/listar');
      return (response.data as List).map((json) => Especificacion.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Error al listar especificaciones: $e');
    }
  }

  /// Guarda nuevas especificaciones
  Future<void> guardar(Especificacion especificacion) async {
    try {
      await _dio.post('/save', data: especificacion.toJson());
    } catch (e) {
      throw Exception('Error al guardar especificación: $e');
    }
  }
}
