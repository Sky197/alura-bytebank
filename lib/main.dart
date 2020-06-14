import 'package:flutter/material.dart';
import 'screens/lista.dart';

void main() => runApp(BytebankApp());

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.grey[500],
          primaryColor: Colors.grey[900],
          accentColor: Colors.lightGreenAccent[100],
          buttonTheme:
              ButtonThemeData(buttonColor: Colors.lightGreenAccent[100])),
      home: ListaTransferencia(),
    );
  }
}

//Modelo
