import 'package:flutter/material.dart';
import 'currency_converter_home.dart';
void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
     const  MyApp({super.key});

  @override
  Widget build(BuildContext contest){
    return MaterialApp(
      home: CurrencyConverterHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}