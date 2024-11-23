class Inmueble {
  final int id;
  final String descripcion;
  final bool disponibilidad;
  final double precio;
  final int nCuarto;
  final bool ilove;
  final List<String> especificaciones;
  final List<String> servicios;
  final double calificacion;
  final String? usuario;
  final int partnerId;
  final int? edificioId; // Hacerlo opcional

  Inmueble({
    required this.id,
    required this.descripcion,
    required this.disponibilidad,
    required this.precio,
    required this.nCuarto,
    required this.ilove,
    required this.especificaciones,
    required this.servicios,
    required this.calificacion,
    this.usuario,
    required this.partnerId,
    this.edificioId, // Opcional
  });

  factory Inmueble.fromJson(Map<String, dynamic> json) {
    return Inmueble(
      id: json['id'] ?? 0,
      descripcion: json['descripcion'] ?? '',
      disponibilidad: json['disponibilidad'] ?? false,
      precio: (json['precio'] != null) ? json['precio'].toDouble() : 0.0,
      nCuarto: json['n_cuarto'] ?? 0,
      ilove: json['ilove'] ?? false,
      especificaciones: List<String>.from(json['especificaciones'] ?? []),
      servicios: List<String>.from(json['servicios'] ?? []),
      calificacion: (json['calificacion'] != null)
          ? double.tryParse(json['calificacion'].toString()) ?? 0.0
          : 0.0,
      usuario: json['usuario'], // Puede ser nulo
      partnerId: json['partnerId'] ?? 0,
      edificioId: json['edificio']?['idEdificio'] , // Manejo de valor nulo
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'descripcion': descripcion,
      'disponibilidad': disponibilidad,
      'precio': precio,
      'n_cuarto': nCuarto,
      'ilove': ilove,
      'especificaciones': especificaciones,
      'servicios': servicios,
      'calificacion': calificacion,
      'usuario': usuario,
      'partnerId': partnerId,
      'edificioId': edificioId, // Opcional
    };
  }
}
