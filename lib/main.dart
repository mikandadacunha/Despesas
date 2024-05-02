import 'dart:math';
import 'package:despesaspessoas/components/chart.dart';
import 'package:despesaspessoas/components/transaction_form.dart';
import 'package:despesaspessoas/components/transaction_list.dart';
import 'package:despesaspessoas/models/transaction.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ExpensiveApp());
}

class ExpensiveApp extends StatelessWidget {
  const ExpensiveApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
            primary: Colors.blueGrey, secondary: Colors.teal, inversePrimary: Colors.white),
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
            titleLarge: const TextStyle(
              fontFamily: 'OpenSans',
              fontSize:
                  16, // Defina o tamanho da fonte do título do AppBar conforme necessário
              fontWeight: FontWeight
                  .bold, // Defina o peso da fonte do título do AppBar conforme necessário
              // Outras propriedades de estilo de texto conforme necessário
            ),
            labelLarge: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
  }
}

// ignore: must_be_immutable
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  _addTransaction(String title, double value) {
    final newTransaction = Transaction(
        id: Random().nextDouble().toString(),
        date: DateTime.now(),
        title: title,
        value: value);

    setState(() {
      _transictions.add(newTransaction);
    });

    Navigator.of(context).pop();
  }

  final _transictions = [
    Transaction(
        id: 't1',
        date: DateTime.now().subtract(const Duration(days: 1)),
        title: 'Nova Fronha',
        value: 680.9),
    Transaction(
        id: 't2',
        date: DateTime.now().subtract(const Duration(days: 4)),
        title: 'Novo Edredom',
        value: 540.5),
    Transaction(
        id: 't3',
        date: DateTime.now().subtract(const Duration(days: 5)),
        title: 'Cadeira',
        value: 84.5),
    Transaction(
        id: 't1',
        date: DateTime.now().subtract(const Duration(days: 6)),
        title: 'Nova Carregador MacBook',
        value: 34.49),
    Transaction(
        id: 't2',
        date: DateTime.now().subtract(const Duration(days: 0)),
        title: 'Fato na igreja',
        value: 198.98),
    Transaction(
        id: 't3',
        date: DateTime.now().subtract(const Duration(days: 8)),
        title: 'Titulo de conduao',
        value: 650000.5),
  ];

  List<Transaction> get _recentTransaction {
    ////Quantidade de dias a serem mostrados, this function calculate days after the transaction
    ///made, if it is within 7 days, then is not possible to be showed.
    return _transictions.where((tr) {
      return tr.date.isAfter(DateTime.now().subtract(const Duration(days: 7)));
    }).toList();
  }

  /// function that open the modal form to register a new transition
  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return TransactionForm(_addTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Head app
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
          'Despesas Pessoal',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
              color: Colors.white,
              onPressed: () => _openTransactionFormModal(context),
              icon: const Icon(Icons.add))
        ],
      ),

      /// Body App
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // ignore: avoid_unnecessary_containers
            Chart(_recentTransaction),

            /// The parameter/column that show all transiction that a have made, from my locar list of models transiction _transictions

            TransactionList(_transictions),

            //// New section card, adictionating a new transiction on the app
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        onPressed: () => _openTransactionFormModal(context),
        child: Icon(color: Theme.of(context).primaryColor, Icons.add),
      ),
    );
  }
}
