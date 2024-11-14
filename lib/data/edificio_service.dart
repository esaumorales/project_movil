import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ustay_project/core/utils/config.dart';
import 'package:ustay_project/domain/entities/edificio.dart';


class EdificioService {
  final String baseUrl = '${Config.baseUrlEdificio}/edificio-server';

  // Obtener todos los edificios
  Future<List<Edificio>> getAllEdificios() async {
    final response = await http.get(Uri.parse('$baseUrl/lista'));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Edificio.fromJson(json)).toList();
    } else {
      throw Exception('Error al cargar edificios');
    }
  }

  // Obtener edificio por ID
  Future<Edificio> getEdificioById(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/id/$id'));

    if (response.statusCode == 200) {
      return Edificio.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Edificio no encontrado');
    }
  }

  // Crear un nuevo edificio
  Future<String> createEdificio(Edificio edificio) async {
    final response = await http.post(
      Uri.parse('$baseUrl/save'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(edificio.toJson()),
    );

    if (response.statusCode == 201) {
      return 'Edificio guardado';
    } else {
      throw Exception('Error al crear edificio');
    }
  }

  // Actualizar un edificio existente
  Future<String> updateEdificio(int id, Edificio edificio) async {
    final response = await http.put(
      Uri.parse('$baseUrl/update/$id'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(edificio.toJson()),
    );

    if (response.statusCode == 200) {
      return 'Edificio actualizado';
    } else if (response.statusCode == 404) {
      return 'No existe el edificio';
    } else {
      throw Exception('Error al actualizar edificio');
    }
  }

  // Eliminar un edificio por ID
  Future<String> deleteEdificio(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/delete/$id'));

    if (response.statusCode == 200) {
      return 'Edificio eliminado';
    } else if (response.statusCode == 404) {
      return 'No existe el edificio';
    } else {
      throw Exception('Error al eliminar edificio');
    }
  }
}
