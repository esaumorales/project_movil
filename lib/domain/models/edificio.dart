// To parse this JSON data, do
//
//     final edificio = edificioFromJson(jsonString);

import 'dart:convert';

import 'package:ustay_project/domain/models/inmueble.dart';
import 'package:ustay_project/domain/models/zona.dart';
import 'package:ustay_project/domain/models/partner.dart';

Edificio edificioFromJson(String str) => Edificio.fromJson(json.decode(str));

String edificioToJson(Edificio data) => json.encode(data.toJson());

class Edificio {
  int idEdificio;
  String referenciaEdificio;
  String direccion;
  String nPisos;
  String reglaCasa;
  String imagen;
  String urlMap;
  Partner partner;
  List<Inmueble> inmuebles;
  Zona zona;

  Edificio({
    required this.idEdificio,
    required this.referenciaEdificio,
    required this.direccion,
    required this.nPisos,
    required this.reglaCasa,
    required this.imagen,
    required this.urlMap,
    required this.partner,
    required this.inmuebles,
    required this.zona,
  });

  factory Edificio.fromJson(Map<String, dynamic> json) => Edificio(
    idEdificio: json["idEdificio"],
    referenciaEdificio: json["referenciaEdificio"],
    direccion: json["direccion"],
    nPisos: json["n_pisos"],
    reglaCasa: json["regla_casa"],
    imagen: json["imagen"],
    urlMap: json["url_map"],
    partner: Partner.fromJson(json["partner"]),
    inmuebles: List<Inmueble>.from(json["inmuebles"].map((x) => Inmueble.fromJson(x))),
    zona: Zona.fromJson(json["zona"]),
  );

  Map<String, dynamic> toJson() => {
    "idEdificio": idEdificio,
    "referenciaEdificio": referenciaEdificio,
    "direccion": direccion,
    "n_pisos": nPisos,
    "regla_casa": reglaCasa,
    "imagen": imagen,
    "url_map": urlMap,
    "partner": partner.toJson(),
    "inmuebles": List<dynamic>.from(inmuebles.map((x) => x.toJson())),
    "zona": zona.toJson(),
  };
}
