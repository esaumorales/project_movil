import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ustay_project/features/authentication/data/auth_service.dart';
import 'package:ustay_project/domain/models/user.dart';

class AuthController with ChangeNotifier {
  final AuthService _authService = AuthService();

  Usuario? _currentUser;
  bool _isLoading = false;
  String _errorMessage = '';
  bool _isAuthenticated = false;

  // Getters
  bool get isUserAuthenticated => _isAuthenticated;
  Usuario? get currentUser => _currentUser;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  // Método para iniciar sesión
  Future<void> login(String email, String password) async {
    _setLoading(true);
    _setErrorMessage('');

    if (email.isEmpty || password.isEmpty) {
      _setErrorMessage('Por favor ingresa correo y contraseña');
      _setLoading(false);
      return;
    }

    if (!_isValidEmail(email)) {
      _setErrorMessage('Por favor ingresa un correo válido');
      _setLoading(false);
      return;
    }

    try {
      _currentUser = await _authService.login(email, password);

      if (_currentUser != null) {
        final String rol = (_currentUser!.partners != null && _currentUser!.partners!.isNotEmpty)
            ? 'Partner'
            : 'Usuario';

        // Guardar en SharedPreferences
        final prefs = await SharedPreferences.getInstance();
        await prefs.setInt('userId', _currentUser!.idUsuario ?? 0);
        await prefs.setString('nombre', _currentUser!.nombre ?? 'Sin nombre');
        await prefs.setString('rol', rol);
        await prefs.setString('correo', _currentUser!.correo);

        _isAuthenticated = true;
      }
    } catch (e) {
      _setErrorMessage(e.toString());
    } finally {
      _setLoading(false);
    }
  }

  // Método para verificar autenticación inicial
  Future<void> checkAuthentication() async {
    final prefs = await SharedPreferences.getInstance();
    _isAuthenticated = prefs.getInt('userId') != null;
    notifyListeners();
  }

  // Método para cerrar sesión
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    _isAuthenticated = false;
    notifyListeners();
  }

  // Métodos privados
  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void _setErrorMessage(String message) {
    _errorMessage = message;
    notifyListeners();
  }

  bool _isValidEmail(String email) {
    final emailRegex = RegExp(r'^[a-zA-Z0-9._]+@[a-zA-Z0-9]+\.[a-zA-Z]+$');
    return emailRegex.hasMatch(email);
  }
}
