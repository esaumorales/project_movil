class Tipo {
  final int id;
  final String descripcion;

  Tipo({
    required this.id,
    required this.descripcion,
  });

  factory Tipo.fromJson(Map<String, dynamic> json) {
    return Tipo(
      id: json['id'],
      descripcion: json['descripcion'],
    );
  }
}
