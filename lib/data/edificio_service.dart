import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ustay_project/core/utils/config.dart';
import 'package:ustay_project/domain/entities/edificio.dart';

class EdificioService {
  final String baseUrl = Config.baseUrlEdificio;

  /// Lista todos los edificios
  Future<List<Edificio>> listarTodo() async {
    final response = await http.get(Uri.parse('$baseUrl/listar-todo'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Edificio.fromJson(json)).toList();
    } else {
      throw Exception('Error al listar edificios: ${response.reasonPhrase}');
    }
  }

  /// Lista un edificio por ID
  Future<Edificio> listarPorId(int id) async {
    final url = Uri.parse('$baseUrl/listar/$id');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return Edificio.fromJson(data);
    } else {
      throw Exception('Error al cargar edificio: ${response.body}');
    }
  }

  /// Guarda un nuevo edificio
  Future<void> guardar(Edificio edificio) async {
    final response = await http.post(
      Uri.parse('$baseUrl/save'),
      body: json.encode({
        "idEdificio": edificio.idEdificio,
        "referenciaEdificio": edificio.referenciaEdificio,
        "direccion": edificio.direccion,
        "n_pisos": edificio.nPisos,
        "regla_casa": edificio.reglaCasa,
        "imagen": edificio.imagen,
        "url_map": edificio.urlMap,
        "partner": edificio.partner,
        "zona": edificio.zona,
      }),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode != 201) {
      throw Exception('Error al guardar edificio: ${response.reasonPhrase}');
    }
  }
}
