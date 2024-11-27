import 'package:dio/dio.dart';
import 'package:ustay_project/core/utils/dio_config.dart';
import 'package:ustay_project/domain/models/inmueble.dart';

class FavoritoService {
  final Dio _dio = DioConfig.getClient('http://10.0.2.2:8869/favoritos');

  /// Obtiene la lista de favoritos
  Future<List<Inmueble>> fetchFavoritos() async {
    try {
      final response = await _dio.get('/listar');
      return (response.data as List).map((json) => Inmueble.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Error al cargar los favoritos: $e');
    }
  }

  /// Alterna el estado de favorito para un inmueble
  Future<void> toggleFavorite(int inmuebleId) async {
    try {
      await _dio.post('/toggle/$inmuebleId');
    } catch (e) {
      throw Exception('Error al actualizar favorito: $e');
    }
  }
}
