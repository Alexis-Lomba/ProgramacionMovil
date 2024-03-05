import 'package:curso/Navegador.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Texto.dart';

class Inicio extends StatefulWidget {
  const Inicio({super.key, required this.titulo});

  final String titulo;

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {
    final myModel = Provider.of<MyModel>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.titulo),
      ),
      drawer: Navegador(),
      body: Center(
        child: Consumer<MyModel>(
          builder: (context, myModel, _) => Text(
            'Bienvenido ${myModel.inputValue}',
            style: TextStyle(fontSize: 50, color: Colors.white),
          ),
        ),
      ), backgroundColor: Colors.black,
    );
  }
}

