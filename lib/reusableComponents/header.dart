// Header(
// title : "screen title",
// description : "screen description"
// )

import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  // declaring the parameters in component
  Header({
    @required this.title,
    @required this.description,
  });
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    // To Get Device Size
    var screenSize = MediaQuery.of(context).size;
    var screenWidth = screenSize.width;
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
              width: 20,
              child: Image(image: AssetImage('assets/images/back.png'))),
          Align(
            alignment: Alignment.center,
            child: Container(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Text(
                title,
                style: TextStyle(
                  color: Color(0xFF333333),
                  fontSize: 24,
                  fontFamily: 'WorkSans',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Align(
              alignment: Alignment.center,
              child: Text(description,
                  style: TextStyle(
                    color: Color(0xFF95A5A6),
                    fontSize: 14,
                    fontFamily: 'WorkSans',
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center)),
        ]);
  }
}
