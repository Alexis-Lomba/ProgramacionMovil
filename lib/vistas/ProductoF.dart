import 'dart:js_util';

import 'package:curso/Clases/Product.dart';
import 'package:curso/Navegador.dart';
import 'package:curso/firebase/Producto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:soundpool/soundpool.dart';


import 'Texto.dart';
import 'Catalogo.dart';

class ProductoF extends StatefulWidget {
  final String titulo;
  final Producto id; // Asegúrate de que Product sea el tipo correcto


  const ProductoF({Key? key, required this.titulo, required this.id})
      : super(key: key);

  @override
  State<ProductoF> createState() => _ProductoFState();
}

class _ProductoFState extends State<ProductoF> {

  @override
  Widget build(BuildContext context) {
    Soundpool pool = Soundpool(streamType: StreamType.notification);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
            ''), // Deja este espacio en blanco para que no se muestre ningún título en la barra de navegación
      ),
      body: Container(
        color: Colors.black,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
                top: 25,
                child: Container(
                  width: 520,
                  height: 400,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.deepOrange, width: 3)),
                  child: GestureDetector(
                    onTap:() async {
                      //print(widget.id.name);
                       int streamId;
                       int soundId;
                        if(widget.id.nomProducto == "Jordan del Mails"){
                         soundId = await rootBundle.load("assets/musica/sunflower.mp3").then((ByteData soundData) {
                          return pool.load(soundData);
                        });
                        streamId = await pool.play(soundId);

                        }else{

                        }

                    },
                    child: Image.network(
                      'assets/imagenes/jordanMiles.png',
                      width: 400,
                      height: 450,
                      fit: BoxFit.fitWidth,
                    ),
                  )
                )),
            Positioned(
              bottom: 20,
              child: Column(
                children: [
                  Text(
                    widget.id.descripcion,
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
                        widget.id.precio as String,
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
                    widget.id.descripcion,
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
