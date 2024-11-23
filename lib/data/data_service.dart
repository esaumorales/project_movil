import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ustay_project/core/utils/config.dart';
import 'package:ustay_project/domain/entities/inmueble.dart';
import 'package:ustay_project/domain/entities/room.dart';

class DataService {
  Future<List<Inmueble>> fetchInmuebles() async {
    final response = await http.get(Uri.parse('${Config.baseUrlInmueble}/listar'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Inmueble.fromJson(json)).toList();
    } else {
      throw Exception('Error al obtener los inmuebles');
    }
  }
}
