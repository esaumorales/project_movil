import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ustay_project/core/utils/config.dart';
import 'package:ustay_project/domain/entities/especificacion.dart';

class EspecificacionesService {
  final String baseUrl = Config.baseUrlEspecificaciones;

  /// Lista todas las especificaciones
  Future<List<Especificacion>> listar() async {
    final response = await http.get(Uri.parse('$baseUrl/listar'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Especificacion.fromJson(json)).toList();
    } else {
      throw Exception('Error al listar especificaciones: ${response.reasonPhrase}');
    }
  }

  /// Guarda nuevas especificaciones
  Future<void> guardar(Especificacion especificacion) async {
    final response = await http.post(
      Uri.parse('$baseUrl/save'),
      body: json.encode({
        "url_img": especificacion.urlImg,
        "especificacion1": especificacion.especificacion1,
        "url_img2": especificacion.urlImg2,
        "especificacion2": especificacion.especificacion2,
        "url_img3": especificacion.urlImg3,
        "especificacion3": especificacion.especificacion3,
        "url_img4": especificacion.urlImg4,
        "especificacion4": especificacion.especificacion4,
        "url_img5": especificacion.urlImg5,
        "especificacion5": especificacion.especificacion5,
        "url_img6": especificacion.urlImg6,
        "especificacion6": especificacion.especificacion6,
      }),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode != 201) {
      throw Exception('Error al guardar especificación: ${response.reasonPhrase}');
    }
  }
}
