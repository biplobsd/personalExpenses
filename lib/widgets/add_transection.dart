import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddTransection extends StatefulWidget {
  Function submitData;

  AddTransection({
    Key? key,
    required this.submitData,
  }) : super(key: key);

  @override
  State<AddTransection> createState() => _AddTransectionState();
}

class _AddTransectionState extends State<AddTransection> {
  TextEditingController titleContoler = TextEditingController();

  TextEditingController amountContoler = TextEditingController();

  DateTime? picedDate;

  void submitAirport() {
    widget.submitData(
      title: titleContoler.text,
      amount: double.parse(amountContoler.text),
      id: DateTime.now().toString(),
      time: picedDate,
    );

    Navigator.of(context).pop();
  }

  void picedADate(BuildContext context) {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2021),
            lastDate: DateTime.now())
        .then((value) => setState(() {
              picedDate = value;
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.grey.shade300,
      ),
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                label: Text("Title : "),
              ),
              controller: titleContoler,
              onSubmitted: (_) {
                submitAirport();
              }),
          const SizedBox(
            height: 15,
          ),
          TextField(
            decoration: const InputDecoration(
              label: Text("Amount : "),
            ),
            keyboardType: TextInputType.number,
            controller: amountContoler,
            onSubmitted: (_) {
              submitAirport();
            },
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Text(
                picedDate == null
                    ? "No date chosen!"
                    : DateFormat.yMMMd().format(picedDate!),
                style: TextStyle(color: Theme.of(context).primaryColorDark),
              ),
              TextButton(
                onPressed: () {
                  picedADate(context);
                },
                child: Container(
                  padding: const EdgeInsets.all(5),
                  child: const Text("Pick a date"),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ],
          ),
          Container(
            alignment: Alignment.topRight,
            child: ElevatedButton(
              onPressed: submitAirport,
              child: const Text("Add Transection"),
            ),
          )
        ],
      ),
    );
  }
}
