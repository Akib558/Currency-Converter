import 'package:flutter/material.dart';
import 'package:my_app_1/currency_converter_material_page.dart';
// import 'dart:ui' as ui

void main(){
 runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CurrencyConverterMaterialPage(),
      
    );
  }
}