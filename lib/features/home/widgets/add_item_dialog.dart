import 'package:flutter/material.dart';
import 'package:gestor_pendientes/features/home/models/item.dart';

class AddItemDialog extends StatefulWidget {
  const AddItemDialog({super.key});

  @override
  State<AddItemDialog> createState() => _AddItemDialogState();
}

class _AddItemDialogState extends State<AddItemDialog> {
  final TextEditingController _tituloController = TextEditingController();

  final List<String> _categorias = [
    'K-drama',
    'C-drama',
    'J-drama',
    'Anime',
    'Película',
  ];

  String _categoriaSeleccionada = 'K-drama';

  @override
  void dispose() {
    _tituloController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Agregar serie / película'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _tituloController,
            decoration: const InputDecoration(labelText: 'Título'),
          ),
          const SizedBox(height: 16),
          DropdownButton<String>(
            isExpanded: true,
            value: _categoriaSeleccionada,
            items: _categorias.map((categoria) {
              return DropdownMenuItem<String>(
                value: categoria,
                child: Text(categoria),
              );
            }).toList(),
            onChanged: (nuevoValor) {
              setState(() {
                _categoriaSeleccionada = nuevoValor!;
              });
            },
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancelar'),
        ),
        ElevatedButton(
          onPressed: () {
            if (_tituloController.text.trim().isEmpty) return;

            Navigator.pop(
              context,
              Item(
                titulo: _tituloController.text.trim(),
                categoria: _categoriaSeleccionada,
                completado: false,
              ),
            );
          },
          child: const Text('Agregar'),
        ),
      ],
    );
  }
}