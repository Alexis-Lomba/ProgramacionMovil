import 'package:curso/Navegador.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Texto.dart';

class Cuenta extends StatefulWidget {
  const Cuenta({super.key, required this.titulo});

  final String titulo;

  @override
  State<Cuenta> createState() => _CuentaState();
}

class _CuentaState extends State<Cuenta> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text('Inicio de sesión'),
          backgroundColor: Colors.deepOrange,
        ),
      drawer: Navegador(),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(padding: EdgeInsetsDirectional.all(150),
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: const Text(
                'Inicio de sesion',
                style: TextStyle(
                  color: Colors.deepOrange,
                  fontWeight: FontWeight.w500,
                  fontSize: 30,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10), // Borde circular
                    borderSide: BorderSide(color: Colors.orange), // Color naranja
                  ),
                  labelText: 'Nombre de usuario',
                  labelStyle: TextStyle(color: Colors.deepOrange),
                  hintStyle: TextStyle(color: Colors.deepOrange),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10), // Borde circular
                    borderSide: BorderSide(color: Colors.orange), // Color naranja
                  ),
                  labelText: 'Contraseña',
                  labelStyle: TextStyle(color: Colors.deepOrange),
                  hintStyle: TextStyle(color: Colors.deepOrange),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                // Pantalla de recuperación de contraseña
              },
              child: const Text('¿Olvidaste tu contraseña?'),
            ),
            Container(
              height: 50,
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: ElevatedButton(
                child: const Text('Iniciar sesión', style: TextStyle(color: Colors.deepOrange)),
                onPressed: () {
                  print(nameController.text);
                  print(passwordController.text);
                  // Lógica de inicio de sesión aquí
                },
              ),
            ),
          ],
        ),
      )
    );
  }
}