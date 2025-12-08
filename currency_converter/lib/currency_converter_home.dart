import 'package:flutter/material.dart';
class CurrencyConverterHome extends StatelessWidget{
     const  CurrencyConverterHome({super.key});

      @override
      Widget build(BuildContext context){
        return  Scaffold(
            appBar: AppBar(
              title: Text('Currency Converter'),
              centerTitle: true,
              backgroundColor: const Color.fromARGB(255, 168, 152, 9),
              foregroundColor: Colors.white,
              //elevation: 0,
            ),
            backgroundColor: const Color.fromARGB(255, 255, 255, 255) ,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('0.0', style: TextStyle(fontSize: 48)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                        label: Text("Enter TSH"),
                        hintText:"Input amount in TSH",
                        prefixIcon: Icon(Icons.monetization_on,
                        color: const Color.fromARGB(255, 168, 152, 9)
                        ),
                        filled: true,
                        fillColor: const Color.fromARGB(255, 250, 250, 248) ,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            width: 2.0,
                          ),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 168, 152, 9),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Convert',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),    
                  
                ],
              ),
            ),
          );
      }
}