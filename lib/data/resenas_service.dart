import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ustay_project/core/utils/config.dart';

class ResenaService {
  Future<double> fetchCalificacionPromedio(int inmuebleId) async {
    final response = await http.get(Uri.parse('${Config.baseUrlResena}/listar'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      final resenas = data.where((item) => item['inmueble_id'] == inmuebleId).toList();
      if (resenas.isEmpty) return 0.0;
      final total = resenas.map((r) => double.parse(r['calificacion'])).reduce((a, b) => a + b);
      return total / resenas.length;
    } else {
      throw Exception('Error al obtener las reseñas');
    }
  }
}
