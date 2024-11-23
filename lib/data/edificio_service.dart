import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:ustay_project/core/utils/config.dart';
import 'package:ustay_project/domain/entities/edificio.dart';

class EdificioService {
  final String baseUrl = Config.baseUrlEdificio;

  // Obtener todos los edificios
  Future<List<Edificio>> getAllEdificios() async {
    final response = await http.get(Uri.parse('$baseUrl/listar'));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Edificio.fromJson(json)).toList();
    } else {
      throw Exception('Error al cargar edificios: ${response.body}');
    }
  }

  // Obtener edificio por ID
  Future<Map<String, dynamic>> fetchEdificioById(int idEdificio) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/listar/$idEdificio'));

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else if (response.statusCode == 404) {
        throw Exception("Edificio con ID $idEdificio no encontrado");
      } else {
        throw Exception("Error al obtener edificio: ${response.body}");
      }
    } catch (e) {
      debugPrint("Error en fetchEdificioById: $e");
      throw Exception("Error al conectar con el servicio de edificio: $e");
    }
  }

  // Crear un nuevo edificio


  // Actualizar un edificio existente


  // Eliminar un edificio por ID
  Future<String> deleteEdificio(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/delete/$id'));

    if (response.statusCode == 200) {
      return 'Edificio eliminado';
    } else if (response.statusCode == 404) {
      return 'No existe el edificio';
    } else {
      throw Exception('Error al eliminar edificio. Código: ${response.statusCode}');
    }
  }
}
