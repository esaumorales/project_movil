// To parse this JSON data, do
//
//     final zona = zonaFromJson(jsonString);

import 'dart:convert';

Zona zonaFromJson(String str) => Zona.fromJson(json.decode(str));

String zonaToJson(Zona data) => json.encode(data.toJson());

class Zona {
  int id;
  String nombreZona;

  Zona({
    required this.id,
    required this.nombreZona,
  });

  factory Zona.fromJson(Map<String, dynamic> json) => Zona(
    id: json["id"],
    nombreZona: json["nombreZona"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nombreZona": nombreZona,
  };
}
