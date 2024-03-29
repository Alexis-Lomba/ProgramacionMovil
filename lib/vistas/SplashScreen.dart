import 'package:curso/Navegador.dart';
import 'package:curso/vistas/Inicio.dart';
import 'package:curso/vistas/Texto.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _showMainScreen = false;

  @override
  void initState() {
    super.initState();
    // Simulamos un retraso para mostrar la imagen de splash
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _showMainScreen = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 500),
      child: _showMainScreen
          ? MainScreen()
          : SplashScreenImage(
        key: ValueKey<bool>(_showMainScreen),
      ),
    );
  }
}

class SplashScreenImage extends StatelessWidget {
  const SplashScreenImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // Aquí puedes ajustar la imagen y su tamaño según tus necesidades
        child: Stack(
          children: [
            // Fondo de la pantalla
            Image.asset(
              'assets/imagenes/Fondo.png',
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              height: MediaQuery
                  .of(context)
                  .size
                  .height,
              fit: BoxFit
                  .cover, // Ajusta la imagen para cubrir todoss el espacio disponible
            ),
            // Logo
            Positioned(
              top: MediaQuery
                  .of(context)
                  .size
                  .height / 2 - 125,
              // Ajusta la posición del logo verticalmente
              left: MediaQuery
                  .of(context)
                  .size
                  .width / 2 - 125,
              // Ajusta la posición del logo horizontalmente
              child: Image.asset(
                'assets/imagenes/Logo.png', // Ruta de la imagen del logo
                width: 250, // Ancho del logo
                height: 250, // Alto del logo
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyModel(),
      child: const Scaffold(
        body: Inicio(titulo: 'Inicio',),
      ),
    );
  }
}