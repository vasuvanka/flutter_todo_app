import 'package:flutter/material.dart';
import 'package:flutter_todo_app/screens/screens.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Todos',
        theme: ThemeData(
          // Define the default brightness and colors.
          brightness: Brightness.light,
          primaryColor: Colors.deepOrange,
          accentColor: Colors.deepOrangeAccent,

          // Define the default font family.
          fontFamily: 'Georgia',

          // Define the default TextTheme. Use this to specify the default
          // text styling for headlines, titles, bodies of text, and more.
          textTheme: TextTheme(
              // headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
              // headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
              // bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
              ),
        ),
        debugShowCheckedModeBanner: false,
        home: TodoHome());
  }
}
