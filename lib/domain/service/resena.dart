class Resena {
  final int idResena;
  final String calificacion;
  final String comentario;
  final String? fechaResena;
  final String telefono;
  final String? fechaRegistro;

  Resena({
    required this.idResena,
    required this.calificacion,
    required this.comentario,
    this.fechaResena,
    required this.telefono,
    this.fechaRegistro,
  });

  factory Resena.fromJson(Map<String, dynamic> json) {
    return Resena(
      idResena: json['idREseña'],
      calificacion: json['calificacion'],
      comentario: json['comentario'],
      fechaResena: json['fechaReseña'],
      telefono: json['telefono'],
      fechaRegistro: json['fechaRegistro'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idREseña': idResena,
      'calificacion': calificacion,
      'comentario': comentario,
      'fechaReseña': fechaResena,
      'telefono': telefono,
      'fechaRegistro': fechaRegistro,
    };
  }
}