import 'package:event_management/screens/homepage/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/homepage.dart';

void main() {
  runApp(MainClass());
}

class MainClass extends StatelessWidget {
  /// MainClass Widget Key constructor
  const MainClass({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => Accounts()),
        ],
        child: MaterialApp(
          home: MyApp(),
        ),
      );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.light,
        //defining the primary color of the app
        primaryColor: Color(0xff3498DB),
        //secondary color
        accentColor: Colors.cyan[600],
        backgroundColor: Colors.white,
        fontFamily: 'WorkSans',
        textTheme: TextTheme(
          bodyText1: TextStyle(
            fontSize: width / 100 * 3.8,
            // fontFamily: 'Montserrat',
          ),
        ),

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}
