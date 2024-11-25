class Periodo {
  final int id;
  final String descripcion;

  Periodo({
    required this.id,
    required this.descripcion,
  });

  factory Periodo.fromJson(Map<String, dynamic> json) {
    return Periodo(
      id: json['id'],
      descripcion: json['descripcion'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'descripcion': descripcion,
    };
  }
}
