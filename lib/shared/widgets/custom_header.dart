import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onNotificationTap;
  final VoidCallback? onGridTap;
  final VoidCallback? onSearchTap;
  final VoidCallback? onTuneTap;

  CustomHeader({
    Key? key,
    required this.title,
    this.onNotificationTap,
    this.onGridTap,
    this.onSearchTap,
    this.onTuneTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFF010B1A),
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo en el lado izquierdo con tamaño ajustado a 100
          Image.asset(
            'assets/images/common/app-logo-dashboard.png',
            width: 100,
            height: 100,
            fit: BoxFit.contain,

          ),

          // Iconos en el lado derecho organizados en 2x2 con mayor padding superior
           Padding(
             padding: const EdgeInsets.only(
                 top: 10.0), // Espacio superior para bajar más los iconos
             child: Column(
               mainAxisSize: MainAxisSize.min,
               crossAxisAlignment: CrossAxisAlignment.end,
               children: [
                 Row(
                   mainAxisSize: MainAxisSize.min,
                   children: [
                     IconButton(
                       icon: Image.asset(
                         'assets/icons/icon-notification.png',
                         width: 24,
                         height: 24,
                       ),
                       onPressed: onNotificationTap,
                       padding: EdgeInsets.zero,
                     ),
                     SizedBox(width: 8),
                     IconButton(
                       icon: Image.asset(
                         'assets/icons/icon-grid.png',
                         width: 24,
                         height: 24,
                       ),
                       // onPressed: onGridTap,
                       onPressed: () {
                         Navigator.pushNamed(context, '/userDashboard');
                       },
                       padding: EdgeInsets.zero,

                     ),

                   ],
                 ),
                 SizedBox(height: 8), // Espacio entre filas
               ],
             ),
           ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60.0); // Ajuste de altura a 100
}
