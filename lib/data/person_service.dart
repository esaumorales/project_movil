import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ustay_project/core/utils/config.dart';
import 'package:ustay_project/domain/entities/person.dart';


class PersonService {
  final String baseUrl = '${Config.baseUrlPersona}/persona';

  // Obtener todas las personas
  Future<List<Persona>> getAllPersonas() async {
    final response = await http.get(Uri.parse('$baseUrl/lista'));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Persona.fromJson(json)).toList();
    } else {
      throw Exception('Error al cargar personas');
    }
  }

  // Obtener persona por ID
  Future<Persona> getPersonaById(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/id/$id'));

    if (response.statusCode == 200) {
      return Persona.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Persona no encontrada');
    }
  }

  // Crear una nueva persona
  Future<String> createPersona(Persona persona) async {
    final response = await http.post(
      Uri.parse('$baseUrl/save'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(persona.toJson()),
    );

    if (response.statusCode == 201) {
      return 'Persona guardada';
    } else {
      throw Exception('Error al crear persona');
    }
  }

  // Actualizar una persona existente
  Future<String> updatePersona(int id, Persona persona) async {
    final response = await http.put(
      Uri.parse('$baseUrl/update/$id'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(persona.toJson()),
    );

    if (response.statusCode == 200) {
      return 'Persona actualizada';
    } else if (response.statusCode == 404) {
      return 'No existe la persona';
    } else {
      throw Exception('Error al actualizar persona');
    }
  }

  // Eliminar una persona por ID
  Future<String> deletePersona(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/delete/$id'));

    if (response.statusCode == 200) {
      return 'Persona eliminada';
    } else if (response.statusCode == 404) {
      return 'No existe la persona';
    } else {
      throw Exception('Error al eliminar persona');
    }
  }
}
