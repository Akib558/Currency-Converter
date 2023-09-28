import 'package:flutter/material.dart';
import 'package:my_app_1/currency_converter_material_page.dart';
// import 'dart:ui' as ui

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: CurrencyConverterMaterialPage(),
        theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(
              seedColor: Color(0xFF0D4442),
              primary: Color(0xFF0D4442),
            ),
            inputDecorationTheme: InputDecorationTheme(
              hintStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              prefixIconColor: Color.fromRGBO(1, 1, 1, 1),
            ),
            textTheme: TextTheme(
              titleMedium: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              bodySmall: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            appBarTheme: AppBarTheme(
              color: Color(0xFF0D4442),
              titleTextStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black,
              ),
            )));
  }
}
