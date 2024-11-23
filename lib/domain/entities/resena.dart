class Resena {
  final String calificacion;
  final String comentario;
  final String fechaResena;
  final String nombreUsuario;

  Resena({
    required this.calificacion,
    required this.comentario,
    required this.fechaResena,
    required this.nombreUsuario,
  });

  factory Resena.fromJson(Map<String, dynamic> json) {
    return Resena(
      calificacion: json['calificacion'],
      comentario: json['comentario'],
      fechaResena: json['fechaReseña'],
      nombreUsuario: json['usuario']?['nombre'] ?? "Desconocido",
    );
  }
}
