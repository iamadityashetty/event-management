// Header(
// controller : controller,
// placeholder : "placeholder",
// icon : Icon(any icon)
// )

import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  // declaring the parameters in component
  Header({
    @required this.controller,
    @required this.placeholder,
    @required this.icon,
  });
  final TextEditingController controller;
  final String placeholder;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    // To Get Device Size
    var screenSize = MediaQuery.of(context).size;
    var screenWidth = screenSize.width;
    return Theme(
      child: TextField(
          style: TextStyle(
            color: Color(0xFF333333),
            //   fontFamily: 'WorkSans',
            //   fontWeight: FontWeight.w500,
            fontSize: screenWidth * 0.045,
          ),
          controller: controller,
          cursorColor: Color(0xFF333333),
          decoration: InputDecoration(
            hintText: placeholder,
            hintStyle: TextStyle(
              color: Color(0xFFBDC3C7),
              //   fontFamily: 'WorkSans',
              //   fontWeight: FontWeight.w500,
              fontSize: screenWidth * 0.045,
            ),
            // contentPadding: EdgeInsets.symmetric(vertical: 0),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF3498DB)),
            ),
            prefixIcon: icon,
          )),
      data: Theme.of(context).copyWith(
        primaryColor: Color(0xFF3498DB),
      ),
    );
  }
}
