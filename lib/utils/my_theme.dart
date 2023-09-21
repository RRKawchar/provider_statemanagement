import 'package:flutter/material.dart';

class MyTheme{
static ThemeData lightTheme=ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.red,
);


static ThemeData darkTheme=ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.amber,
  primarySwatch: Colors.red,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.teal,
    centerTitle: true
  ),
  iconTheme: const IconThemeData(
    color: Colors.pink,
  ),
);

}