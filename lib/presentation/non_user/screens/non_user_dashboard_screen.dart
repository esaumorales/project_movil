// non_user_dashboard_screen.dart
import 'package:flutter/material.dart';
import 'package:ustay_project/core/utils/navigation_utils.dart';
import 'package:ustay_project/core/widgets/custom_footer.dart';
import 'package:ustay_project/core/widgets/custom_header.dart';
import 'package:ustay_project/data/data_service.dart';
import 'package:ustay_project/domain/entities/room.dart';
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
  final DataService dataService = DataService();
  int _currentIndex = 2;

  void _onIconTap(int index) {
    setState(() {
      _currentIndex = index;
    });

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
        title: "Dashboard",
        onNotificationTap: () {},
        onGridTap: () {},
        onSearchTap: () {},
        onTuneTap: () {},
      ),
      body: FutureBuilder<List<Room>>(
        future: dataService.fetchRooms(), // Supone que tienes un método fetchRooms en DataService
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error al cargar los datos"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("No hay cuartos disponibles"));
          } else {
            final rooms = snapshot.data!;
            return ListView.builder(
              itemCount: rooms.length,
              itemBuilder: (context, index) {
                return RoomCard(room: rooms[index]);
              },
            );
          }
        },
      ),
      bottomNavigationBar: CustomFooter(
        currentIndex: _currentIndex,
        onTap: _onIconTap,
      ),
    );
  }
}
