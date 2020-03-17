import 'package:flutter/material.dart';
import 'package:practica_avanzada/widgets/colors.dart';
import 'package:practica_avanzada/widgets/myCustomClipper.dart';
import 'package:clip_shadow/clip_shadow.dart';

class HomePage extends StatelessWidget {
  static final ruta = 'homePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colores.fondo,
        child: Stack(
          children: <Widget>[
            Positioned(
              right: 0.0,
              top: 90.0,
              child: Text(
                '2020',
                style: TextStyle(
                  color: Colores.textoClaro,
                  fontSize: 80.0,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 30.0,
                left: 16.0,
                right: 16.0,
                bottom: 16.0,
              ),
              child: Column(
                children: <Widget>[
                  // Botones superiores
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      botonCircular(
                        icono: Icons.sort,
                        onTap: () {
                          print('Primer boton');
                        },
                      ),
                      botonCircular(
                        icono: Icons.shopping_cart,
                        onTap: () {
                          print('Segundo boton');
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 60.0,
                  ),
                  Container(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Featured',
                          style: TextStyle(
                            color: Colores.textoNegro,
                            fontSize: 30.0,
                          ),
                        ),
                        Text(
                          'Collections',
                          style: TextStyle(
                              color: Colores.textoNegro,
                              fontSize: 35.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      botonPersonalizado(
                        icono: Icons.tune,
                        color: Colores.fondoBotones,
                        onTap: () {
                          print('Boton 1');
                        },
                      ),
                      botonPersonalizado(
                        icono: Icons.access_time,
                        color: Colores.fondoBotones.withOpacity(0.0),
                        gradientColor: LinearGradient(
                          colors: [
                            Colores.botonDegradado1,
                            Colores.botonDegradado2,
                          ],
                        ),
                        onTap: () {
                          print('Boton 2');
                        },
                      ),
                      botonPersonalizado(
                        icono: Icons.straighten,
                        color: Colores.fondoBotones,
                        onTap: () {
                          print('Boton 3');
                        },
                      ),
                      botonPersonalizado(
                        icono: Icons.person,
                        color: Colores.fondoBotones,
                        onTap: () {
                          print('Boton 4');
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  widgetCentral(),
                  SizedBox(
                    height: 30.0,
                  ),
                  barraBaja(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Boton circular
  Widget botonCircular({@required IconData icono, @required Function onTap}) {
    var botones = Material(
      color: Colores.fondoBotones,
      elevation: 20.0,
      shadowColor: Colores.sombra,
      borderRadius: BorderRadius.circular(100),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        splashColor: Colores.textoGrandeFondo,
        splashFactory: InkRipple.splashFactory,
        child: Container(
          width: 50.0,
          height: 50.0,
          child: Icon(
            icono,
            color: Colores.colorIconos,
          ),
        ),
        onTap: onTap,
      ),
    );
    return botones;
  }

  Widget botonPersonalizado(
      {@required IconData icono,
      @required Function onTap,
      Color color,
      Gradient gradientColor}) {
    final double radio = 15.0;
    var boton = Material(
      borderRadius: BorderRadius.circular(radio),
      elevation: 20.0,
      shadowColor: Colores.sombra,
      child: Container(
        width: 60.0,
        height: 60.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radio),
          gradient: gradientColor,
        ),
        child: Material(
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.circular(radio),
          color: color,
          child: InkWell(
            child: Icon(
              icono,
              color: Colores.colorIconos,
              size: 32.0,
            ),
            splashColor: Colores.textoGrandeFondo,
            onTap: onTap,
          ),
        ),
      ),
    );
    return boton;
  }

  Widget widgetCentral() {
    var customClipper = Stack(
      alignment: Alignment.center,
      children: <Widget>[
        ClipShadow(
          boxShadow: [
            BoxShadow(
              blurRadius: 25.0,
              spreadRadius: 0.1,
              color: Colores.sombra.withOpacity(0.7),
              offset: Offset(5.0, 8.0),
            ),
          ],
          clipper: MyCustomClipper(),
          child: Container(
            color: Colores.fondoBotones,
            width: 250.0,
            height: 250.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 30.0, right: 8.0),
                  child: botonCircular(
                    icono: Icons.favorite,
                    onTap: () {
                      print('Funciona desde el widget Central');
                    },
                  ),
                ),
                Container(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 90.0, bottom: 16.0, right: 16.0, left: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Nasa x Anicorn',
                          style: TextStyle(
                            color: Colores.textoNegro,
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Lunar sample return LE',
                          style: TextStyle(
                              color: Colores.textoNegro,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w300,
                              letterSpacing: 0.8),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 70.0,
          child: Image.asset(
            'src/images/reloj.png',
            scale: 1.1,
          ),
        ),
      ],
    );
    return customClipper;
  }

  Widget barraBaja() {
    return Material(
      elevation: 20.0,
      borderRadius: BorderRadius.circular(10.0),
      color: Colors.transparent,
      child: Container(
        padding: EdgeInsets.all(10.0),
        width: 250.0,
        height: 50.0,
        decoration: BoxDecoration(
          color: Colores.fondoBotones,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Material(
              color: Colors.transparent,
              child: Container(
                width: 100.0,
                height: 40.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  gradient: LinearGradient(
                    colors: [
                      Colores.botonDegradado1,
                      Colores.botonDegradado2,
                    ],
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Icon(
                      Icons.home,
                      color: Colores.colorIconos,
                    ),
                    VerticalDivider(
                      color: Colores.textoClaro,
                    ),
                    Text(
                      'Home',
                      style: TextStyle(
                        color: Colores.textoClaro,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Icon(Icons.person, color: Colores.colorIconos,),
            Icon(Icons.settings, color: Colores.colorIconos,),
            Icon(Icons.label_important, color: Colores.colorIconos,),
          ],
        ),
      ),
    );
  }
}
