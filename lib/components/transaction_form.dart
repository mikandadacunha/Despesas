import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double, DateTime) onSubmit;

  // ignore: use_key_in_widget_constructors
  const TransactionForm(this.onSubmit);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
   DateTime _selectedDate = DateTime.now();

  /// Function that we use to submit the information of transcation throw the mobile kwyboard
  _onSubmit() {
    final value = double.tryParse(_valueController.text) ?? 0.0;
    final title = _titleController.text;

    if (title.isEmpty || value <= 0 || _selectedDate == Null) {
      return;
    }
    widget.onSubmit(title, value, _selectedDate);
  }

  _showDataPicker() {
    showDatePicker(
      context: context,
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
        setState(() {
        _selectedDate = pickedDate;
          
        });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              onSubmitted: (_) {
                _onSubmit();
              },
              decoration: const InputDecoration(labelText: 'Novo Registro'),
            ),
            TextField(
              onSubmitted: (_) {
                _onSubmit();
              },
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              controller: _valueController,
              decoration:
                  const InputDecoration(labelText: 'Valor associado (€)'),
            ),
            Container(
              height: 60,
              child: Row(
                children: [
                  Expanded(
                    child: Text(_selectedDate == Null
                        ? 'Nehuma data selecionado'
                        : 'Seleted date: ${DateFormat('dd/MM/y').format(_selectedDate)}'),
                  ),
                  Container(
                    width: 150,
                    child: FloatingActionButton(
                      elevation: 0,
                      backgroundColor: Colors.transparent,
                      foregroundColor: Theme.of(context).primaryColor,
                      onPressed: _showDataPicker,
                      child: const Text(
                        'Selecionar Data',
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ///Button,
                  ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                        const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.zero, // Define os cantos quadrados
                        ),
                      ),
                      minimumSize:
                          const MaterialStatePropertyAll(Size(150, 40)),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Theme.of(context)
                              .primaryColor), // Define a cor de fundo
                    ),
                    child: Text(
                      'Add Novo',
                      style: TextStyle(
                          color: Theme.of(context)
                              .textTheme
                              .labelLarge
                              ?.color), //define cor do texto do botao
                    ),
                    onPressed: () {
                      final value =
                          double.tryParse(_valueController.text) ?? 0.0;
                      final title = _titleController.text;

                      widget.onSubmit(title, value, _selectedDate);
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
