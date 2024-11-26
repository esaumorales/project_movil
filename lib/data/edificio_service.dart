import 'package:dio/dio.dart';
import 'package:ustay_project/core/utils/config.dart';
import 'package:ustay_project/domain/edificio/edificio.dart';

class EdificioService {
  final Dio _dio = Dio(BaseOptions(baseUrl: Config.baseUrlEdificio));

  /// Lista todos los edificios
  Future<List<Edificio>> listarTodo() async {
    try {
      final response = await _dio.get('/listar-todo');
      return (response.data as List).map((json) => Edificio.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Error al listar edificios: $e');
    }
  }

  /// Lista un edificio por ID
  Future<Edificio> listarPorId(int id) async {
    try {
      final response = await _dio.get('/listar/$id');
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
