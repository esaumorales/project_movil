// lib/splash_screen.dart
import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navega a la pantalla principal después de 3 segundos
    Timer(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacementNamed(
          '/home'); // Cambia '/home' según la ruta de tu pantalla principal
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0D1B2A), // Fondo oscuro como en tu diseño
      body: Center(
        child: Image.asset(
          'assets/images/common/splash_screen_logo.png',
          width: 210, // Tamaño según tu diseño
          height: 168,
        ),
      ),
    );
  }
}
