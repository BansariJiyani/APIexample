import 'dart:async';

import 'package:apiexample/provider/count_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// this is stateful widget by using provider

/*in stateful widget variable  are muttable means 
you can change or update any kind of widget by user interface
 
  by using set state it rrebuild whole ui but with a provider you have to
build particular widget by using provider


*/

class ChomePage extends StatefulWidget {
  const ChomePage({super.key});

  @override
  State<ChomePage> createState() => _ChomePageState();
}

class _ChomePageState extends State<ChomePage> {
  @override
  void initState() {
    super.initState();
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    Timer.periodic(Duration(seconds: 2), (timer) {
      countProvider.setCount();
    });
  }

  @override
  Widget build(BuildContext context) {
    final countProvider = Provider.of<CountProvider>(context,
        listen: false); //descibe class name,  &  listen false

    print("build");

    return Scaffold(
      appBar: AppBar(
        title: Text("Stateful with provider"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child:

              //describe which ui you have to update that with consumer
              //consumer need build  ---> context, value and child and return widget
              //with consumer add a class name that provide change notifier used

              Consumer<CountProvider>(builder: (context, value, child) {
            return Text(
              value.count.toString(), //decribe final method
              style: TextStyle(fontSize: 50),
            );
          })),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          countProvider.setCount();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
