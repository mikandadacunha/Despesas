import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;
  final void Function(String) onRemove;

  // ignore: use_key_in_widget_constructors
  const TransactionList(this.transaction, this.onRemove);

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
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 200,
                    child: Image.asset('assets/img/waiting.png'),
                  )
                ],
              )
            : ListView.builder(
                itemCount: transaction.length,
                itemBuilder: (ctx, index) {
                  final tr = transaction[index];
                  return Card(
                    elevation: 3,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 40,
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: FittedBox(child: Text('€${tr.value}')),
                        ),
                      ),
                      title: Text(
                        tr.title,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      subtitle: Text(
                        DateFormat('d MMM y').format(tr.date),
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        color: Theme.of(context).colorScheme.error,
                        onPressed: () => onRemove(tr.id),
                      ),
                    ),
                  );
                }));
  }
}
