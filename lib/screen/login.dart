import 'package:flutter/material.dart';
import '../models/datos.dart';
import 'principal_pantalla.dart';

class PantallaLogin extends StatefulWidget {
  const PantallaLogin({super.key});

  @override
  State<PantallaLogin> createState() => _PantallaLoginState();
}

class _PantallaLoginState extends State<PantallaLogin> {
  final TextEditingController usuarioCtrl = TextEditingController();
  final TextEditingController claveCtrl = TextEditingController();
  String mensaje = '';

  void iniciarSesion() {
    String usuario = usuarioCtrl.text;
    String clave = claveCtrl.text;
    bool encontrado = false;

    for (int i = 0; i < usuarios.length; i++) {
      if (usuarios[i] == usuario && contrasenas[i] == clave) {
        encontrado = true;
      }
    }

    if (encontrado) {
      usuarioActual = usuario;
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const PantallaPrincipal()),
      );
    } else {
      setState(() {
        mensaje = 'Usuario o contraseña incorrectos';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.catching_pokemon, size: 100),
            const SizedBox(height: 30),
            TextField(
              controller: usuarioCtrl,
              decoration: const InputDecoration(
                labelText: 'Usuario',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: claveCtrl,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Contraseña',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            Text(mensaje, style: const TextStyle(color: Colors.red)),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: iniciarSesion,
              child: const Text('Iniciar sesión'),
            ),
          ],
        ),
      ),
    );
  }
}