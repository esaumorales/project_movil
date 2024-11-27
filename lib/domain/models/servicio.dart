// To parse this JSON data, do
//
//     final servicio = servicioFromJson(jsonString);

import 'dart:convert';

import 'package:ustay_project/domain/models/inmueble.dart';

Servicio servicioFromJson(String str) => Servicio.fromJson(json.decode(str));

String servicioToJson(Servicio data) => json.encode(data.toJson());

class Servicio {
  int id;
  Inmueble inmueble;
  String wifi;
  String agua;
  String luz;
  String seguridad;
  String garaje;
  String lavandera;
  String limpieza;
  String cable;
  String calefaccin;
  String almacn;
  String pensin;

  Servicio({
    required this.id,
    required this.inmueble,
    required this.wifi,
    required this.agua,
    required this.luz,
    required this.seguridad,
    required this.garaje,
    required this.lavandera,
    required this.limpieza,
    required this.cable,
    required this.calefaccin,
    required this.almacn,
    required this.pensin,
  });

  factory Servicio.fromJson(Map<String, dynamic> json) => Servicio(
    id: json["id"],
    inmueble: Inmueble.fromJson(json["inmueble"]),
    wifi: json["wifi"],
    agua: json["agua"],
    luz: json["luz"],
    seguridad: json["seguridad"],
    garaje: json["garaje"],
    lavandera: json["lavandería"],
    limpieza: json["limpieza"],
    cable: json["cable"],
    calefaccin: json["calefacción"],
    almacn: json["almacén"],
    pensin: json["pensión"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "inmueble": inmueble.toJson(),
    "wifi": wifi,
    "agua": agua,
    "luz": luz,
    "seguridad": seguridad,
    "garaje": garaje,
    "lavandería": lavandera,
    "limpieza": limpieza,
    "cable": cable,
    "calefacción": calefaccin,
    "almacén": almacn,
    "pensión": pensin,
  };
}
