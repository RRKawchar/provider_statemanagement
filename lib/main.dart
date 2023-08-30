import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_statemanagement/provider/count_provider.dart';
import 'package:provider_statemanagement/provider/favorite_provider.dart';
import 'package:provider_statemanagement/provider/progressing_provider.dart';
import 'package:provider_statemanagement/provider/theme_change_provider.dart';
import 'package:provider_statemanagement/screens/count_example.dart';
import 'package:provider_statemanagement/screens/favorite_screen.dart';
import 'package:provider_statemanagement/screens/home_screen.dart';
import 'package:provider_statemanagement/screens/progressing_screen.dart';
import 'package:provider_statemanagement/screens/theme_screen.dart';
import 'package:provider_statemanagement/screens/why_provider_screen.dart';
import 'package:provider_statemanagement/utils/my_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();
  final themeProvider = ThemeChangeProvider(sharedPreferences);
  await themeProvider.initializeTheme(); // Load the previously selected theme mode
  runApp(
    ChangeNotifierProvider.value(
      value: themeProvider,
      child: MyApp(),
    ),
  );
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
    child: Builder(builder: (context){
      final themeProvider=Provider.of<ThemeChangeProvider>(context);
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: MyTheme.lightTheme,
        themeMode: themeProvider.themeMode,
        darkTheme: MyTheme.darkTheme,
        home: const ThemeScreen(),
      );
    },)
    );


      ;

  }
}


