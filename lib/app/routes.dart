import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ustay_project/presentation/authentication/login_screen.dart';
import 'package:ustay_project/presentation/authentication/registration_screen.dart';
import 'package:ustay_project/presentation/non_user/screens/non_user_bag_screen.dart';
import 'package:ustay_project/presentation/non_user/screens/non_user_dashboard_screen.dart';
import 'package:ustay_project/presentation/non_user/screens/non_user_favorite_screen.dart';
import 'package:ustay_project/presentation/non_user/screens/non_user_navigator_screen.dart';
import 'package:ustay_project/presentation/non_user/screens/non_user_person_screen.dart';
import 'package:ustay_project/presentation/user/screens/user_bag_screen.dart';
import 'package:ustay_project/presentation/user/screens/user_dashboard_screen.dart';
import 'package:ustay_project/presentation/user/screens/user_favorite_screen.dart';
import 'package:ustay_project/presentation/user/screens/user_navigator_screen.dart';
import 'package:ustay_project/presentation/user/screens/user_person_screen.dart';
// Otras importaciones aquí

class AppRoutes {
  static const String userDashboard = '/userDashboard';
  static const String userBag = '/userBag';
  static const String userFavorite = '/userFavorite';
  static const String userNavigator = '/userNavigator';
  static const String userPerson = '/userPerson';

  static const String login = '/login';
  static const String register = '/register';
  static const String nonUserDashboard = '/nonUserDashboard';
  static const String nonUserBag = '/nonUserBag';
  static const String nonUserFavorite = '/nonUserFavorite';
  static const String nonUserNavigator = '/nonUserNavigator';
  static const String nonUserPerson = '/nonUserPerson';
  // Otras rutas...

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
    // Rutas de usuario registrado
      case userNavigator:
        return MaterialPageRoute(builder: (_) => UserNavigatorScreen());
      case userBag:
        return MaterialPageRoute(builder: (_) => UserBagScreen());
      case userDashboard:
        return MaterialPageRoute(builder: (_) => UserDashboardScreen());
      case userFavorite:
        return MaterialPageRoute(builder: (_) => UserFavoriteScreen());
      case userPerson:
        return MaterialPageRoute(builder: (_) => UserPersonScreen());

    // Rutas de usuario no registrado
      case login:
        return MaterialPageRoute(builder: (_) => LoginScreen());

      case register:
      // Extrae los argumentos del settings
        final args = settings.arguments as Map<String, String>?;

        // Verifica que los argumentos no sean null y estén completos
        if (args != null && args.containsKey('firstName') && args.containsKey('lastName') && args.containsKey('middleName')) {
          return MaterialPageRoute(
            builder: (_) => RegisterStepTwoScreen(
              firstName: args['firstName']!,
              lastName: args['lastName']!,
              middleName: args['middleName']!,
            ),
          );
        } else {
          // Si faltan argumentos, muestra un mensaje de error o redirige a otra pantalla
          return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(child: Text('Error: Faltan argumentos para el registro')),
            ),
          );
        }

    // Rutas de usuario no registrado
      case nonUserNavigator:
        return MaterialPageRoute(builder: (_) => NonUserNavigatorScreen());
      case nonUserBag:
        return MaterialPageRoute(builder: (_) => NonUserBagScreen());
      case nonUserDashboard:
        return MaterialPageRoute(builder: (_) => NonUserDashboardScreen());
      case nonUserFavorite:
        return MaterialPageRoute(builder: (_) => NonUserFavoriteScreen());
      case nonUserPerson:
        return MaterialPageRoute(builder: (_) => NonUserPersonScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('Ruta no encontrada: ${settings.name}')),
          ),
        );
    }
  }
}
