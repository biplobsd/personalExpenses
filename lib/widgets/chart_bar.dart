import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  List<Map<String, Object>> gTransection;
  double maxSpending;
  ChartBar({
    Key? key,
    required this.gTransection,
    required this.maxSpending,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ...List.generate(
          7,
          (index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FittedBox(child: Text("\$${gTransection[index]['tAmount']}")),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  height: 100,
                  width: 10,
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorLight,
                      borderRadius: BorderRadius.circular(5)),
                  child: FractionallySizedBox(
                    alignment: Alignment.bottomCenter,
                    heightFactor: (gTransection[index]['tAmount'] as double) /
                        maxSpending,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Theme.of(context).primaryColorDark,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(gTransection[index]['day'].toString()),
              ],
            );
          },
        ),
      ],
    );
  }
}
