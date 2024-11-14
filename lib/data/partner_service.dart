import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ustay_project/core/utils/config.dart';
import 'package:ustay_project/domain/entities/partner.dart';


class PartnerService {
  final String baseUrl = '${Config.baseUrlPartner}/partner-server';

  // Obtener todos los partners
  Future<List<Partner>> getAllPartners() async {
    final response = await http.get(Uri.parse('$baseUrl/lista'));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Partner.fromJson(json)).toList();
    } else {
      throw Exception('Error al cargar partners');
    }
  }

  // Obtener partner por ID
  Future<Partner> getPartnerById(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/id/$id'));

    if (response.statusCode == 200) {
      return Partner.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Partner no encontrado');
    }
  }

  // Crear un nuevo partner
  Future<String> createPartner(Partner partner) async {
    final response = await http.post(
      Uri.parse('$baseUrl/save'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(partner.toJson()),
    );

    if (response.statusCode == 201) {
      return 'Partner guardado';
    } else {
      throw Exception('Error al crear partner');
    }
  }

  // Actualizar un partner existente
  Future<String> updatePartner(int id, Partner partner) async {
    final response = await http.put(
      Uri.parse('$baseUrl/update/$id'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(partner.toJson()),
    );

    if (response.statusCode == 200) {
      return 'Partner actualizado';
    } else if (response.statusCode == 404) {
      return 'No existe el partner';
    } else {
      throw Exception('Error al actualizar partner');
    }
  }

  // Eliminar un partner por ID
  Future<String> deletePartner(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/delete/$id'));

    if (response.statusCode == 200) {
      return 'Partner eliminado';
    } else if (response.statusCode == 404) {
      return 'No existe el partner';
    } else {
      throw Exception('Error al eliminar partner');
    }
  }
}
