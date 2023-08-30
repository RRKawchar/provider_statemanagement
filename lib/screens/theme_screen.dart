import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_statemanagement/provider/theme_change_provider.dart';

class ThemeScreen extends StatefulWidget {
  const ThemeScreen({super.key});

  @override
  State<ThemeScreen> createState() => _ThemeScreenState();
}

class _ThemeScreenState extends State<ThemeScreen> {
  @override
  Widget build(BuildContext context) {
    final themeProvider=Provider.of<ThemeChangeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Theme Mode"),
      ),
          body: Column(
        children: [
          RadioListTile<ThemeMode>(
            title: const Text("Light Mode"),
              value: ThemeMode.light,
              groupValue: themeProvider.themeMode,
              onChanged: themeProvider.setTheme
          ),
          RadioListTile<ThemeMode>(
              title: const Text("Dark Mode"),
              value: ThemeMode.dark,
              groupValue: themeProvider.themeMode,
              onChanged: themeProvider.setTheme
          ),
          RadioListTile<ThemeMode>(
              title: const Text("System Mode"),
              value: ThemeMode.system,
              groupValue: themeProvider.themeMode,
              onChanged: themeProvider.setTheme
          ),

          const Icon(Icons.favorite)
      ],
    ),
    );
  }
}
