import 'package:curso/Navegador.dart';
import 'package:curso/vistas/ProductoF.dart';
//import 'package:curso/vistas/ProductoF.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:curso/firebase/ProductService.dart';
import 'Texto.dart';
import 'geo.dart';
import 'package:curso/Clases/MenuProductos.dart';
import 'package:curso/Clases/Product.dart';
import 'package:curso/firebase/Producto.dart';



class Catalogo extends StatefulWidget {
  Catalogo({super.key, required this.titulo});

  final String titulo;

  @override
  State<Catalogo> createState() => _CatalogoState();
}


class _CatalogoState extends State<Catalogo> {
  final ProductService _productService = ProductService();
  List<Producto> productos = [];
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
                        'assets/imagenes/'+product.nomProducto+'.png',
                        fit: BoxFit.cover,
                        width: 200,
                        height: 200,
                        alignment: Alignment.centerRight,
                      ),
                    ),
                    title: Text(product.nomProducto),
                    subtitle: Text(product.descripcion),
                    trailing: Text(product.precio.toStringAsFixed(2)),
                    onTap: () {
                      //Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ProductoF(
                                    titulo: product.nomProducto, id: Producto(
                                      nomProducto: product.nomProducto,
                                      id: product.id,
                                      descripcion: product.descripcion,
                                      precio: product.precio,
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
  @override
  void initState() {
    super.initState();
    _loadProducts();
  }

  void _loadProducts() async {
    List<Product> loadedProducts = (await _productService.getProducts()).cast<Product>();
    setState(() {
      productos = loadedProducts.cast<Producto>();
    });
  }
}