class Item{
  // Al menos 3 propiedades, titulo, categoria y completado
  final String titulo;
  final String categoria;
   bool completado;

  Item({
    required this.titulo,
    required this.categoria,
    required this.completado,
  });
}