import 'package:flutter/material.dart';
import './pages/home_page.dart'; //to use the HomePage class 
import 'dart:ui';

void main() {
  runApp(const App()); //this function takes widget as argument and inflates(attaches) it to the screen
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  // {} -> named optional argument : it is optional to pass this argument(we can create object without passing arguments in the constructior)
  //keys are a way to maintain state of a widget in flutter
  //declare const constructor on immutable classes(stateless class is immutable)

//for every stateless widget , we need to have this build method which describes flutter sdk how our app is going to be rendered onto the screen
  @override
  Widget build(BuildContext context) {
    //MaterialApp is a widget that wraps a number of widgets that are commonly used
    //MaterialApp is the starting point of our app
    return MaterialApp(  
      title: "GoMoon",  //name of the app
      //home is the initial state of our widget
      // home: Scaffold( //Scaffold is used under MaterialApp , it gives you many basic functionalities, like AppBar , BottomNavigationBar , Drawer , FloatingActionButton etc
      //   // backgroundColor: Color.fromRGBO(31, 31, 31, 1.0), --> background color of this particular SCAFFOLD
      // ),  
      home: HomePage(), //we have imported this HomePage class
      theme: ThemeData(scaffoldBackgroundColor: Color.fromRGBO(31, 31, 31, 1.0) ), //to set the theme of all the scaffolds(pages) of the app
    );
  }
}
