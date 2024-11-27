import 'dart:convert';

import 'package:ustay_project/domain/models/edificio.dart';
import 'package:ustay_project/domain/models/user.dart';

Partner partnerFromJson(String str) => Partner.fromJson(json.decode(str));

String partnerToJson(Partner data) => json.encode(data.toJson());

class Partner {
  int id;
  String direccion;
  String correoEmpresa;
  String telefonoEmpresa;
  String dni;
  String img;
  String img2;
  List<Edificio> edificio;
  Usuario usuario;

  Partner({
    required this.id,
    required this.direccion,
    required this.correoEmpresa,
    required this.telefonoEmpresa,
    required this.dni,
    required this.img,
    required this.img2,
    required this.edificio,
    required this.usuario,
  });

  factory Partner.fromJson(Map<String, dynamic> json) => Partner(
    id: json["id"],
    direccion: json["direccion"],
    correoEmpresa: json["correo_empresa"],
    telefonoEmpresa: json["telefono_empresa"],
    dni: json["dni"],
    img: json["img"],
    img2: json["img2"],
    edificio: List<Edificio>.from(json["edificio"].map((x) => Edificio.fromJson(x))),
    usuario: Usuario.fromJson(json["usuario"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "direccion": direccion,
    "correo_empresa": correoEmpresa,
    "telefono_empresa": telefonoEmpresa,
    "dni": dni,
    "img": img,
    "img2": img2,
    "edificio": List<dynamic>.from(edificio.map((x) => x.toJson())),
    "usuario": usuario.toJson(),
  };
}
