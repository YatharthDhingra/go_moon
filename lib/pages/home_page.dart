import 'package:flutter/material.dart';
import 'package:go_moon/widgets/custom_dropdown_button.dart';

class HomePage extends StatelessWidget {
  late double _deviceHeight, _deviceWidth; //private properties

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Buidcontext gives us the information of the widget like its location in the widget tree
    /*Generally speaking, there are 2 use cases for context : 
        -> Interact with your parents (get/post data mostly)
        -> Once rendered on screen, get your screen size and position */
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
            //This padding is applied to the child of the container , not the container itself as padding is of the content

            child: Stack(
              //stack of layers(first appearing -> bottom of the stack , last -> top)
              children: [
                Column(
                  //an array aligned vertically(main axis is y axis ,cross axis is x axis)
                  children: [
                    //list of items
                    _pageTitle(),
                    _bookRideWidget(),
                  ],
                  mainAxisAlignment: MainAxisAlignment
                      .spaceBetween, //alignment on the main axis(y axis-vertically)
                  mainAxisSize: MainAxisSize
                      .max, //size between the widgets(array elements on the main axis)
                  crossAxisAlignment: CrossAxisAlignment
                      .center, //x axis is the cross axis of a column(start -> left-horizontally)
                ),
                Align(   //top of the layer
                //align widget is used to align something(default alignment is centre)
                  child: _astroImageWidget(),
                  alignment: Alignment.centerRight, 
                )
              ],
            )),
      ),
    );
  }

//if _ is before a class name -> it is private
  Widget _astroImageWidget() {
    // a function that returns widget
    //The container in Flutter is a parent widget that can contain multiple child widgets and manage them efficiently through width, height, padding, background color, etc
    return Container(
      height: _deviceHeight * 0.5,
      width: _deviceWidth * 0.65,
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

  Widget _bookRideWidget() {
    return Container(
      height: 0.30 * _deviceHeight,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _destinationDropDownWidget(),
            _travellersInformation(),
            _rideButton(),
          ]),
    );
  }

  Widget _destinationDropDownWidget() {
    //List of drop down menu items , each item will be of type 'string'
    return CustomDropDownButtonClass(
        values: ["ISS", "James Webb Station"], width: _deviceWidth);
    //we returned an object of the CustomDropDownButton Class
  }

  Widget _travellersInformation() {
    //this consists of a row of drop downs , with two drop downs horizontally aligned
    return Row(
      children: [
        CustomDropDownButtonClass(
            values: ["1", "2", "3", "4"], width: _deviceWidth * 0.40),
        CustomDropDownButtonClass(
            values: ["Economy", "Business", "Private"],
            width: _deviceWidth * 0.45),
      ],
      mainAxisAlignment: MainAxisAlignment
          .spaceBetween, //we want space between the two dropdowns
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
    );
  }

  Widget _rideButton() {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: _deviceWidth * 0.01, vertical: _deviceHeight * 0.01),
      margin: EdgeInsets.only(
          bottom: _deviceHeight *
              0.01), //named arguments are passed to just give margin/padding in one direction
      width: _deviceWidth,
      //if we have decoration and color both for a container , the app will CRASH
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: MaterialButton(
        //to create a button
        onPressed:
            () {}, //these type of functions are called anonymous functions-> no name assosicated
        child: const Text(
          "Book Ride!",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
