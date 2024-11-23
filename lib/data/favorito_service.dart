import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:ustay_project/core/utils/config.dart';
import 'package:ustay_project/domain/entities/inmueble.dart';

class FavoritoService {
  Future<List<Inmueble>> fetchFavoritos() async {
    final url = '${Config.baseURlFavorito}/listar';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List;
      return data.map((json) => Inmueble.fromJson(json)).toList();
    } else {
      throw Exception('Error al cargar los favoritos');
    }
  }

  Future<void> toggleFavorite(int inmuebleId) async {
    final url = '${Config.baseURlFavorito}/toggle/$inmuebleId';
    final response = await http.post(Uri.parse(url));

    if (response.statusCode != 200) {
      throw Exception('Error al actualizar favorito');
    }
  }
}
