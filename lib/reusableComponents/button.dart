// Button(
// text : "button text",
// color : Color(color code), (optional - default is blue)
// change : (true if different button style required)
// onClickFunction : button function on press
// )

import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  /// declaring the parameters in component
  const Button({
    @required this.text,
    @required this.onClickFunction,
    this.color,
    this.change,
  });
  final String text;
  final Function onClickFunction;
  final Color color;
  final bool change;

  @override
  Widget build(BuildContext context) {
    // To Get Device Size
    var screenSize = MediaQuery.of(context).size;
    var screenWidth = screenSize.width;

    return change == true
        ? Container(
            width: screenWidth * 0.65,
            height: 45,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(screenWidth * 0.4),
                border: Border.all(
                  color: color != null ? color : Color(0xFF3498DB),
                  width: 3.0,
                )),
            child: FloatingActionButton(
                backgroundColor: Color(0xFFFFFFFF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(screenWidth * 0.4),
                ),
                child: Text(text,
                    style: TextStyle(
                      color: color != null ? color : Color(0xFF3498DB),
                      fontSize: screenWidth * 0.045,
                      // fontFamily: 'WorkSans',
                      // letterSpacing: 0.3,
                    )),
                onPressed: onClickFunction))
        : Container(
            width: screenWidth * 0.65,
            height: 45,
            child: FloatingActionButton(
                backgroundColor: color != null ? color : Color(0xFF3498DB),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(screenWidth * 0.4),
                ),
                child: Text(text,
                    style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontSize: screenWidth * 0.045,
                      // fontFamily: 'WorkSans',
                      // letterSpacing: 0.3,
                    )),
                onPressed: onClickFunction));
  }
}
