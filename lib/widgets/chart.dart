import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personalexpens/model/transection.dart';

import 'chart_bar.dart';

class Chart extends StatelessWidget {
  List<Transection> transection;
  Chart({
    Key? key,
    required this.transection,
  }) : super(key: key);

  List<Map<String, Object>> get groupedTransection {
    return List.generate(7, (index) {
      DateTime weekDay = DateTime.now().subtract(Duration(days: index));

      double total = 0.0;

      for (Transection p in transection) {
        if (p.time.day == weekDay.day &&
            p.time.month == weekDay.month &&
            p.time.year == weekDay.year) {
          total += p.amount;
        }
      }
      return {
        "day": DateFormat.E().format(weekDay).substring(0, 1),
        "tAmount": total
      };
    }).reversed.toList();
  }

  double get maxSpending {
    return groupedTransection.fold(
        0.0, (pre, item) => pre += item['tAmount'] as double);
  }

  @override
  Widget build(BuildContext context) {
    // print(groupedTransection);
    return Container(
        padding: const EdgeInsets.all(15),
        height: 250,
        child: Card(
          elevation: 5,
          child: ChartBar(
              gTransection: groupedTransection, maxSpending: maxSpending),
        ));
  }
}
