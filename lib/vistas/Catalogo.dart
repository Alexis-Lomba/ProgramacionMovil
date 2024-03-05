import 'package:curso/Navegador.dart';
import 'package:curso/vistas/Producto.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Texto.dart';
import 'geo.dart';
import 'package:curso/Clases/MenuProductos.dart';
import 'package:curso/Clases/Product.dart';



class Catalogo extends StatefulWidget {
  Catalogo({super.key, required this.titulo});

  final String titulo;

  @override
  State<Catalogo> createState() => _CatalogoState();
}


class _CatalogoState extends State<Catalogo> {
  List<Product> productos = menuProductos().products;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Productos'),
        ),
        drawer: Navegador(),
        body: Container(
          padding: EdgeInsetsDirectional.all(20),
          color: Colors.black, // Fondo negro
          child: ListView.builder(
            itemCount: productos.length,
            itemBuilder: (context, index) {
              final product = productos[index];
              return Container(
              height: 90,
                child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: BorderSide(color: Colors.deepOrange, width: 2),
                ),
                margin: EdgeInsetsDirectional.all(12.5),
                child: ListTile(
                  leading: ClipRect(
                    child: Image.network(
                      product.imageUrl,
                      fit: BoxFit.cover,
                      width: 200,
                      height: 200,
                      alignment: Alignment.centerRight,
                    ),
                  ),
                  title: Text(product.name),
                  subtitle: Text(product.description),
                  trailing: Text(product.precio),
                  onTap: () {
                    //Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Producto(
                              titulo: product.name, id: Product(
                                name: product.name,
                                description: product.description,
                                imageUrl: product.imageUrl,
                                precio: product.precio
                            ),
                            )));
                  },
                ),
              ),
              );
            },
          ),
        ),
      ),
    );
  }
}