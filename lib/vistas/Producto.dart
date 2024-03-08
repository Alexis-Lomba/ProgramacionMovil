import 'package:curso/Clases/Product.dart';
import 'package:curso/Navegador.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Texto.dart';
import 'Catalogo.dart';

class Producto extends StatefulWidget {
  final String titulo;
  final Product id; // Asegúrate de que Product sea el tipo correcto

  const Producto({Key? key, required this.titulo, required this.id})
      : super(key: key);

  @override
  State<Producto> createState() => _ProductoState();
}

class _ProductoState extends State<Producto> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(''), // Deja este espacio en blanco para que no se muestre ningún título en la barra de navegación
      ),
      body: Container(
        color: Colors.black,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
                top: 35,
                child: Container(
                  width: 520,
                  height: 400,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.deepOrange, width: 3)),
                  child: Image.network(
                    widget.id.imageUrl,
                    width: 400,
                    height: 450,
                    fit: BoxFit.fitWidth,
                  ),
                )),
            Positioned(
              bottom: 50,
              child: Column(
                children: [
                  Text(
                    widget.id.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.id.precio,
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.star, color: Colors.white),
                      Icon(Icons.star, color: Colors.white),
                      Icon(Icons.star, color: Colors.white),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    widget.id.description,
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}