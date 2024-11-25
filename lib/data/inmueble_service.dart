import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ustay_project/core/utils/config.dart';
import 'package:ustay_project/domain/entities/inmueble.dart';

class InmuebleService {
  final String baseUrl = Config.baseUrlInmueble;

  /// Lista todos los inmuebles disponibles
  Future<List<Inmueble>> listarTodo() async {
    final response = await http.get(Uri.parse('$baseUrl/listar-todo'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Inmueble.fromJson(json)).toList();
    } else {
      throw Exception('Error al listar inmuebles: ${response.reasonPhrase}');
    }
  }

  /// Lista un inmueble por ID
  Future<Inmueble> listarPorId(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/listar/$id'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return Inmueble.fromJson(data);
    } else {
      throw Exception('Error al obtener inmueble: ${response.reasonPhrase}');
    }
  }

  /// Guarda un nuevo inmueble
  Future<void> guardar(Inmueble inmueble) async {
    final response = await http.post(
      Uri.parse('$baseUrl/save'),
      body: json.encode({
        "descripcion": inmueble.descripcion,
        "disponibilidad": inmueble.disponibilidad,
        "precio": inmueble.precio,
        "n_cuarto": inmueble.nCuarto,
        "ilove": inmueble.ilove,
        "edificio": inmueble.edificio,
        "servicio": inmueble.servicio,
        "especificacion": inmueble.especificacion,
        "tipo": inmueble.tipo,
        "periodo": inmueble.periodo,
      }),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode != 201) {
      throw Exception('Error al guardar inmueble: ${response.reasonPhrase}');
    }
  }
}
