import 'package:flutter/material.dart';
import 'package:gestor_pendientes/features/home/models/item.dart';
import 'package:gestor_pendientes/features/home/widgets/add_item_dialog.dart';
import 'package:gestor_pendientes/features/home/widgets/item_card.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Item> itemList = [
    Item(titulo: "Crash Landing on You", categoria: "K-drama", completado: false),
    Item(titulo: "2521", categoria: "K-drama", completado: false),
    Item(titulo: "Pursuit of Jade", categoria: "C-drama", completado: false),
  ];

  void _mostrarSnackBar(String mensaje) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(mensaje)),
    );
  }

  Future<void> _abrirDialogoAgregar() async {
    final Item? nuevoItem = await showDialog<Item>(
      context: context,
      builder: (context) => const AddItemDialog(),
    );

    if (nuevoItem == null || !mounted) return;

    setState(() {
      itemList.add(nuevoItem);
    });
    _mostrarSnackBar('Serie agregada correctamente');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        title: const Text("Mi Backlog"),
      ),
      body: ListView.builder(
        itemCount: itemList.length,
        itemBuilder: (context, index) {
          final currentItem = itemList[index];
          return Dismissible(
            key: ObjectKey(currentItem),
            onDismissed: (direction) {
              setState(() {
                itemList.removeAt(index);
              });
              _mostrarSnackBar('Serie eliminada correctamente');
            },
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Icon(Icons.delete, color: Colors.white),
            ),
            secondaryBackground: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Icon(Icons.delete, color: Colors.white),
            ),
            child: ItemCard(item: currentItem),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _abrirDialogoAgregar,
        child: const Icon(Icons.add),
      ),
    );
  }
}