class Config {
  // URL base del microservicio de usuarios
  static const String baseUrlUsuario = 'http://10.0.2.2:8861/apiusuario'; // Emulador
  // Para celular físico: 'http://169.254.81.182:8861/apiusuario'

  // URL base del microservicio de edificios
  static const String baseUrlEdificio = 'http://10.0.2.2:8864/api/edificio'; // Emulador
  static const String baseUrlEdificioImage = 'http://10.0.2.2:8864/img/jpg';
  // Para celular físico: 'http://169.254.81.182:8864/api/edificio'

  // URL base del microservicio de especificaciones
  static const String baseUrlEspecificaciones = 'http://10.0.2.2:8866/especificacion';
  static const String baseUrlEspecificacionesImage = 'http://10.0.2.2:8866/img/jpg';
// Emulador
  // Para celular físico: 'http://169.254.81.182:8866/especificacion'

  // URL base del microservicio de inmuebles
  static const String baseUrlInmueble = 'http://10.0.2.2:8867/inmueble'; // Emulador
  // Para celular físico: 'http://169.254.81.182:8867/inmueble'

  static const String baseUrlImages = 'http://10.0.2.2:8867'; // Emulador
  // Para celular físico: 'http://169.254.81.182:8867'

  // URL base del microservicio de partners
  static const String baseUrlPartner = 'http://10.0.2.2:8867/partner'; // Emulador
  static const String baseUrlPartnerImage = 'http://10.0.2.2:8862/img/jpg';

  // Para celular físico: 'http://169.254.81.182:8867/partner'

  // URL base del microservicio de reseñas
  static const String baseUrlResena = 'http://10.0.2.2:8868/resenas'; // Emulador
  // Para celular físico: 'http://169.254.81.182:8868/resenas'

  // URL base del microservicio de servicios
  static const String baseUrlServicios = 'http://10.0.2.2:8865/servicios'; // Emulador
  // Para celular físico: 'http://169.254.81.182/servicios'

  // URL base del microservicio de tipo
  static const String baseUrlTipo = 'http://10.0.2.2:8870/tipos'; // Emulador
  // Para celular físico: 'http://169.254.81.182:8870/tipos'

  // URL base del microservicio de periodo
  static const String baseUrlPeriodo = 'http://10.0.2.2:8871/periodos'; // Emulador
  // Para celular físico: 'http://169.254.81.182:8871/periodos'

  // URL base del microservicio favorito
  static const String baseURlFavorito = 'http://10.0.2.2:8869/favoritos'; // Emulador
// Para celular físico: 'http://169.254.81.182:8869/favoritos'
}
