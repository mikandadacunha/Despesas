import 'dart:math';
import 'package:despesaspessoas/models/transaction.dart';
import '../components/transaction_form.dart';
import 'transaction_list.dart';
import 'package:flutter/material.dart';

class TransactionUser extends StatefulWidget {
  const TransactionUser({super.key});

  @override
  State<TransactionUser> createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
  _addTransaction(String title, double value, DateTime date) {
    final newTransaction = Transaction(
        id: Random().nextDouble().toString(),
        date: date,
        title: title,
        value: value);

    setState(() {
      _transictions.add(newTransaction);
    });
  }

  final List<Transaction> _transictions = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionForm(_addTransaction),
        TransactionList(_transictions),
      ],
    );
  }
}
