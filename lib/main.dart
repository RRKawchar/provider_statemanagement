import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_statemanagement/provider/count_provider.dart';
import 'package:provider_statemanagement/provider/favorite_provider.dart';
import 'package:provider_statemanagement/provider/progressing_provider.dart';
import 'package:provider_statemanagement/screens/count_example.dart';
import 'package:provider_statemanagement/screens/favorite_screen.dart';
import 'package:provider_statemanagement/screens/home_screen.dart';
import 'package:provider_statemanagement/screens/progressing_screen.dart';
import 'package:provider_statemanagement/screens/why_provider_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
        providers:[

          ChangeNotifierProvider(
              create: (_)=>CountProvider(),
          ),
          ChangeNotifierProvider(
            create: (_)=>ProgressingProvider(),
          ),
          ChangeNotifierProvider(
            create: (_)=>FavoriteProvider(),
          ),

    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      home: const FavoriteScreen(),
    ),
    );


      ;

  }
}


