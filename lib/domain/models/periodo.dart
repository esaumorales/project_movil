// To parse this JSON data, do
//
//     final periodo = periodoFromJson(jsonString);

import 'dart:convert';

import 'package:ustay_project/domain/models/inmueble.dart';

Periodo periodoFromJson(String str) => Periodo.fromJson(json.decode(str));

String periodoToJson(Periodo data) => json.encode(data.toJson());

class Periodo {
  int id;
  String descripcion;
  List<Inmueble> inmuebles;

  Periodo({
    required this.id,
    required this.descripcion,
    required this.inmuebles,
  });

  factory Periodo.fromJson(Map<String, dynamic> json) => Periodo(
    id: json["id"],
    descripcion: json["descripcion"],
    inmuebles: List<Inmueble>.from(json["inmuebles"].map((x) => Inmueble.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "descripcion": descripcion,
    "inmuebles": List<dynamic>.from(inmuebles.map((x) => x.toJson())),
  };
}

