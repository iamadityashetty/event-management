import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  // declaring the parameters in component
  TextInput({
    @required this.controller,
    @required this.focusNode,
    @required this.labelText,
  });
  final TextEditingController controller;
  final FocusNode focusNode;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    // To Get Device Size
    // var screenSize = MediaQuery.of(context).size;
    // var screenWidth = screenSize.width;
    // var screenHeight = screenSize.height;
    return new TextField(
        controller: controller,
        cursorColor: Color(0xFF333333),
        focusNode: focusNode,
        decoration: InputDecoration(
          // labelText: labelText,
          contentPadding: EdgeInsets.symmetric(vertical: 2),
          // labelStyle: TextStyle(
          //   color: focusNode.hasFocus ? Color(0xFF2F80ED) : Color(0xFF8B8B8B),
          //   fontFamily: 'Montserrat',
          //   fontWeight: FontWeight.w500,
          //   fontSize: 16,
          // ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF2F80ED)),
          ),
        ));
  }
}
