class Producto {
  String? id;
  final String nomProducto;
  final String precio;
  final String descripcion;

  Producto({
    this.id,
    required this.nomProducto,
    required this.precio,
    required this.descripcion,
  });

  factory Producto.fromMap(Map<String, dynamic> map) {
    print("Valores del mapa: $map");
    return Producto(
      id: map['id'],
      nomProducto: map['nomProducto'],
      precio: map['precio'],
      descripcion: map['descripcion'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'nomProducto': nomProducto,
      'precio': precio,
      'descripcion': descripcion,
    };
  }
}