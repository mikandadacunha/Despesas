import 'package:despesaspessoas/components/chart_bar.dart';
import 'package:despesaspessoas/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTrasaction;

  ///Nossa list que vai gerar os nossos chart com tds os
  Chart(this.recentTrasaction);

  ///dados e suas varia;'oes conforme a utilizacao
  List<Map<String, Object>> get groupedTransiction {
    return List.generate((7), (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double totalSum = 0.0;
      for (var i = 0; i < recentTrasaction.length; i++) {
        bool sameDay = recentTrasaction[i].date.day == weekDay.day;
        bool sameMonth = recentTrasaction[i].date.month == weekDay.month;
        bool sameYear = recentTrasaction[i].date.year == weekDay.year;

        if (sameDay && sameMonth && sameYear) {
          totalSum += recentTrasaction[i].value;
        }
      }

      return {'day': DateFormat.E().format(weekDay)[0], 'value': totalSum};
    });
  }
double get _weekTotalValue {
  return groupedTransiction.fold(0.0, (sum, tr) {
    return sum + (tr['value'] as double);
  });
}

  @override
  Widget build(BuildContext context) {
    groupedTransiction;
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: groupedTransiction.map((tr) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                  laber: tr['day'].toString(),
                  value: tr['value'] as double,
                  percentage: (tr['value'] as double) / _weekTotalValue
                  
                  ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
