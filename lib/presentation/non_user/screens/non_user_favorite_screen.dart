import 'package:flutter/material.dart';
import 'package:ustay_project/core/utils/navigation_utils.dart';
import 'package:ustay_project/shared/widgets/custom_footer.dart';
import 'package:ustay_project/presentation/non_user/screens/non_user_dashboard_screen.dart';
import 'package:ustay_project/presentation/non_user/screens/non_user_person_screen.dart';
import 'package:ustay_project/shared/filter/filter_dialog.dart';

class NonUserFavoriteScreen extends StatefulWidget {
  @override
  _NonUserFavoriteScreenState createState() => _NonUserFavoriteScreenState();
}

class _NonUserFavoriteScreenState extends State<NonUserFavoriteScreen> {
  int _currentIndex = 1; // Define el índice para "Favoritos"

  void _onIconTap(int index) {
    setState(() {
      _currentIndex = index;
    });

    // Navega según el índice seleccionado
    switch (index) {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120),
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () {
                    Navigator.pushNamed(context, '/nonUserDashboard');
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Tus favoritos",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Row(
                      children: [
                        _buildFilterButton("Seleccionar", onPressed: () {}),
                        const SizedBox(width: 8),
                        _buildFilterButton(
                          "Filtro",
                          onPressed: () {
                            _showFilterBottomSheet(context);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildFavoriteCardPlaceholder(),
            const SizedBox(height: 16),
            _buildFavoriteCardPlaceholder(),
          ],
        ),
      ),
      bottomNavigationBar: CustomFooter(
        currentIndex: _currentIndex,
        onTap: _onIconTap,
      ),
    );
  }

  Widget _buildFilterButton(String text, {required VoidCallback onPressed}) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.orange, width: 2),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.orange,
            fontWeight: FontWeight.normal,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  Widget _buildFavoriteCardPlaceholder() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      height: 200,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Center(
        child: Text(
          "Inicia Sesión para poder colocar tus cuartos Favoritos.",
          style: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }

  void _showFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Permite que el BottomSheet sea responsivo
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(0),
        ),
      ),
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: 0.7, // Ocupa el 70% de la pantalla (ajústalo según necesidad)
          child: FilterWidget(
            onClose: () {
              Navigator.pop(context); // Cierra el BottomSheet
            },
          ),
        );
      },
    );
  }

}
