import 'package:flutter/material.dart';
import '../models/datos.dart';

class PantallaAgregar extends StatefulWidget {
  const PantallaAgregar({super.key});

  @override
  State<PantallaAgregar> createState() => _PantallaAgregarState();
}

class _PantallaAgregarState extends State<PantallaAgregar> {
  final TextEditingController nombreCtrl = TextEditingController();
  final TextEditingController urlCtrl = TextEditingController();

  void agregar() {
    if (nombreCtrl.text != '' && urlCtrl.text != '') {
      pokemones.add({
        'nombre': nombreCtrl.text,
        'url': urlCtrl.text,
      });
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Agregar pokemon')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: nombreCtrl,
              decoration: const InputDecoration(
                labelText: 'Nombre del pokemon',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: urlCtrl,
              decoration: const InputDecoration(
                labelText: 'URL de la imagen',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: agregar,
              child: const Text('Agregar'),
            ),
          ],
        ),
      ),
    );
  }
}