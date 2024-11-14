class Usuario {
  final int? idUsuario;  // Opcional porque al crear un usuario nuevo podría no tener ID aún
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
      idUsuario: json['idUsuario'],
      nombre: json['nombre'],
      apellido: json['apellido'],
      correo: json['correo'],
      contrasena: json['contrasena'],
      fechaRegistro: json['fechaRegistro'] != null
          ? DateTime.parse(json['fechaRegistro'])
          : null,
    );
  }

  // Método para convertir una instancia de Usuario a JSON
  Map<String, dynamic> toJson() {
    return {
      'idUsuario': idUsuario,
      'nombre': nombre,
      'apellido': apellido,
      'correo': correo,
      'contrasena': contrasena,
      'fechaRegistro': fechaRegistro?.toIso8601String(),
    };
  }
}
