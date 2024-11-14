// room.dart
class Room {
  final int id;
  final String descripcion;
  final double precio;
  final String disponibilidad;
  final int numeroCuarto;

  Room({
    required this.id,
    required this.descripcion,
    required this.precio,
    required this.disponibilidad,
    required this.numeroCuarto,
  });

  factory Room.fromJson(Map<String, dynamic> json) {
    return Room(
      id: json['id_cuarto'],
      descripcion: json['descripcion'],
      precio: json['precio'].toDouble(),
      disponibilidad: json['disponibilidad'],
      numeroCuarto: json['n_cuarto'],
    );
  }
}
