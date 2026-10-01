import 'package:flutter/material.dart';
import 'package:gestor_pendientes/features/details/screens/detail_screen.dart';
import 'package:gestor_pendientes/features/home/models/item.dart';

class ItemCard extends StatefulWidget{
  final Item item;

  const ItemCard({
    super.key,
    required this.item,
  });

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard>{
  bool isCompleted = false;

  @override
  void initState(){
    super.initState();
    isCompleted = widget.item.completado;
  }

  @override
  Widget build(BuildContext context){
    return Card(
      color: isCompleted ? Colors.green.shade100 : Colors.white,
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
      child: ListTile(
        leading: IconButton(
          onPressed: () {
            setState(() {
              isCompleted = !isCompleted;
              widget.item.completado = isCompleted;
            });
          },
          icon: Icon(
            isCompleted ? Icons.check_circle : Icons.radio_button_unchecked,
            color: isCompleted ? Colors.green : Colors.grey,
            size: 32,
          ),
        ),
        title: Text(widget.item.titulo, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(widget.item.categoria),
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailScreen(item: widget.item),
            ),
          );
        },
      ),
    );
  }
}