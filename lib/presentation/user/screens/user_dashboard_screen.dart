import 'package:flutter/material.dart';
import 'package:ustay_project/core/utils/navigation_utils.dart';
import 'package:ustay_project/core/widgets/custom_footer.dart';
import 'package:ustay_project/core/widgets/custom_header.dart';
import 'package:ustay_project/presentation/user/screens/detail/room_detail_screen.dart';
import 'package:ustay_project/presentation/user/screens/user_bag_screen.dart';
import 'package:ustay_project/presentation/user/screens/user_favorite_screen.dart';
import 'package:ustay_project/presentation/user/screens/user_navigator_screen.dart';
import 'package:ustay_project/presentation/user/screens/user_person_screen.dart';
import 'package:ustay_project/presentation/widgets/room_card.dart';

class UserDashboardScreen extends StatefulWidget {
  @override
  _UserDashboardScreenState createState() => _UserDashboardScreenState();
}

class _UserDashboardScreenState extends State<UserDashboardScreen> {
  int _currentIndex = 0;

  void _onIconTap(int index) {
    setState(() {
      _currentIndex = index;
    });

    // Navega según el índice seleccionado
    switch (index) {
//      case 0:
// navigateWithoutAnimation(context, UserNavigatorScreen());
//                break;
//      case 1:
//        navigateWithoutAnimation(context, UserBagScreen());
//        break;
      case 0:
        navigateWithoutAnimation(context, UserDashboardScreen());
        break;
      case 1:
        navigateWithoutAnimation(context, UserFavoriteScreen());
        break;
      case 2:
        navigateWithoutAnimation(context, UserPersonScreen());
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    // Datos de prueba para renderizar habitaciones
    final List<Map<String, dynamic>> roomDataList = [
      {
        'inmueble': {
          'descripcion': 'Habitación acogedora cerca al parque',
          'precio': 600,
          'disponibilidad': true,
        },
        'partnerName': 'Partner Ejemplo 1',
      },
      {
        'inmueble': {
          'descripcion': 'Habitación espaciosa con vista al mar',
          'precio': 800,
          'disponibilidad': false,
        },
        'partnerName': 'Partner Ejemplo 2',
      },
    ];

    return Scaffold(
      appBar: CustomHeader(title: "Dashboard"),
      body: ListView.builder(
        itemCount: roomDataList.length,
        itemBuilder: (context, index) {
          final roomData = roomDataList[index];
          final inmueble = roomData['inmueble'];
          final partnerName = roomData['partnerName'];

          return RoomCard(
            inmueble: inmueble,
            partnerName: partnerName,
            onFavoriteTap: () => print("Favorito seleccionado"),
            onCardTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RoomDetailScreen(
                    inmuebleId: index + 1, // ID de prueba
                  ),
                ),
              );
            },
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
