import 'package:flutter/material.dart';

void main() => runApp(BytebankApp());

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FormularioTransferencia(),
      ),
    );
  }
}

class FormularioTransferencia extends StatelessWidget {
  final TextEditingController _editingControllerNumeroConta =
      TextEditingController();

  final TextEditingController _editingControllerValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Criando Transferencia'),
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _editingControllerNumeroConta,
                style: TextStyle(fontSize: 24.0),
                decoration: InputDecoration(
                    labelText: 'Número da Conta',
                    icon: Icon(Icons.info),
                    hintText: '0000'),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _editingControllerValor,
                style: TextStyle(fontSize: 24.0),
                decoration: InputDecoration(
                    icon: Icon(Icons.monetization_on),
                    labelText: 'valor',
                    hintText: '0.00'),
                keyboardType: TextInputType.number,
              ),
            ),
            RaisedButton(
              child: Text('Confirmar'),
              onPressed: () {
                debugPrint('clicou no botão confirmar !!!');
                final int numeroConta = int.tryParse(_editingControllerNumeroConta.text);
                final double valor = double.tryParse(_editingControllerValor.text);

                if (numeroConta != null && valor != null) {
                final transferenciaCriada =  Transferencia(valor, numeroConta);

                debugPrint('$transferenciaCriada');
                }
              },
            ),
          ],
        ));
  }
}

class ListaTransferencia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        children: <Widget>[
          ItemTransferencia(Transferencia(2555.00, 0033)),
          ItemTransferencia(Transferencia(2555.00, 0033)),
          ItemTransferencia(Transferencia(2555.00, 0033)),
          ItemTransferencia(Transferencia(2555.00, 0033)),
        ],
      ),
      appBar: AppBar(
        title: Text('Transferencias'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      leading: Icon(Icons.monetization_on),
      title: Text(_transferencia.valor.toString()),
      subtitle: Text(_transferencia.numeroConta.toString()),
    ));
  }

  ItemTransferencia(this._transferencia);
}

class Transferencia {
  final double valor;
  final int numeroConta;

  Transferencia(this.valor, this.numeroConta);

  @override
  String toString() {
    return 'Transferencia{valor: $valor, numeroConta: $numeroConta}';
  }
}
