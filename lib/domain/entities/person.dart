class Persona {
  final int? idPersona;
  final String nombre;
  final String apellido;
  final String correo;
  final String telefono;
  final DateTime? fechaRegistro;

  Persona({
    this.idPersona,
    required this.nombre,
    required this.apellido,
    required this.correo,
    required this.telefono,
    this.fechaRegistro,
  });

  // Método para crear una instancia de Persona a partir de JSON
  factory Persona.fromJson(Map<String, dynamic> json) {
    return Persona(
      idPersona: json['idPersona'],
      nombre: json['nombre'],
      apellido: json['apellido'],
      correo: json['correo'],
      telefono: json['telefono'],
      fechaRegistro: json['fechaRegistro'] != null
          ? DateTime.parse(json['fechaRegistro'])
          : null,
    );
  }

  // Método para convertir una instancia de Persona a JSON
  Map<String, dynamic> toJson() {
    return {
      'idPersona': idPersona,
      'nombre': nombre,
      'apellido': apellido,
      'correo': correo,
      'telefono': telefono,
      'fechaRegistro': fechaRegistro?.toIso8601String(),
    };
  }
}
