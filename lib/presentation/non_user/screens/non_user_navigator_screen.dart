// non_user_navigator_screen.dart
import 'package:flutter/material.dart';
import 'package:ustay_project/core/utils/navigation_utils.dart';
import 'package:ustay_project/core/widgets/custom_footer.dart';
import 'package:ustay_project/core/widgets/custom_header.dart';
import 'package:ustay_project/presentation/non_user/screens/non_user_dashboard_screen.dart';
import 'package:ustay_project/presentation/non_user/screens/non_user_bag_screen.dart';
import 'package:ustay_project/presentation/non_user/screens/non_user_favorite_screen.dart';
import 'package:ustay_project/presentation/non_user/screens/non_user_person_screen.dart';

class NonUserNavigatorScreen extends StatefulWidget {
  @override
  _NonUserNavigatorScreenState createState() => _NonUserNavigatorScreenState();
}

class _NonUserNavigatorScreenState extends State<NonUserNavigatorScreen> {
  int _currentIndex = 0; // Define el índice para "Explora"

  void _onIconTap(int index) {
    setState(() {
      _currentIndex = index;
    });

    // Navega según el índice seleccionado
    switch (index) {
      case 0:
        navigateWithoutAnimation(context, NonUserNavigatorScreen());
        break;
      case 1:
        navigateWithoutAnimation(context, NonUserBagScreen());
        break;
      case 2:
        navigateWithoutAnimation(context, NonUserDashboardScreen());
        break;
      case 3:
        navigateWithoutAnimation(context, NonUserFavoriteScreen());
        break;
      case 4:
        navigateWithoutAnimation(context, NonUserPersonScreen());
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHeader(
        title: "Explora",
        onNotificationTap: () {},
        onGridTap: () {},
        onSearchTap: () {},
        onTuneTap: () {},
      ),
      body: Center(
        child: Text("Explora la aplicación como invitado."),
      ),
      bottomNavigationBar: CustomFooter(
        currentIndex: _currentIndex,
        onTap: _onIconTap,
      ),
    );
  }
}
