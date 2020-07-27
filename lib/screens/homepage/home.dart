import 'package:flutter/material.dart';
import '../../reusableComponents/header.dart';

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
          child: Header(
            title: 'Add Event',
            description:
                "Fill up the details to submit your event. You can see the status of submitted event in My Events section.",
          ),
        ),
      ),
    );
  }
}
