import 'package:flutter/material.dart';

class RegisterLoginModal extends StatelessWidget {
  final VoidCallback onLoginTap; // Acción para iniciar sesión
  final VoidCallback onRegisterTap; // Acción para registrarse

  const RegisterLoginModal({
    Key? key,
    required this.onLoginTap,
    required this.onRegisterTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Función no disponible"),
      content: const Text(
        "Para usar esta función, por favor regístrate o inicia sesión en tu cuenta.",
      ),
      actions: [
        TextButton(
          child: const Text("Cancelar"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: const Text("Iniciar Sesión"),
          onPressed: onLoginTap, // Callback de iniciar sesión
        ),
        TextButton(
          child: const Text("Registrarse"),
          onPressed: onRegisterTap, // Callback de registrarse
        ),
      ],
    );
  }
}
