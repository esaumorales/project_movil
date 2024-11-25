import 'package:ustay_project/domain/entities/inmueble.dart';
import 'package:ustay_project/domain/entities/partner.dart';
import 'package:ustay_project/domain/entities/zona.dart';

class Edificio {
  final int idEdificio;
  final String referenciaEdificio;
  final String direccion;
  final String? nPisos;
  final String? reglaCasa;
  final String? imagen;
  final String? urlMap;
  final Partner partner;
  final List<Inmueble> inmuebles;
  final Zona zona;

  Edificio({
    required this.idEdificio,
    required this.referenciaEdificio,
    required this.direccion,
    this.nPisos,
    this.reglaCasa,
    this.imagen,
    this.urlMap,
    required this.partner,
    required this.inmuebles,
    required this.zona,
  });

  // Método para mapear JSON a objeto Edificio
  factory Edificio.fromJson(Map<String, dynamic> json) {
    return Edificio(
      idEdificio: json['idEdificio'],
      referenciaEdificio: json['referenciaEdificio'],
      direccion: json['direccion'],
      nPisos: json['n_pisos'],
      reglaCasa: json['regla_casa'],
      imagen: json['imagen'],
      urlMap: json['url_map'],
      partner: Partner.fromJson(json['partner']),
      inmuebles: (json['inmuebles'] as List)
          .map((inmueble) => Inmueble.fromJson(inmueble))
          .toList(),
      zona: Zona.fromJson(json['zona']),
    );
  }

  // Método opcional para mapear objeto Edificio a JSON
  Map<String, dynamic> toJson() {
    return {
      'idEdificio': idEdificio,
      'referenciaEdificio': referenciaEdificio,
      'direccion': direccion,
      'n_pisos': nPisos,
      'regla_casa': reglaCasa,
      'imagen': imagen,
      'url_map': urlMap,
      'partner': partner.toJson(), // Llama al método toJson de Partner
      'inmuebles': inmuebles.map((inmueble) => inmueble.toJson()).toList(), // Llama al método toJson de cada Inmueble
      'zona': zona.toJson(), // Llama al método toJson de Zona
    };
  }
}
