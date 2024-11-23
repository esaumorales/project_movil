class Edificio {
  final int idEdificio;
  final String referenciaEdificio;
  final String direccion;
  final String nPisos;
  final String reglaCasa;

  Edificio({
    required this.idEdificio,
    required this.referenciaEdificio,
    required this.direccion,
    required this.nPisos,
    required this.reglaCasa,
  });

  factory Edificio.fromJson(Map<String, dynamic> json) {
    return Edificio(
      idEdificio: json['idEdificio'],
      referenciaEdificio: json['referenciaEdificio'],
      direccion: json['direccion'],
      nPisos: json['n_pisos'],
      reglaCasa: json['regla_casa'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idEdificio': idEdificio,
      'referenciaEdificio': referenciaEdificio,
      'direccion': direccion,
      'n_pisos': nPisos,
      'regla_casa': reglaCasa,
    };
  }
}
