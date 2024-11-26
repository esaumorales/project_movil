import 'package:ustay_project/domain/edificio/edificio.dart';
import 'package:ustay_project/domain/service/especificacion.dart';
import 'package:ustay_project/domain/service/periodo.dart';
import 'package:ustay_project/domain/service/servicio.dart';
import 'package:ustay_project/domain/service/tipo.dart';

class Inmueble {
  final int id;
  final String descripcion;
  final bool disponibilidad;
  final double precio;
  final int nCuarto;
  final bool ilove;
  final Edificio edificio;
  final List<Servicio> servicio;
  final List<Especificacion> especificacion;
  final Tipo tipo;
  final Periodo periodo;

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

  factory Inmueble.fromJson(Map<String, dynamic> json) {
    return Inmueble(
      id: json['id'],
      descripcion: json['descripcion'],
      disponibilidad: json['disponibilidad'],
      precio: json['precio'],
      nCuarto: json['n_cuarto'],
      ilove: json['ilove'],
      edificio: Edificio.fromJson(json['edificio']),
      servicio: (json['servicio'] as List)
          .map((servicio) => Servicio.fromJson(servicio))
          .toList(),
      especificacion: (json['especificacion'] as List)
          .map((especificacion) => Especificacion.fromJson(especificacion))
          .toList(),
      tipo: Tipo.fromJson(json['tipo']),
      periodo: Periodo.fromJson(json['periodo']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'descripcion': descripcion,
      'disponibilidad': disponibilidad,
      'precio': precio,
      'n_cuarto': nCuarto,
      'ilove': ilove,
      'edificio': edificio.toJson(),
      'servicio': servicio.map((s) => s.toJson()).toList(),
      'especificacion': especificacion.map((e) => e.toJson()).toList(),
      'tipo': tipo.toJson(),
      'periodo': periodo.toJson(),
    };
  }
}
