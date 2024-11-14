class Usuario {
  final int? idUsuario;  // ID de usuario (puede ser null para nuevos usuarios)
  final String nombre;
  final String apellido;
  final String correo;
  final String contrasena;
  final DateTime? fechaRegistro;

  Usuario({
    this.idUsuario,
    required this.nombre,
    required this.apellido,
    required this.correo,
    required this.contrasena,
    this.fechaRegistro,
  });

  // Método para crear una instancia de Usuario a partir de JSON
  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      idUsuario: json['id_usuario'],  // Asegúrate de usar el mismo nombre de columna
      nombre: json['nombre'],
      apellido: json['apellido'],
      correo: json['correo'],
      contrasena: json['contrasena'],
      fechaRegistro: json['fecha_registro'] != null
          ? DateTime.parse(json['fecha_registro'])
          : null,
    );
  }

  // Método para convertir una instancia de Usuario a JSON
  Map<String, dynamic> toJson() {
    return {
      'id_usuario': idUsuario,      // Usar el mismo nombre de columna para que coincida con la base de datos
      'nombre': nombre,
      'apellido': apellido,
      'correo': correo,
      'contrasena': contrasena,
      'fecha_registro': fechaRegistro?.toIso8601String(),
    };
  }
}
