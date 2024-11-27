// To parse this JSON data, do
//
//     final especificacion = especificacionFromJson(jsonString);

import 'dart:convert';

import 'package:ustay_project/domain/models/inmueble.dart';

Especificacion especificacionFromJson(String str) => Especificacion.fromJson(json.decode(str));

String especificacionToJson(Especificacion data) => json.encode(data.toJson());

class Especificacion {
  int id;
  String urlImg;
  String especificacion1;
  String urlImg2;
  String especificacion2;
  String urlImg3;
  String especificacion3;
  String urlImg4;
  String especificacion4;
  String urlImg5;
  String especificacion5;
  String urlImg6;
  String especificacion6;
  Inmueble inmueble;

  Especificacion({
    required this.id,
    required this.urlImg,
    required this.especificacion1,
    required this.urlImg2,
    required this.especificacion2,
    required this.urlImg3,
    required this.especificacion3,
    required this.urlImg4,
    required this.especificacion4,
    required this.urlImg5,
    required this.especificacion5,
    required this.urlImg6,
    required this.especificacion6,
    required this.inmueble,
  });

  factory Especificacion.fromJson(Map<String, dynamic> json) => Especificacion(
    id: json["id"],
    urlImg: json["urlImg"],
    especificacion1: json["especificacion1"],
    urlImg2: json["urlImg2"],
    especificacion2: json["especificacion2"],
    urlImg3: json["urlImg3"],
    especificacion3: json["especificacion3"],
    urlImg4: json["urlImg4"],
    especificacion4: json["especificacion4"],
    urlImg5: json["urlImg5"],
    especificacion5: json["especificacion5"],
    urlImg6: json["urlImg6"],
    especificacion6: json["especificacion6"],
    inmueble: Inmueble.fromJson(json["inmueble"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "urlImg": urlImg,
    "especificacion1": especificacion1,
    "urlImg2": urlImg2,
    "especificacion2": especificacion2,
    "urlImg3": urlImg3,
    "especificacion3": especificacion3,
    "urlImg4": urlImg4,
    "especificacion4": especificacion4,
    "urlImg5": urlImg5,
    "especificacion5": especificacion5,
    "urlImg6": urlImg6,
    "especificacion6": especificacion6,
    "inmueble": inmueble.toJson(),
  };
}
