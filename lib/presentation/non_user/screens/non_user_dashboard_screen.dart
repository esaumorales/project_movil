import 'package:flutter/material.dart';
import 'package:ustay_project/core/utils/navigation_utils.dart';
import 'package:ustay_project/core/widgets/custom_footer.dart';
import 'package:ustay_project/core/widgets/custom_header.dart';
import 'package:ustay_project/presentation/non_user/screens/non_user_bag_screen.dart';
import 'package:ustay_project/presentation/non_user/screens/non_user_favorite_screen.dart';
import 'package:ustay_project/presentation/non_user/screens/non_user_navigator_screen.dart';
import 'package:ustay_project/presentation/non_user/screens/non_user_person_screen.dart';
import 'package:ustay_project/presentation/widgets/room_card.dart';

class NonUserDashboardScreen extends StatefulWidget {
  @override
  _NonUserDashboardScreenState createState() => _NonUserDashboardScreenState();
}

class _NonUserDashboardScreenState extends State<NonUserDashboardScreen> {
  int _currentIndex = 0;

  void _onIconTap(int index) {
    setState(() {
      _currentIndex = index;
    });

    // Navega según el índice seleccionado
    switch (index) {
//      case 0:
//        navigateWithoutAnimation(context, NonUserNavigatorScreen());
//        break;
//      case 1:
//        navigateWithoutAnimation(context, NonUserBagScreen());
//        break;
      case 0:
        navigateWithoutAnimation(context, NonUserDashboardScreen());
        break;
      case 1:
        navigateWithoutAnimation(context, NonUserFavoriteScreen());
        break;
      case 2:
        navigateWithoutAnimation(context, NonUserPersonScreen());
        break;
    }
  }

  void _showLoginMessage() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Función no disponible"),
          content: const Text(
            "Para usar esta función, por favor regístrate o inicia sesión en tu cuenta.",
          ),
          actions: [
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Datos de prueba para renderizar las habitaciones
    final List<Map<String, dynamic>> roomDataList = [
      {
        'inmueble': {
          'descripcion': 'Habitación amplia cerca al parque',
          'precio': 500,
          'disponibilidad': true,
        },
        'partnerName': 'Partner Ejemplo',
      },
      {
        'inmueble': {
          'descripcion': 'Habitación con buena vista',
          'precio': 450,
          'disponibilidad': false,
        },
        'partnerName': 'Partner Prueba',
      },
    ];

    return Scaffold(
      appBar: CustomHeader(title: "Habitaciones"),
      body: ListView.builder(
        itemCount: roomDataList.length,
        itemBuilder: (context, index) {
          final roomData = roomDataList[index];
          final inmueble = roomData['inmueble'];
          final partnerName = roomData['partnerName'];

          return RoomCard(
            inmueble: inmueble,
            partnerName: partnerName,
            onFavoriteTap: _showLoginMessage,
            onCardTap: _showLoginMessage,
          );
        },
      ),
      bottomNavigationBar: CustomFooter(
        currentIndex: _currentIndex,
        onTap: _onIconTap,
      ),
    );
  }
}
