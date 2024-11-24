import 'package:flutter/material.dart';
import 'package:ustay_project/presentation/authentication/login_screen.dart';
import 'package:ustay_project/presentation/authentication/registration_screen.dart';
import 'package:ustay_project/presentation/authentication/send_email_screen.dart';
import 'package:ustay_project/presentation/non_user/screens/non_user_dashboard_screen.dart';
import 'package:ustay_project/presentation/non_user/screens/non_user_favorite_screen.dart';
import 'package:ustay_project/presentation/non_user/screens/non_user_person_screen.dart';
import 'package:ustay_project/presentation/user/all/inmueble_screen.dart';
import 'package:ustay_project/presentation/user/all/popular_screen.dart';
import 'package:ustay_project/presentation/user/all/prices_screen.dart';
import 'package:ustay_project/presentation/user/screens/user_dashboard_screen.dart';
import 'package:ustay_project/presentation/user/screens/user_favorite_screen.dart';
import 'package:ustay_project/presentation/user/screens/user_person_screen.dart';

class AppRoutes {
  static const String userDashboard = '/userDashboard';
  static const String userFavorite = '/userFavorite';
  static const String userPerson = '/userPerson';
  static const String userPopular = '/userPopular';
  static const String userPrice = '/userPrice';
  static const String userInmueble = '/userInmueble';


  static const String login = '/login';
  static const String register = '/register';
  static const String nonUserDashboard = '/nonUserDashboard';
  static const String nonUserFavorite = '/nonUserFavorite';
  static const String nonUserPerson = '/nonUserPerson';
  static const String sendEmail = '/sendEmail';

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
    // Rutas de usuario registrado
      case userDashboard:
        return MaterialPageRoute(builder: (_) => UserDashboardScreen());
      case userFavorite:
        return MaterialPageRoute(builder: (_) => UserFavoriteScreen());
      case userPerson:
        return MaterialPageRoute(builder: (_) => UserPersonScreen());
      case userPopular:
        return MaterialPageRoute(builder: (_) => PopularScreen());
      case userPrice:
        return MaterialPageRoute(builder: (_) => PricesScreen());
      case userInmueble:
        return MaterialPageRoute(builder: (_) => InmuebleScreen());

    // Login
      case login:
        return MaterialPageRoute(builder: (_) => LoginScreen());

    // Register
      case register:
        return MaterialPageRoute(
          builder: (_) => RegisterScreen());


    // Rutas de usuario no registrado
      case nonUserDashboard:
        return MaterialPageRoute(builder: (_) => NonUserDashboardScreen());
      case nonUserFavorite:
        return MaterialPageRoute(builder: (_) => NonUserFavoriteScreen());
      case nonUserPerson:
        return MaterialPageRoute(builder: (_) => NonUserPersonScreen());
      case sendEmail:
        return MaterialPageRoute(builder: (_) => SendEmailScreen());



    // Ruta por defecto
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('Ruta no encontrada: ${settings.name}')),
          ),
        );
    }
  }
}
