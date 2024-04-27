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

  _addTransaction (String title, double value){
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(), 
      date: DateTime.now(), 
      title: title, 
      value: value
      );

      setState(() {
        _transictions.add(newTransaction);
      });

      
  }

final  _transictions = [
    Transaction(
      id: 't1', 
      date: DateTime.now(), 
      title: 'Nova Fronha', 
      value: 680.9
      ),

      Transaction(
        id: 't2', 
        date: DateTime.now(), 
        title: 'Novo Edredom', 
        value: 540.5
        ),
        Transaction(
        id: 't3', 
        date: DateTime.now(), 
        title: 'Cadeira', 
        value: 84.5
        )
  ];
  

  


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      TransactionForm(_addTransaction),
      TransactionList(_transictions),
    ],)

    
    ;
  }
}