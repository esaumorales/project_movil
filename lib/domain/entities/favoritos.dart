class Favorito {
  final int idFavorito;
  final String nombreFavorito;

  Favorito({
    required this.idFavorito,
    required this.nombreFavorito,
  });

  factory Favorito.fromJson(Map<String, dynamic> json) {
    return Favorito(
      idFavorito: json['idFavorito'],
      nombreFavorito: json['nombreFavorito'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idFavorito': idFavorito,
      'nombreFavorito': nombreFavorito,
    };
  }
}

