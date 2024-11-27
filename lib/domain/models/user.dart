import 'package:ustay_project/domain/models/favoritos.dart';
import 'package:ustay_project/domain/models/partner.dart';
import 'package:ustay_project/domain/models/resena.dart';

class Usuario {
  final int? idUsuario;
  final String? nombre;
  final String? apellido;
  final String correo;
  final String contrasena;
  final String fechaRegistro;
  final List<Resena>? resenas; // Nueva propiedad para "resenas"
  final List<Favoritos>? favoritos; // Nueva propiedad para "favoritos"
  final List<Partner>? partners; // Nueva propiedad para "partners"

  Usuario({
    this.idUsuario,
    this.nombre,
    this.apellido,
    required this.correo,
    required this.contrasena,
    required this.fechaRegistro,
    this.resenas,
    this.favoritos,
    this.partners,
  });

  // Constructor para convertir de JSON a objeto Usuario
  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      idUsuario: json['idUsuario'],
      nombre: json['nombre'] ?? 'Sin nombre', // Valor predeterminado
      apellido: json['apellido'] ?? 'Sin apellido', // Valor predeterminado
      correo: json['correo'] ?? '', // Campo obligatorio
      contrasena: json['contrasena'] ?? '', // Campo obligatorio
      fechaRegistro: json['fechaRegistro'] ?? 'Sin fecha', // Valor predeterminado
      resenas: json['resenas'] != null
          ? (json['resenas'] as List)
          .map((resena) => Resena.fromJson(resena))
          .toList()
          : [], // Lista vacía si es null
      favoritos: json['favoritos'] != null
          ? (json['favoritos'] as List)
          .map((favorito) => Favoritos.fromJson(favorito))
          .toList()
          : [], // Lista vacía si es null
      partners: json['partners'] != null
          ? (json['partners'] as List)
          .map((partner) => Partner.fromJson(partner))
          .toList()
          : [], // Lista vacía si es null

    );
  }

  // Método para convertir de objeto Usuario a JSON
  Map<String, dynamic> toJson() {
    return {
      'idUsuario': idUsuario,
      'nombre': nombre,
      'apellido': apellido,
      'correo': correo,
      'contrasena': contrasena,
      'fechaRegistro': fechaRegistro,
      'resenas': resenas?.map((resena) => resena.toJson()).toList() ?? [], // Lista vacía si es null
      'favoritos': favoritos?.map((favorito) => favorito.toJson()).toList() ?? [], // Lista vacía si es null
      'partners': partners?.map((partner) => partner.toJson()).toList() ?? [], // Lista vacía si es null
    };
  }
}
