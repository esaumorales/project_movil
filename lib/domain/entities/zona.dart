class Zona {
  final int id;
  final String nombreZona;

  Zona({
    required this.id,
    required this.nombreZona,
  });

  factory Zona.fromJson(Map<String, dynamic> json) {
    return Zona(
      id: json['id'],
      nombreZona: json['nombreZona'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nombreZona': nombreZona,
    };
  }
}
