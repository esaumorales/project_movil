class Config {
  // URLs específicas para cada módulo del backend
  static const String baseUrlUsuario = 'http://localhost:8861/apiusuario';
  static const String baseUrlPersona = 'http://localhost:8863/api/persona';
  static const String baseUrlEdificio = 'http://localhost:8865/api/edificio';
  static const String baseUrlPartner = 'http://localhost:8867/api/partner';

  // URL común para la API si es que existe un dominio o path compartido
  static const String baseApiUrl = 'http://localhost:8861/api';
}
