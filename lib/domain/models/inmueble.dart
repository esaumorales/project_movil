// To parse this JSON data, do
//
//     final inmueble = inmuebleFromJson(jsonString);

import 'dart:convert';

import 'package:ustay_project/domain/models/edificio.dart';
import 'package:ustay_project/domain/models/especificacion.dart';
import 'package:ustay_project/domain/models/periodo.dart';
import 'package:ustay_project/domain/models/servicio.dart';

Inmueble inmuebleFromJson(String str) => Inmueble.fromJson(json.decode(str));

String inmuebleToJson(Inmueble data) => json.encode(data.toJson());

class Inmueble {
  int id;
  String descripcion;
  bool disponibilidad;
  int precio;
  int nCuarto;
  bool ilove;
  Edificio edificio;
  List<Servicio> servicio;
  List<Especificacion> especificacion;
  Periodo tipo;
  Periodo periodo;

  Inmueble({
    required this.id,
    required this.descripcion,
    required this.disponibilidad,
    required this.precio,
    required this.nCuarto,
    required this.ilove,
    required this.edificio,
    required this.servicio,
    required this.especificacion,
    required this.tipo,
    required this.periodo,
  });

  factory Inmueble.fromJson(Map<String, dynamic> json) => Inmueble(
    id: json["id"],
    descripcion: json["descripcion"],
    disponibilidad: json["disponibilidad"],
    precio: json["precio"],
    nCuarto: json["n_cuarto"],
    ilove: json["ilove"],
    edificio: Edificio.fromJson(json["edificio"]),
    servicio: List<Servicio>.from(json["servicio"].map((x) => Servicio.fromJson(x))),
    especificacion: List<Especificacion>.from(json["especificacion"].map((x) => Especificacion.fromJson(x))),
    tipo: Periodo.fromJson(json["tipo"]),
    periodo: Periodo.fromJson(json["periodo"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "descripcion": descripcion,
    "disponibilidad": disponibilidad,
    "precio": precio,
    "n_cuarto": nCuarto,
    "ilove": ilove,
    "edificio": edificio.toJson(),
    "servicio": List<dynamic>.from(servicio.map((x) => x.toJson())),
    "especificacion": List<dynamic>.from(especificacion.map((x) => x.toJson())),
    "tipo": tipo.toJson(),
    "periodo": periodo.toJson(),
  };
}

