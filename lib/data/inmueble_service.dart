import 'package:dio/dio.dart';
import 'package:ustay_project/core/utils/config.dart';
import 'package:ustay_project/domain/cuartos/inmueble.dart';

class InmuebleService {
  final Dio _dio = Dio(BaseOptions(baseUrl: Config.baseUrlInmueble));

  /// Lista todos los inmuebles disponibles
  Future<List<Inmueble>> listarTodo() async {
    try {
      final response = await _dio.get('/listar-todo');
      return (response.data as List).map((json) => Inmueble.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Error al listar inmuebles: $e');
    }
  }

  /// Lista un inmueble por ID
  Future<Inmueble> listarPorId(int id) async {
    try {
      final response = await _dio.get('/listar/$id');
      return Inmueble.fromJson(response.data);
    } catch (e) {
      throw Exception('Error al obtener inmueble: $e');
    }
  }

  /// Guarda un nuevo inmueble
  Future<void> guardar(Inmueble inmueble) async {
    try {
      await _dio.post('/save', data: inmueble.toJson());
    } catch (e) {
      throw Exception('Error al guardar inmueble: $e');
    }
  }
}
