class Partner {
  final int? idPartner;  // Opcional, ya que no tiene valor al crear un nuevo partner
  final String nombreEmpresa;
  final String ruc;
  final String direccionEmpresa;
  final String correoEmpresa;

  Partner({
    this.idPartner,
    required this.nombreEmpresa,
    required this.ruc,
    required this.direccionEmpresa,
    required this.correoEmpresa,
  });

  // Método para crear una instancia de Partner a partir de un JSON
  factory Partner.fromJson(Map<String, dynamic> json) {
    return Partner(
      idPartner: json['idPartner'],
      nombreEmpresa: json['nombreEmpresa'],
      ruc: json['ruc'],
      direccionEmpresa: json['direccionEmpresa'],
      correoEmpresa: json['correoEmpresa'],
    );
  }

  // Método para convertir una instancia de Partner a JSON
  Map<String, dynamic> toJson() {
    return {
      'idPartner': idPartner,
      'nombreEmpresa': nombreEmpresa,
      'ruc': ruc,
      'direccionEmpresa': direccionEmpresa,
      'correoEmpresa': correoEmpresa,
    };
  }
}
