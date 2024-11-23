import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ustay_project/core/utils/config.dart';

class EspecificacionesService {
  Future<List<String>> fetchEspecificaciones(int inmuebleId) async {
    final response = await http.get(Uri.parse('${Config.baseUrlEspecificaciones}/listar'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data
          .where((item) => item['id'] == inmuebleId) // Filtrar imágenes del inmueble
          .map<String>((item) => item['url_img'] as String)
          .toList();
    } else {
      throw Exception('Error al obtener las especificaciones');
    }
  }
}
