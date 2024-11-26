class Servicio {
  final int id;
  final String garaje;
  final String almacen;
  final String luz;
  final String wifi;
  final String agua;
  final String cable;
  final String seguridad;
  final String limpieza;
  final String calefaccion;
  final String pension;
  final String lavanderia;

  Servicio({
    required this.id,
    required this.garaje,
    required this.almacen,
    required this.luz,
    required this.wifi,
    required this.agua,
    required this.cable,
    required this.seguridad,
    required this.limpieza,
    required this.calefaccion,
    required this.pension,
    required this.lavanderia,
  });

  factory Servicio.fromJson(Map<String, dynamic> json) {
    return Servicio(
      id: json['id'],
      garaje: json['garaje'],
      almacen: json['almacén'],
      luz: json['luz'],
      wifi: json['wifi'],
      agua: json['agua'],
      cable: json['cable'],
      seguridad: json['seguridad'],
      limpieza: json['limpieza'],
      calefaccion: json['calefacción'],
      pension: json['pensión'],
      lavanderia: json['lavandería'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'garaje': garaje,
      'almacén': almacen,
      'luz': luz,
      'wifi': wifi,
      'agua': agua,
      'cable': cable,
      'seguridad': seguridad,
      'limpieza': limpieza,
      'calefacción': calefaccion,
      'pensión': pension,
      'lavandería': lavanderia,
    };
  }
}
