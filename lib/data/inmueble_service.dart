import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ustay_project/core/utils/config.dart';
import 'package:ustay_project/domain/entities/inmueble.dart';

class InmuebleService {

  Future<List<Inmueble>> fetchInmuebles() async {
    final response = await http.get(Uri.parse('${Config.baseUrlInmueble}/listar'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as List;
      return data.map((json) => Inmueble.fromJson(json)).toList();
    } else {
      throw Exception('Error al cargar los inmuebles');
    }
  }
  Future<Inmueble> fetchInmuebleById(int id) async {
    final response = await http.get(Uri.parse('${Config.baseUrlInmueble}/listar/$id'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return Inmueble.fromJson(data);
    } else {
      throw Exception('Error al cargar el inmueble');
    }
  }
  Future<List<Map<String, dynamic>>> fetchInmuebleDetalles() async {
    try {
      final response = await http.get(Uri.parse('${Config.baseUrlInmueble}/detalle'));

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data.map((json) => json as Map<String, dynamic>).toList();
      } else {
        throw Exception('Error al cargar detalles de los inmuebles: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error al conectar con el servicio de inmuebles: $e');
    }
  }

}
