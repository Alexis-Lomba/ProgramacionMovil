import 'dart:html';

import 'package:curso/vistas/Catalogo.dart';
import 'package:curso/vistas/Inicio.dart';
import 'package:curso/vistas/ProductScreen.dart';
import 'package:curso/vistas/ProductSearchScreen.dart';
import 'package:curso/vistas/geo.dart';
import 'package:flutter/material.dart';
import 'vistas/calculadora.dart';
import 'Contador.dart';
import 'vistas/Texto.dart';

class Navegador extends StatefulWidget {
  Navegador({super.key});

  State<Navegador> createState() => _NavegadorState();
}

class _NavegadorState extends State<Navegador> {
  @override
  Widget build(BuildContext context) {
    // Scaffold(
    //  appBar: AppBar(
    //  title: const Text('Productos', style: TextStyle(color: Colors.white)),
    //backgroundColor: Colors.grey,
    //),
    return Drawer(
        backgroundColor: Colors.black,
        child: ListView(
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
              child: Text('Moscalex',
                  style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            Container(
              margin: EdgeInsets.all(8.0),
              padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  border: Border.all(color: Colors.grey)),
              child: ListTile(
                leading: Icon(Icons.home),
                iconColor: Colors.white,
                title: const Text('Inicio',
                    style: TextStyle(color: Colors.white),
                    selectionColor: Colors.red),
                onTap: () {
                  Navigator.pop(context); // Cierra el Drawer
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Inicio(
                                titulo: 'Inicio',
                              )));
                },
                hoverColor: Colors.deepOrange,
              ),
            ),
            Container(
              margin: EdgeInsets.all(8.0),
              padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  border: Border.all(color: Colors.grey)),
              child: ListTile(
                leading: Icon(Icons.map),
                iconColor: Colors.white,
                title: const Text('Geo',
                    style: TextStyle(color: Colors.white),
                    selectionColor: Colors.red),
                onTap: () {
                  Navigator.pop(context); // Cierra el Drawer
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Geo(
                                titulo: 'Geo',
                              )));
                },
                hoverColor: Colors.deepOrange,
              ),
            ),
            Container(
              margin: EdgeInsets.all(8.0),
              padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  border: Border.all(color: Colors.grey)),
              child: ListTile(
                leading: Icon(Icons.calculate),
                iconColor: Colors.white,
                title: const Text('Calculadora',
                    style: TextStyle(color: Colors.white),
                    selectionColor: Colors.red),
                onTap: () {
                  Navigator.pop(context); // Cierra el Drawer
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Calculadora(
                                titulo: 'Geo',
                              )));
                },
                hoverColor: Colors.deepOrange,
              ),
            ),
            Container(
              margin: EdgeInsets.all(8.0),
              padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  border: Border.all(color: Colors.grey)),
              child: ListTile(
                leading: Icon(Icons.ad_units_rounded),
                iconColor: Colors.white,
                title: const Text('Productos',
                    style: TextStyle(color: Colors.white),
                    selectionColor: Colors.red),
                onTap: () {
                  Navigator.pop(context); // Cierra el Drawer
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Catalogo(
                            titulo: 'Productos',
                          )));
                },
                hoverColor: Colors.deepOrange,
              ),
            ),
            Container(
              margin: EdgeInsets.all(8.0),
              padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  border: Border.all(color: Colors.grey)),
              child: ListTile(
                leading: Icon(Icons.plus_one),
                iconColor: Colors.white,
                title: const Text('Productos',
                    style: TextStyle(color: Colors.white),
                    selectionColor: Colors.red),
                onTap: () {
                  Navigator.pop(context); // Cierra el Drawer
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductScreen(
                            //titulo: 'Productos',
                          )));
                },
                hoverColor: Colors.deepOrange,
              ),
            ),
            Container(
              margin: EdgeInsets.all(8.0),
              padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  border: Border.all(color: Colors.grey)),
              child: ListTile(
                leading: Icon(Icons.search),
                iconColor: Colors.white,
                title: const Text('Productos',
                    style: TextStyle(color: Colors.white),
                    selectionColor: Colors.red),
                onTap: () {
                  Navigator.pop(context); // Cierra el Drawer
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductSearchScreen(
                            //titulo: 'Productos',
                          )));
                },
                hoverColor: Colors.deepOrange,
              ),
            ),
          ],
        ));
  }
}
