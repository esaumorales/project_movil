import 'zona.dart';

class Edificio {
  final int? id;
  final String referenciaEdificio;
  final String direccion;
  final String npisos;
  final String reglaCasa;
  final String urlMap;
  final String imagen;
  final Zona? zona; // Relación Many-to-One con Zona

  Edificio({
    this.id,
    required this.referenciaEdificio,
    required this.direccion,
    required this.npisos,
    required this.reglaCasa,
    required this.urlMap,
    required this.imagen,
    this.zona,
  });

  factory Edificio.fromJson(Map<String, dynamic> json) {
    return Edificio(
      id: json['id'],
      referenciaEdificio: json['referenciaEdificio'],
      direccion: json['direccion'],
      npisos: json['npisos'],
      reglaCasa: json['reglaCasa'],
      urlMap: json['urlMap'],
      imagen: json['imagen'],
      zona: json['zona'] != null ? Zona.fromJson(json['zona']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'referenciaEdificio': referenciaEdificio,
      'direccion': direccion,
      'npisos': npisos,
      'reglaCasa': reglaCasa,
      'urlMap': urlMap,
      'imagen': imagen,
      'zona': zona?.toJson(), // Convertir zona a JSON si está presente
    };
  }
}
