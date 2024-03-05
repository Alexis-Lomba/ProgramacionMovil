import 'package:curso/vistas/SplashScreen.dart';
import 'package:curso/vistas/Texto.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart'; // Importa las opciones de configuración de Firebase
import 'package:firebase_database/firebase_database.dart';
import 'package:provider/provider.dart';
import 'package:curso/Navegador.dart';
import 'package:curso/vistas/Inicio.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Inicializa Firebase con las opciones de configuración
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyDIZUaE8F3pNrehit__0hPZD0D_S4ojd5E",
      authDomain: "PUV3QW95piezUkRUhUb7EkQFElx2",
      databaseURL: "https://curso-c7d1a-default-rtdb.firebaseio.com/",
      projectId: "curso-c7d1a",
      storageBucket: "com.fes_aragon.curso",
      messagingSenderId: "219416366711",
      appId: "aragon.unam.mx",
    ),
  );

  // DatabaseReference para acceder a la base de datos
  DatabaseReference eventsRef = FirebaseDatabase.instance.reference().child('events');

  runApp(
    ChangeNotifierProvider(
      create: (context) => MyModel(), // Aquí inicializamos MyModel
      child: MaterialApp(
        home: SplashScreen(),
      ),
    ),
  );
}
