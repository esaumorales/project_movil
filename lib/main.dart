import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ustay_project/core/constants/routes.dart';
import 'package:ustay_project/features/authentication/controller/auth_controller.dart';
import 'package:ustay_project/presentation/common/splash_Screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthController()),
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
