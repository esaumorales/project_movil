import 'package:flutter/material.dart';
import 'package:ustay_project/domain/models/edificio.dart';
import 'package:ustay_project/domain/models/inmueble.dart';
import 'package:ustay_project/services/edificio_service.dart';

class EdificioController extends ChangeNotifier {
  List<Edificio> _edificios = [];  // Inicialización vacía para evitar null
  List<Inmueble> _favoritos = [];  // Inicialización vacía para evitar null

  List<Inmueble> get favoritos => _favoritos;

  // Cargar edificios y filtrar aquellos que tengan el campo "ilove" a true
  Future<void> fetchEdificios() async {
    try {
      // Obtener todos los edificios
      final response = await EdificioService().listarTodo();  // Servicio para obtener edificios

      if (response == null || response.isEmpty) {
        throw Exception('No se encontraron edificios');
      }

      _edificios = response;

      // Filtrar inmuebles favoritos (ilove == true)
      _favoritos = _edificios
          .expand((edificio) => (edificio.inmuebles?.where((inmueble) => inmueble.ilove ?? false) ?? [])
          .cast<Inmueble>())
          .toList();

      notifyListeners(); // Notificar que los datos han cambiado
    } catch (e) {
      throw Exception('Error al cargar los edificios: $e');
    }
  }
}
