import 'package:dio/dio.dart';
import 'package:ustay_project/core/utils/dio_config.dart';

class ResenaService {
  final Dio _dio = DioConfig.getClient('http://10.0.2.2:8868/resenas');

  /// Obtiene la calificación promedio de un inmueble por ID
  Future<double> fetchCalificacionPromedio(int inmuebleId) async {
    try {
      final response = await _dio.get('/listar');
      final List<dynamic> data = response.data as List;
      final resenas = data.where((item) => item['inmueble_id'] == inmuebleId).toList();

      if (resenas.isEmpty) return 0.0;

      final total = resenas
          .map((r) => double.parse(r['calificacion'].toString()))
          .reduce((a, b) => a + b);

      return total / resenas.length;
    } catch (e) {
      throw Exception('Error al obtener las reseñas: $e');
    }
  }
}
