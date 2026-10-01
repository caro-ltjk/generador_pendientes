import 'package:flutter/material.dart';
import 'package:gestor_pendientes/features/home/models/item.dart';

class DetailScreen extends StatelessWidget {
  final Item item;

  const DetailScreen({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(item.titulo)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.live_tv, size: 80, color: Colors.purpleAccent),
            const SizedBox(height: 16),
            Text(
              item.titulo,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text('Categoría: ${item.categoria}', style: const TextStyle(fontSize: 18)), 
            Text('Estado: ${item.completado ? 'Completado' : 'Pendiente'}', style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}