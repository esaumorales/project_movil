import 'edificio.dart';

class Inmueble {
  final int? id;
  final String descripcion;
  final bool disponibilidad;
  final double precio;
  final Edificio? edificio; // Relación Many-to-One con Edificio

  Inmueble({
    this.id,
    required this.descripcion,
    required this.disponibilidad,
    required this.precio,
    this.edificio,
  });

  factory Inmueble.fromJson(Map<String, dynamic> json) {
    return Inmueble(
      id: json['id'],
      descripcion: json['descripcion'],
      disponibilidad: json['disponibilidad'],
      precio: json['precio'],
      edificio: json['edificio'] != null ? Edificio.fromJson(json['edificio']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'descripcion': descripcion,
      'disponibilidad': disponibilidad,
      'precio': precio,
      'edificio': edificio?.toJson(), // Convertir edificio a JSON si está presente
    };
  }
}
