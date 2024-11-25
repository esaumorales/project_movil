import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ustay_project/core/utils/config.dart';
import 'package:ustay_project/domain/entities/partner.dart';

class PartnerService {
  final String baseUrl = Config.baseUrlPartner;

  /// Lista todos los partners
  Future<List<Partner>> listarTodo() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/listar-todo'));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((json) => Partner.fromJson(json)).toList();
      } else if (response.statusCode == 404) {
        throw Exception('No se encontraron partners');
      } else {
        throw Exception('Error inesperado al listar partners: ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception('Error de red al listar partners: $e');
    }
  }

  /// Lista un partner por ID
  Future<Partner> listarPorId(int id) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/listar/$id'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return Partner.fromJson(data);
      } else if (response.statusCode == 404) {
        throw Exception('El Partner con ID $id no existe');
      } else {
        throw Exception('Error inesperado al obtener el partner: ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception('Error de red al obtener el partner: $e');
    }
  }
}
