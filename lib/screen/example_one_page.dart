import 'package:apiexample/provider/example_one_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExampleOnePage extends StatefulWidget {
  const ExampleOnePage({super.key});

  @override
  State<ExampleOnePage> createState() => _ExampleOnePageState();
}

class _ExampleOnePageState extends State<ExampleOnePage> {
  @override
  Widget build(BuildContext context) {
    print("build");

    return Scaffold(
      appBar: AppBar(
        title: Text("Provider Example"),
      ),
      body: Column(
        children: [
          //only build particular widget you need Consumer

          Consumer<ExampleOneProvider>(builder: (context, value, child) {
            return Slider(
                min: 0,
                max: 1,
                value: value.value,
                onChanged: (val) {
                  value.setValue(val);
                });
          }),

          Consumer<ExampleOneProvider>(builder: (context, value, child) {
            return Row(
              children: [
                //1
                Expanded(
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.amber.withOpacity(value.value),
                    ),
                    child: Center(
                      child: Text("Container 1"),
                    ),
                  ),
                ),

                //2

                Expanded(
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.pink.withOpacity(value.value),
                    ),
                    child: Center(
                      child: Text("Container 2"),
                    ),
                  ),
                ),
              ],
            );
          }),
        ],
      ),
    );
  }
}
