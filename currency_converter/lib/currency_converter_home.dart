import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CurrencyConverterHomePage extends StatefulWidget {
  const CurrencyConverterHomePage({super.key});

  @override
  State<CurrencyConverterHomePage> createState() =>
      CurrencyConverterHomePageState();
}

class CurrencyConverterHomePageState extends State<CurrencyConverterHomePage> {
  final TextEditingController amountController = TextEditingController();
  final apiKey = '8fb6bdcef66c42819b2612d1fe56e5ed';

  double result = 0;
  double tzsRate = 0;
  void convert() {
    if (amountController.text.isNotEmpty && tzsRate > 0) {
      // Tumia tzsRate halisi tuliyoipata kutoka API
      result = (double.parse(amountController.text) * tzsRate);
    } else {
      // Acha mtumiaji ajue rate haijapatikana bado au input ni batili
      result = 0.0;
      print("Cannot convert. Rate is missing or amount is empty.");
    }
    setState(() {});
    amountController.clear();
  }

  Future<void> apiData() async {
    final url = Uri.parse(
      'https://api.currencyfreaks.com/v2.0/rates/latest?apikey=$apiKey',
    );
    final response = await http.get(url);
    if (response.statusCode == 200) {
         Map<String, dynamic> jsonResponse = jsonDecode(response.body);
         Map<String, dynamic> rates = jsonResponse['rates'];
     if (rates.containsKey('TZS')){
         tzsRate = double.parse(rates['TZS']);
        print('Current TZS Rate: $tzsRate');
        setState(() {});
      }
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  void initState() {
    super.initState();
    apiData();
  }

  @override
  void dispose() {
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Currency Converter'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 168, 152, 9),
        foregroundColor: Colors.white,
        //elevation: 0,
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('TSH ${result.toStringAsFixed(2)}', style: TextStyle(fontSize: 40)),
              const SizedBox(height: 20),
              TextField(
                controller: amountController,
                decoration: InputDecoration(
                  label: Text("Enter USD Amount"),
                  hintText: "Input amount in USD",
                  prefixIcon: Icon(
                    Icons.monetization_on,
                    color: const Color.fromARGB(255, 168, 152, 9),
                  ),
                  filled: true,
                  fillColor: const Color.fromARGB(255, 250, 250, 248),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(width: 2.0),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: convert,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 168, 152, 9),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 16,
                  ),
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Convert',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
