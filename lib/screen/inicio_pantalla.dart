import 'package:flutter/material.dart';
import '../models/datos.dart';
import 'agregar_pantalla.dart';

class PantallaInicio extends StatefulWidget {
  const PantallaInicio({super.key});

  @override
  State<PantallaInicio> createState() => _PantallaInicioState();
}

class _PantallaInicioState extends State<PantallaInicio> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      // +1 porque la última tarjeta es la del signo más
      itemCount: pokemones.length + 1,
      itemBuilder: (context, index) {
        // Tarjeta del "+"
        if (index == pokemones.length) {
          return Card(
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PantallaAgregar(),
                  ),
                ).then((valor) {
                  setState(() {}); // refresca la pantalla al volver
                });
              },
              child: const Center(child: Icon(Icons.add, size: 60)),
            ),
          );
        }

        // Tarjeta de un pokemon
        return Card(
          child: Column(
            children: [
              Expanded(
                child: Image.network(
                  pokemones[index]['url']!,
                  fit: BoxFit.contain,
                  width: double.infinity,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  pokemones[index]['nombre']!,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}