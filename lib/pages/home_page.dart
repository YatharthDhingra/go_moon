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
          child: Column(
            //an array aligned vertically(main axis is y axis ,cross axis is x axis)
            children: [
              //list of items
              _pageTitle(),
              _destinationDropDownWidget(),
            ],
            mainAxisAlignment: MainAxisAlignment
                .spaceBetween, //alignment on the main axis(y axis-vertically)
            mainAxisSize: MainAxisSize
                .max, //size between the widgets(array elements on the main axis)
            crossAxisAlignment: CrossAxisAlignment
                .start, //x axis is the cross axis of a column(start -> left-horizontally)
          ),
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
      textAlign: TextAlign.center, //to align the text in center horizontally
      style: TextStyle(
          color: Colors.white,
          fontSize: 70,
          fontWeight: FontWeight.bold), //returning a textWidget
      //style : TextStyle(attributes of the text),
    );
  }

  Widget _destinationDropDownWidget() {
    //List of drop down menu items , each item will be of type 'string'
    List<String> _items = ["ISS", "James Webb Station"];
    return Container(
      //for background of our drop down initially , we also add background color to our container
      decoration: BoxDecoration(
        color: const Color.fromRGBO(53, 53, 53, 1.0),
        borderRadius: BorderRadius.circular(10),
      ),
      width: _deviceWidth,
      padding: EdgeInsets.symmetric(horizontal: _deviceWidth*0.05), //gives spacing to text inside(content inside)

      child: DropdownButton(
        onChanged: (_) {}, //this is a function that specify what happens when we click on the dropDownButton(we ignore it by giving it '_' as parameter)
        items: _items.map((e) {
          return DropdownMenuItem(
            child: Text(e),
            value: e,
          );
        }).toList(), //this map function iterates over each element and converts it into a DropdownMenuItem
        //using toList() function , we convert it to list again , //we pass the created list here
        //use .map function here otherwise will give an error while giving the default value to the drop down menu

        underline: Container(), //make underline an empty container -> no underline
        value: _items.first, //default value is the first value of the list
        dropdownColor: const Color.fromRGBO(53, 53, 53, 1.0),  //background color of dropdown WHEN IT OPENS UP
        style: const TextStyle(color: Colors.white),  //color of its text
      ),
    );
  }
}
