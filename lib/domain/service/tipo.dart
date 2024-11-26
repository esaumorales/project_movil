class Tipo {
  final int id;
  final String descripcion;

  Tipo({
    required this.id,
    required this.descripcion,
  });

  // Factory para JSON -> Objeto
  factory Tipo.fromJson(Map<String, dynamic> json) {
    return Tipo(
      id: json['id'],
      descripcion: json['descripcion'],
    );
  }

  // Método para Objeto -> JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'descripcion': descripcion,
    };
  }
}
