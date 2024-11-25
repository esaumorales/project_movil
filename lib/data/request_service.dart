import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

Future<T> handleRequest<T>(
    Future<http.Response> Function() request, T Function(dynamic) parser) async {
  try {
    final response = await request().timeout(Duration(seconds: 10));

    if (response.statusCode == 200 || response.statusCode == 201) {
      return parser(json.decode(response.body));
    } else {
      throw Exception(
          'Error del servidor. Código de estado: ${response.statusCode}');
    }
  } on SocketException {
    throw Exception('No hay conexión a Internet.');
  } on FormatException {
    throw Exception('Respuesta no válida del servidor.');
  } catch (e) {
    throw Exception('Error inesperado: $e');
  }
}
