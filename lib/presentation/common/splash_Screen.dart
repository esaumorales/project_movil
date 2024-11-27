import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ustay_project/core/constants/routes.dart';
import 'package:ustay_project/features/authentication/controller/auth_controller.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkAuthentication();
  }

  Future<void> _checkAuthentication() async {
    await Future.delayed(const Duration(seconds: 2)); // Simula un retardo

    final authController = Provider.of<AuthController>(context, listen: false);

    // Lógica de autenticación
    if (authController.isUserAuthenticated) {
      Navigator.pushReplacementNamed(context, AppRoutes.userDashboard);
    } else {
      Navigator.pushReplacementNamed(context, AppRoutes.nonUserDashboard);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 1, 11, 26),
      body: Center(
        child: Image.asset(
          'assets/images/common/splash_screen_logo.png',
          width: 210,
          height: 168,
        ),
      ),
    );
  }
}
