import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;

  // ignore: use_key_in_widget_constructors
  const TransactionList(this.transaction);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 400,
        child: transaction.isEmpty
            ? Column(
                children: <Widget>[
                  Text(
                    'Por favor rigista uma transacao',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 20,),
                  Container(height: 200,
                  child: Image.asset('assets/img/waiting.png'),)
                ],
              )
            : ListView.builder(
                itemCount: transaction.length,
                itemBuilder: (ctx, index) {
                  final tr = transaction[index];
                  return Card(
                      color: Colors.white,
                      child: Row(
                        children: [
                          /// The style of container of price information
                          Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Theme.of(context).primaryColor, width: 2)),
                            padding: const EdgeInsets.all(10),

                            /// Estilo do preco, bordas e cor do texto do preco.
                            child: Text(
                              '€ ${tr.value.toStringAsFixed(2)}',
                              style:  TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),

                          ///Column da lista de objectos e gastos feitos
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                tr.title,
                                style: Theme.of(context).textTheme.titleLarge,
                                // style: const TextStyle(
                                //     fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                DateFormat('d MMM y').format(tr.date),
                                style: const TextStyle(
                                    fontSize: 14, color: Colors.grey),
                              )
                            ],
                          )

                          /// Fim da column da lista de objectos
                        ],
                      ));
                }));
  }
}
