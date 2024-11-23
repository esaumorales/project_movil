import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:ustay_project/core/utils/config.dart';

class UsuarioService {
  Future<Map<String, dynamic>> fetchUsuarioById(int userId) async {
    final url = Uri.parse('${Config.baseUrlUsuario}/id/$userId');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data.isEmpty) throw Exception("Usuario no encontrado en la base de datos.");
        return data;
      } else {
        throw Exception("Error en la API. Código de estado: ${response.statusCode}");
      }
    } catch (e, stackTrace) {
      // Imprime el error en la consola para depuración
      debugPrint("Error en fetchUsuarioById: $e\n$stackTrace");
      throw Exception("Error de conexión al cargar el usuario.");
    }
  }
}
