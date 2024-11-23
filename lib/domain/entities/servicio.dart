class Servicio {
  final int id;
  final String? luz;
  final String? agua;
  final String? wifi;
  final String? cable;

  Servicio({
    required this.id,
    this.luz,
    this.agua,
    this.wifi,
    this.cable,
  });

  factory Servicio.fromJson(Map<String, dynamic> json) {
    return Servicio(
      id: json['id'],
      luz: json['luz'],
      agua: json['agua'],
      wifi: json['wifi'],
      cable: json['cable'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'luz': luz,
      'agua': agua,
      'wifi': wifi,
      'cable': cable,
    };
  }
}
