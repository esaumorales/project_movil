// To parse this JSON data, do
//
//     final tipos = tiposFromJson(jsonString);

import 'dart:convert';

import 'package:ustay_project/domain/models/inmueble.dart';

Tipos tiposFromJson(String str) => Tipos.fromJson(json.decode(str));

String tiposToJson(Tipos data) => json.encode(data.toJson());

class Tipos {
  int id;
  String descripcion;
  List<Inmueble> inmuebles;

  Tipos({
    required this.id,
    required this.descripcion,
    required this.inmuebles,
  });

  factory Tipos.fromJson(Map<String, dynamic> json) => Tipos(
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

