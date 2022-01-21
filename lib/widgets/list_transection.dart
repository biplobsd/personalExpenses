import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personalexpens/model/transection.dart';

class ListTransection extends StatelessWidget {
  Function removeTransection;
  ListTransection({
    Key? key,
    required List<Transection> transection,
    required this.removeTransection,
  })  : _transection = transection,
        super(key: key);

  final List<Transection> _transection;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
          color: Colors.grey.shade200, borderRadius: BorderRadius.circular(15)),
      height: 75.0 * _transection.length,
      child: ListView.builder(
          itemCount: _transection.length,
          itemBuilder: (ctx, index) {
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 3, horizontal: 7),
              elevation: 1,
              child: ListTile(
                leading: CircleAvatar(
                  radius: 25,
                  child: FittedBox(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        "\$${_transection[index].amount.toStringAsFixed(2)}"),
                  )),
                ),
                title: Text(_transection[index].title),
                subtitle: Text(
                  DateFormat.yMMMd().format(_transection[index].time),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    removeTransection(_transection[index].id);
                  },
                ),
              ),
            );
          }),
    );
  }
}
