import 'package:apiexample/provider/auth_provider.dart';
import 'package:apiexample/provider/count_provider.dart';
import 'package:apiexample/provider/example_one_provider.dart';
import 'package:apiexample/provider/theme_provider.dart';
import 'package:apiexample/screen/api_example.dart';
import 'package:apiexample/screen/api_get_example.dart';
import 'package:apiexample/screen/dark_theme.dart';
import 'package:apiexample/screen/example_four.dart';
//import 'package:apiexample/screen/chome_page.dart';
import 'package:apiexample/screen/example_one_page.dart';
import 'package:apiexample/screen/example_three.dart';
import 'package:apiexample/screen/login_page.dart';
import 'package:apiexample/screen/signup.dart';
import 'package:apiexample/screen/upload_image.dart';
import 'package:apiexample/screen/value_notify_listner_page.dart';
import 'package:apiexample/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CountProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ExampleOneProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(),
        ),

           ChangeNotifierProvider(
          create: (_) => AuthProvider(),
        ),
      ],
    

      child: Builder(builder: (BuildContext context) {

        final themeProvider = Provider.of<ThemeProvider>(context);
        return MaterialApp(

          //light 
          theme: ThemeData(
            brightness: Brightness.light,
            primarySwatch: Colors.blueGrey,
          ),

          themeMode: themeProvider.themeMode,

          //dark
          darkTheme: ThemeData(
            brightness: Brightness.dark,
           primarySwatch: Colors.cyan,
              //appbar 
           appBarTheme:AppBarTheme(
            backgroundColor: Colors.cyan,
           ),

           //icon

           iconTheme: IconThemeData(
            color: Colors.pink,
           )

          ),
          home: UploadImageScreen(),
        );
      }),
    );
  }
}



//single

 /* return ChangeNotifierProvider(
      create: (_) => CountProvider(), 
      child: MaterialApp.... */



//multiple

/*

return MultiProvider
    
    (providers: [
      ChangeNotifierProvider(create: (_)=>CountProvider(), ),
            ChangeNotifierProvider(create: (_)=>ExampleOneProvider(), ),

    ],
    
    );


*/ 


// for theme you have to  use builder  and the return material app


/*
child: Builder(builder: (BuildContext context) {

        final themeProvider = Provider.of<ThemeProvider>(context);
        return MaterialApp(

          //light 
          theme: ThemeData(
            brightness: Brightness.light,
            primarySwatch: Colors.blueGrey,
          ),

          themeMode: themeProvider.themeMode,

          //dark
          darkTheme: ThemeData(
            brightness: Brightness.dark,
           primarySwatch: Colors.cyan,
              //appbar 
           appBarTheme:AppBarTheme(
            backgroundColor: Colors.cyan,
           ),

           //icon

           iconTheme: IconThemeData(
            color: Colors.pink,
           )

          ),
          home: DarkTheme(),
        );
      }),



 */


