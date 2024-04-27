import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String laber;
  final double value;
  final double percentage;
  ChartBar(
      {required this.laber, required this.percentage, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('€${value.toStringAsFixed(2)}'),
        const SizedBox(
          height: 5,
        ),
        Container(
          height: 60,
          width: 10,
          child:  Stack(
            alignment: Alignment.bottomCenter,
            children: [
            Container(decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
                width: 1.0
              ),
                color: const Color.fromARGB(253, 248, 247, 247),
                borderRadius: BorderRadius.circular(5)
            ),
            ),
            FractionallySizedBox(
              heightFactor: percentage,
              child: Container(decoration: BoxDecoration(
                 color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(5)

              ),),
            )

          ],
          ),
        ),
        const SizedBox(height: 5,),
        Text(laber),
      ],
    );
  }
}
