import 'package:flutter/material.dart';
import 'screens/HomePage.dart';
import 'styles/styles.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home:new HomePage(),
      theme:ThemeData(
        appBarTheme: AppBarTheme(
          textTheme: TextTheme(title: appBarTextStyle)
        ),
        textTheme: TextTheme(
          title: titleTextStyle,
          body1: Body1TextStyle
        )
      ),
    );
  }
}


