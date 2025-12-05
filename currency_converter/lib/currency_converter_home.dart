import 'package:flutter/material.dart';
class CurrencyConverterHome extends StatelessWidget{
     const  CurrencyConverterHome({super.key});

      @override
      Widget build(BuildContext context){
        return MaterialApp(
          home: Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('hello, world', textDirection: TextDirection.ltr,),
                ],
              ),
            ),
          ),
        );
      }
}