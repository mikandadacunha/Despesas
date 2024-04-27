import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
 
  final void Function (String, double) onSubmit;

   // ignore: use_key_in_widget_constructors
   const TransactionForm(this.onSubmit);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
   final titleController = TextEditingController();
   final valueController = TextEditingController();

  /// Function that we use to submit the information of transcation throw the mobile kwyboard
   _onSubmit(){
     final value = double.tryParse( valueController.text)?? 0.0;
      final title = titleController.text;

      if(title.isEmpty || value <= 0){
        return;
      }
      widget.onSubmit(title, value);
   }

  @override
  Widget build(BuildContext context) {
    return  Card( 
            color: Colors.white,
            elevation: 2,
            child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column( 

              children: [
                 TextField(

                  controller: titleController,
                  onSubmitted: (_){
                    _onSubmit();
                  },
                  decoration: const InputDecoration(
                    labelText: 'Novo Registro'
                  ),
                  ),
                 TextField(  
                   onSubmitted: (_){
                    _onSubmit();
                  },
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  controller: valueController,
                  decoration: const InputDecoration(
                  labelText: 'Valor associado (€)'
                  
                  ),
                  ),
                Row(
                  
                  mainAxisAlignment: MainAxisAlignment.end,
                  
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      height: 50,
                      width: 120,
                      child: FloatingActionButton(
                        elevation: 0,
                        backgroundColor: Colors.grey[850],
                      
                        child: const Text(
                          'Add Novo', 
                          style: TextStyle(
                            color: Colors.white
                            ),
                            ),
                        onPressed: (){
                       final value = double.tryParse( valueController.text)?? 0.0;
                        final title = titleController.text;

                        widget.onSubmit(title, value);
                        },
                        ),
                    ),
                  ],
                )
              ],
              
            
                     ),
          ),
          );
        
  }
}