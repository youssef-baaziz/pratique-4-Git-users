import 'package:flutter/material.dart';
import 'package:flutter_app_4/ui/themes/theme.dart';

class CounterStatefulPage extends StatefulWidget {
  const CounterStatefulPage({super.key});

  @override
  State<CounterStatefulPage> createState() => _CounterStatefulState();
}

class _CounterStatefulState extends State<CounterStatefulPage> {
  int counter = 1;
  String errorMsg = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "counter stateful",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("counter => $counter"),
            (errorMsg != '')
                ? Text(
                    "$errorMsg",
                    style: MyAppTheme.errorTextStyle,
                  )
                : Text("")
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              setState(() {
                if (counter < 10) {
                  counter++;
                  errorMsg = "";
                } else {
                  errorMsg = "counter value can not exceed 10";
                }
              });
            },
          ),
          const SizedBox(
            width: 8,
          ),
          FloatingActionButton(
            child: Icon(Icons.remove),
            onPressed: () {
              setState(() {
                if (counter > 0) {
                  counter--;
                  errorMsg = "";
                } else {
                  errorMsg = "counter value can't be less than 0";
                }
              });
            },
          )
        ],
      ),
    );
  }
}
