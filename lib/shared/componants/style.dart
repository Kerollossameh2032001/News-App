import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const defaultColor = Colors.deepOrange;

ThemeData lightTheme = ThemeData(
  tabBarTheme: TabBarTheme(
    labelColor: Colors.black87,
  ),
  backgroundColor: Colors.white,
  textTheme: const TextTheme(
      headline5: TextStyle(
        color: Colors.white,
        backgroundColor: Colors.black87,
        fontWeight: FontWeight.bold,
        fontSize: 25,
        fontStyle: FontStyle.italic,
      ),
      bodyText1: TextStyle(color: Colors.black87),
      headline4: TextStyle(color: Colors.black87),
      headline6: TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic)),
  inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(23),
  )),
  primarySwatch: defaultColor,
  scaffoldBackgroundColor: Colors.blueGrey[50],
  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(color: Colors.black87),
    elevation: 0.0,
    backgroundColor: Colors.white,
    titleTextStyle: TextStyle(
        color: Colors.black87,
        fontWeight: FontWeight.bold,
        fontSize: 25,
        fontStyle: FontStyle.italic),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
  ),
);

ThemeData darkTheme = ThemeData(
  tabBarTheme: TabBarTheme(labelColor: Colors.white),
  backgroundColor: Colors.black54 /*Color.fromARGB(49, 48, 48, 1)*/,
  textTheme: const TextTheme(
    headline5: TextStyle(
      color: Colors.black87,
      backgroundColor: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 25,
      fontStyle: FontStyle.italic,
    ),
    bodyText1: TextStyle(color: Colors.white),
    headline4: TextStyle(color: Colors.white),
    headline6: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic),
  ),
  inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(23),
  )),
  primarySwatch: defaultColor,
  scaffoldBackgroundColor: Color.fromRGBO(57, 59, 59, 1),
  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(color: Colors.white),
    elevation: 0.0,
    backgroundColor: Color.fromRGBO(57, 59, 59, 1),
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 25,
      fontStyle: FontStyle.italic,
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Color.fromRGBO(57, 59, 59, 1),
      statusBarIconBrightness: Brightness.light,
    ),
  ),
);
