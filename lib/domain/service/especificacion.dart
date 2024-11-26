class Especificacion {
  final int id;
  final String urlImg;
  final String especificacion1;
  final String urlImg2;
  final String especificacion2;
  final String urlImg3;
  final String especificacion3;
  final String urlImg4;
  final String especificacion4;
  final String urlImg5;
  final String especificacion5;
  final String urlImg6;
  final String especificacion6;

  Especificacion({
    required this.id,
    required this.urlImg,
    required this.especificacion1,
    required this.urlImg2,
    required this.especificacion2,
    required this.urlImg3,
    required this.especificacion3,
    required this.urlImg4,
    required this.especificacion4,
    required this.urlImg5,
    required this.especificacion5,
    required this.urlImg6,
    required this.especificacion6,
  });

  factory Especificacion.fromJson(Map<String, dynamic> json) {
    return Especificacion(
      id: json['id'],
      urlImg: json['url_img'],
      especificacion1: json['especificación1'],
      urlImg2: json['url_img2'],
      especificacion2: json['especificación2'],
      urlImg3: json['url_img3'],
      especificacion3: json['especificación3'],
      urlImg4: json['url_img4'],
      especificacion4: json['especificación4'],
      urlImg5: json['url_img5'],
      especificacion5: json['especificación5'],
      urlImg6: json['url_img6'],
      especificacion6: json['especificación6'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'url_img': urlImg,
      'especificación1': especificacion1,
      'url_img2': urlImg2,
      'especificación2': especificacion2,
      'url_img3': urlImg3,
      'especificación3': especificacion3,
      'url_img4': urlImg4,
      'especificación4': especificacion4,
      'url_img5': urlImg5,
      'especificación5': especificacion5,
      'url_img6': urlImg6,
      'especificación6': especificacion6,
    };
  }
}
