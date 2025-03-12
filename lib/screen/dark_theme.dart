import 'package:apiexample/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DarkTheme extends StatefulWidget {
  const DarkTheme({super.key});

  @override
  State<DarkTheme> createState() => _DarkThemeState();
}

class _DarkThemeState extends State<DarkTheme> {
  @override
  Widget build(BuildContext context) {


    //describe provider class...

  final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Theme Example"
        ),


        ),

      body: Column(
        children: [

          //radio list tile 


          RadioListTile<ThemeMode>(
            title: Text("Light Mode"),
            value: ThemeMode.light,
             groupValue:themeProvider.themeMode , 
             onChanged:themeProvider.setTheme

          ),


            RadioListTile<ThemeMode>(
            title: Text("Dark Mode"),
            value: ThemeMode.dark,
             groupValue:themeProvider.themeMode , 
             onChanged:themeProvider.setTheme

          ),

             RadioListTile<ThemeMode>(
            title: Text("System Mode"),
            value: ThemeMode.system,
             groupValue:themeProvider.themeMode , 
             onChanged:themeProvider.setTheme

          ),


          Icon(Icons.favorite),


        ],
      ),
    );
  }
}