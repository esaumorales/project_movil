import 'package:http/http.dart' as http;
import 'package:ustay_project/core/utils/config.dart';
import 'dart:convert';
import 'package:ustay_project/domain/entities/room.dart';

class RoomService {
  // Obtener lista de inmuebles
  Future<List<Room>> fetchRooms() async {
    final response = await http.get(Uri.parse('${Config.baseUrlInmueble}/listar'));

    if (response.statusCode == 200) {
      List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((room) => Room.fromJson(room)).toList();
    } else {
      throw Exception('Error al obtener los inmuebles');
    }
  }

  // Obtener detalles de un inmueble (incluye especificaciones)
  Future<Room> fetchRoomDetails(int id) async {
    final response =
    await http.get(Uri.parse('${Config.baseUrlInmueble}/detalle/$id'));

    if (response.statusCode == 200) {
      return Room.fromJson(json.decode(response.body));
    } else {
      throw Exception('Error al obtener los detalles del inmueble');
    }
  }
}
