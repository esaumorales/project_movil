import 'package:dio/dio.dart';
import 'package:ustay_project/core/utils/dio_config.dart';
import 'package:ustay_project/domain/models/partner.dart';

class PartnerService {
  final Dio _dio = DioConfig.getClient('http://10.0.2.2:8862/partner');

  /// Lista todos los partners
  Future<List<Partner>> listarTodo() async {
    try {
      final response = await _dio.get('/listar-todo');
      return (response.data as List).map((json) => Partner.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Error al listar partners: $e');
    }
  }

  /// Lista un partner por ID
  Future<Partner> listarPorId(int id) async {
    try {
      final response = await _dio.get('/listar/$id');
      return Partner.fromJson(response.data);
    } catch (e) {
      throw Exception('Error al obtener el partner: $e');
    }
  }
}
