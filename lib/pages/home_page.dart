import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  late double _deviceHeight, _deviceWidth; //private properties

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Buidcontext gives us the information of the widget like its location in the widget tree

    _deviceHeight = MediaQuery.of(context)
        .size
        .height; //this gives us the height of the device(in pixels)
    _deviceWidth = MediaQuery.of(context)
        .size
        .width; //this gives us the width of the device

    //Internally , a container wraps around its child , but we can give its height and width explicitly
    //A child will never go beyond the size of its parent tho , no matter what we set the size of the child

    return Scaffold(
      //body is the primary content of the scaffold
      body: SafeArea(
        //Safe area provides sufficient padding such that our content does not get obsturcted with the nodge of the device
        child: Container(
          //this container is child of safearea , and our widget that we created is child of that container
          height: _deviceHeight,
          width:
              _deviceWidth, //this container won't go beyond the safe area(parent) though
          padding: EdgeInsets.symmetric(
              horizontal: _deviceWidth *
                  0.05), //providing padding from edges (symmetrically)
          //This padding is applied to the child of the container , not the container itself
          child: _pageTitle(),
        ),
      ),
    );
  }

//if _ is before a class name -> it is private
  Widget _astroImageWidget() {
    // a function that returns widget
    //The container in Flutter is a parent widget that can contain multiple child widgets and manage them efficiently through width, height, padding, background color, etc
    return Container(
      decoration: const BoxDecoration(
        //The BoxDecoration class provides a variety of ways to draw a box.
        image: DecorationImage(
          fit: BoxFit.fill, //this is the 'fit' of the image in the container
          image: AssetImage("assets/images/astro_moon.png"),
        ), //import assets from pubspec.yaml
      ),
    );
  }

  Widget _pageTitle() {
      return const Text(
        "#GoMoon",
        textAlign: TextAlign.center,  //to align the text in center horizontally
        style: TextStyle(color: Colors.white, fontSize: 70, fontWeight: FontWeight.bold), //returning a textWidget
      //style : TextStyle(attributes of the text),
    );
  }
}
