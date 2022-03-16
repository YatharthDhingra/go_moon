import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //body is the primary content of the scaffold
      //The container in Flutter is a parent widget that can contain multiple child widgets and manage them efficiently through width, height, padding, background color, etc
      body: Container(
        decoration: const BoxDecoration( 
          color: Colors.red, 
          //The BoxDecoration class provides a variety of ways to draw a box.
          image: DecorationImage(
            fit: BoxFit.fill,  //this is the 'fit' of the image in the container
            image: AssetImage("assets/images/astro_moon.png"),
          ), //import assets from pubspec.yaml
        ),
      ),
    );
  }
}
