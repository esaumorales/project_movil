// To parse this JSON data, do
//
//     final favoritos = favoritosFromJson(jsonString);

import 'dart:convert';

import 'package:ustay_project/domain/models/inmueble.dart';
import 'package:ustay_project/domain/models/user.dart';

Favoritos favoritosFromJson(String str) => Favoritos.fromJson(json.decode(str));

String favoritosToJson(Favoritos data) => json.encode(data.toJson());

class Favoritos {
  int idFavorito;
  String nombreFavorito;
  Usuario usuario;
  Inmueble inmueble;

  Favoritos({
    required this.idFavorito,
    required this.nombreFavorito,
    required this.usuario,
    required this.inmueble,
  });

  factory Favoritos.fromJson(Map<String, dynamic> json) => Favoritos(
    idFavorito: json["idFavorito"],
    nombreFavorito: json["nombreFavorito"],
    usuario: Usuario.fromJson(json["usuario"]),
    inmueble: Inmueble.fromJson(json["inmueble"]),
  );

  Map<String, dynamic> toJson() => {
    "idFavorito": idFavorito,
    "nombreFavorito": nombreFavorito,
    "usuario": usuario.toJson(),
    "inmueble": inmueble.toJson(),
  };
}

