import 'package:flutter/material.dart';
import '../../reusableComponents/text_input.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: TextInput(
            placeholder: "Phone Number",
            icon: Icon(Icons.phone),
          ),
        ),
      ),
    );
  }
}
