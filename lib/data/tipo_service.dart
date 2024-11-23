import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ustay_project/domain/entities/tipo.dart';
import 'package:ustay_project/core/utils/config.dart';

class TipoService {
  Future<Tipo> fetchTipo(int tipoId) async {
    final response = await http.get(Uri.parse('${Config.baseUrlTipo}/listar/$tipoId'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      return Tipo.fromJson(data);
    } else {
      throw Exception('Error al cargar tipo');
    }
  }
}
