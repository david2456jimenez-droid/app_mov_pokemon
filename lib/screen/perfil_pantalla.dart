import 'package:flutter/material.dart';
import '../models/datos.dart';

class PantallaPerfil extends StatelessWidget {
  const PantallaPerfil({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 30),
        const Icon(Icons.account_circle, size: 120),
        const SizedBox(height: 20),
        ListTile(
          leading: const Icon(Icons.person),
          title: const Text('Usuario'),
          subtitle: Text(usuarioActual),
        ),
        ListTile(
          leading: const Icon(Icons.catching_pokemon),
          title: const Text('Pokemones guardados'),
          subtitle: Text(pokemones.length.toString()),
        ),
      ],
    );
  }
}