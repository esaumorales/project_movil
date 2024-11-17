class Usuario {
  final int? idUsuario;
  final String? nombre;
  final String? apellido;
  final String correo;
  final String contrasena;

  Usuario({
    this.idUsuario,
    this.nombre,
    this.apellido,
    required this.correo,
    required this.contrasena,
  });

  // Constructor para convertir de JSON a objeto Usuario
  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      idUsuario: json['idUsuario'],
      nombre: json['nombre'],
      apellido: json['apellido'],
      correo: json['correo'],
      contrasena: json['contrasena'],
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
    };
  }
}
