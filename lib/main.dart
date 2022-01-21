import 'package:flutter/material.dart';
import 'package:personalexpens/model/transection.dart';

import 'widgets/add_transection.dart';
import 'widgets/chart.dart';
import 'widgets/list_transection.dart';

void main() => runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primarySwatch: Colors.blueGrey),
    home: const MyApp()));

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Transection> _transection = [
    Transection(
      title: "Coffee",
      amount: 15,
      time: DateTime.now(),
      id: "a1",
    ),
    Transection(
      title: "Powruti",
      amount: 15,
      time: DateTime.now(),
      id: 'a2',
    ),
    Transection(
      title: "Potetochip",
      amount: 10,
      time: DateTime.now(),
      id: "a3",
    ),
    Transection(
      title: "Tee",
      amount: 10,
      time: DateTime.now(),
      id: 'a4',
    ),
  ];

  void _addTransection(
      {required String title,
      required String id,
      required double amount,
      required DateTime time}) {
    if (title.isEmpty ||
        amount.isNaN ||
        amount.isNegative ||
        amount == 0 ||
        time == null) {
      return;
    }

    Transection tx =
        Transection(title: title, amount: amount, id: id, time: time);

    setState(() {
      _transection.add(tx);
    });

    // print("Add");
  }

  void _removeTransection(String id) {
    setState(() {
      _transection.removeWhere((element) => element.id == id);
    });
    // print(_transection.length);
  }

  void _showAddTransectionPopup({required BuildContext ctx}) {
    showModalBottomSheet(
        context: ctx,
        builder: (
          BuildContext cmt,
        ) {
          return AddTransection(
            submitData: _addTransection,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddTransectionPopup(ctx: context);
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                _showAddTransectionPopup(ctx: context);
              },
              icon: const Icon(Icons.add))
        ],
        title: const Text("Perosonal Expenses"),
      ),
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Chart(transection: _transection),
                ListTransection(
                    transection: _transection,
                    removeTransection: _removeTransection),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
