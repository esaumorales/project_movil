// navigation_utils.dart
import 'package:flutter/material.dart';

void navigateWithoutAnimation(BuildContext context, Widget targetScreen) {
  Navigator.pushReplacement(
    context,
    PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => targetScreen,
      transitionDuration:
          Duration.zero, // Sin duración para eliminar la animación
      reverseTransitionDuration: Duration.zero, // Sin duración de reverso
    ),
  );
}
