//example of how use stateless widget as a stateful widget

//by using a value notify listner

import 'package:flutter/material.dart';

class ValueNotifyListnerPage extends StatelessWidget {
  ValueNotifyListnerPage({super.key});

  ValueNotifier<int> _counter = ValueNotifier<int>(0);

  //assign like variable that can change or update

  //class ValueNotifier<T> extends ChangeNotifier implements ValueListenable<T> {

  //int accept data type

  //initialize  and assign the value with  data types

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Value notify listner Use"),
      ),
      body: Center(
          child: ValueListenableBuilder(
              valueListenable: _counter,
              builder: (context, value, child) {
                return Text(
                  _counter.value.toString(),
                  style: TextStyle(fontSize: 50),
                );
              })),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _counter.value++;
          print(_counter.value.toString());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
