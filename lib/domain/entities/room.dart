class Room {
  final int id;
  final String description;
  final String disponibilidad;
  final double precio;
  final List<String> imageUrls;
  final List<String> servicios;
  final double calificacion; // Media de las calificaciones
  final String nombreUsuario; // Usuario del primer comentario o "N/A"

  Room({
    required this.id,
    required this.description,
    required this.disponibilidad,
    required this.precio,
    required this.imageUrls,
    required this.servicios,
    required this.calificacion,
    required this.nombreUsuario,
  });

  factory Room.fromJson(Map<String, dynamic> json) {
    double calificacionPromedio = 0.0;
    if (json['resenas'] != null && (json['resenas'] as List).isNotEmpty) {
      final List resenas = json['resenas'];
      calificacionPromedio = resenas
          .map((r) => double.tryParse(r['calificacion'] ?? "0") ?? 0)
          .reduce((a, b) => a + b) /
          resenas.length;
    }

    return Room(
      id: json['id'],
      description: json['description'],
      disponibilidad: json['disponibilidad'],
      precio: json['precio'].toDouble(),
      imageUrls: List<String>.from(json['imagenes'] ?? []),
      servicios: List<String>.from(json['servicios'] ?? []),
      calificacion: calificacionPromedio,
      nombreUsuario: json['resenas'] != null &&
          (json['resenas'] as List).isNotEmpty
          ? json['resenas'][0]['nombreUsuario'] ?? "N/A"
          : "N/A",
    );
  }
}