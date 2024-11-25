import 'package:ustay_project/domain/entities/edificio.dart';
import 'package:ustay_project/domain/entities/user.dart';

class Partner {
  int? id;
  String? direccion;
  String? correoEmpresa;
  String? telefonoEmpresa;
  String? dni;
  String? img;
  String? img2;
  Usuario? usuario;
  List<Edificio>? edificio;

  Partner({
    this.id,
    this.direccion,
    this.correoEmpresa,
    this.telefonoEmpresa,
    this.dni,
    this.img,
    this.img2,
    this.usuario,
    this.edificio,

  });

  // Constructor para mapear de JSON a objeto
  factory Partner.fromJson(Map<String, dynamic> json) {
    return Partner(
      id: json['id'],
      direccion: json['direccion'],
      correoEmpresa: json['correo_empresa'],
      telefonoEmpresa: json['telefono_empresa'],
      dni: json['dni'],
      img: json['img'],
      img2: json['img2'],
      usuario: json['usuario'] != null ? Usuario.fromJson(json['usuario']) : null,
      edificio: json['edificio'] != null
          ? (json['edificio'] as List).map((e) => Edificio.fromJson(e)).toList()
          : [],
    );
  }



  // Método opcional para mapear de objeto a JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'direccion': direccion,
      'correo_empresa': correoEmpresa,
      'telefono_empresa': telefonoEmpresa,
      'dni': dni,
      'img': img,
      'img2': img2,
      'usuario': usuario?.toJson(), // Verifica si `usuario` tiene `toJson`
      'edificio': edificio?.map((e) => e.toJson()).toList(), // Verifica si `Edificio` tiene `toJson`
    };
  }
}
