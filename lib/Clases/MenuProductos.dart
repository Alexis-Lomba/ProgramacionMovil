import 'package:curso/Clases/Product.dart';
import 'package:curso/vistas/Catalogo.dart';

class menuProductos{
  final List<Product> products = [
    Product(
      name: 'Tenis del Bicho',
      description: 'Tenis que te haran jugar re god como el bicho, SIUUUU',
      imageUrl: 'assets/imagenes/cr7.png',
      precio: "\$1900",
    ),
    Product(
        name: 'Tenis god',
        description: 'Unos tenis super god de los cuales seras el mas god',
        imageUrl: 'assets/imagenes/Tenis GOD.png',
        precio: "\$2000"
    ),
    Product(
        name: 'Jordan blancos',
        description: 'No tan gods como los del Mails Morales',
        imageUrl: 'assets/imagenes/jordanBlanco.png',
        precio: "\$2500"
    ),
    Product(
        name: 'Jordan del Mails',
        description: 'Estos si son los gods, puro pinche sunflower',
        imageUrl: 'assets/imagenes/jordanMiles.png',
        precio: "\$3500"
    ),
  ];
}