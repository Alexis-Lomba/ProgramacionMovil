import 'package:curso/Navegador.dart';
import 'package:curso/vistas/Inicio.dart';
import 'package:curso/vistas/Texto.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => MyModel(), // Aquí inicializamos MyModel
      child: MaterialApp(
        home: Inicio(titulo: 'Inicio',), // Navegador es tu página principal
      ),
    ),
  );
}
