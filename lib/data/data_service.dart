import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:ustay_project/domain/entities/partner.dart';
import 'package:ustay_project/domain/entities/room.dart';
import 'package:ustay_project/domain/entities/user.dart';

class DataService {
  // Carga los datos de un archivo JSON desde `assets`
  Future<List<dynamic>> _loadJsonData(String path) async {
    final String response = await rootBundle.loadString('assets/data/$path');
    return json.decode(response);
  }

  // Autenticación: carga `usuario.json` y busca el usuario

  // Registra un nuevo usuario y persona

  // Room: carga y devuelve la lista de rooms
  Future<List<Room>> fetchRooms() async {
    try {
      final String response =
      await rootBundle.loadString('assets/data/cuarto.json');
      final List<dynamic> data = json.decode(response);
      return data.map((json) => Room.fromJson(json)).toList();
    } catch (e) {
      print("Error al cargar rooms: $e");
      return [];
    }
  }
}
