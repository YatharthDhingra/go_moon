import 'package:flutter/material.dart';

class CustomDropDownButtonClass extends StatelessWidget {
  List<String> values;  //this is the list
  double width;  //width of the device 

  CustomDropDownButtonClass({ required this.values, required this.width});
  //since we didn't declare it late/nullable property , we need to declare these 'required' in the constructor

  @override
  Widget build(BuildContext context) {
     return Container(
      //for background of our drop down initially , we also add background color to our container
      decoration: BoxDecoration(
        color: const Color.fromRGBO(53, 53, 53, 1.0),
        borderRadius: BorderRadius.circular(10),
      ),
      width: width,
      padding: EdgeInsets.symmetric(horizontal: width*0.05), //gives spacing to text inside(content inside)

      child: DropdownButton(
        onChanged: (_) {}, //this is a function that specify what happens when we click on the dropDownButton(we ignore it by giving it '_' as parameter)
        items: values.map((e) {
          return DropdownMenuItem(
            child: Text(e),
            value: e,
          );
        }).toList(), //this map function iterates over each element and converts it into a DropdownMenuItem
        //using toList() function , we convert it to list again , //we pass the created list here
        //use .map function here otherwise will give an error while giving the default value to the drop down menu

        underline: Container(), //make underline an empty container -> no underline
        value: values.first, //default value is the first value of the list
        dropdownColor: const Color.fromRGBO(53, 53, 53, 1.0),  //background color of dropdown WHEN IT OPENS UP
        style: const TextStyle(color: Colors.white),  //color of its text
      ),
    );    
  }
}
