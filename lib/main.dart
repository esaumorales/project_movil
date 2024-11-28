import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ustay_project/core/constants/routes.dart';
import 'package:ustay_project/features/authentication/controller/auth_controller.dart';
import 'package:ustay_project/presentation/common/splash_Screen.dart';
import 'package:ustay_project/presentation/user/screens/controller/edificio_controller.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthController()),
        ChangeNotifierProvider(create: (_) => EdificioController()), // Proveedor del controlador de edificios
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyApp',
      home: SplashScreen(),
      onGenerateRoute: AppRoutes.generateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
