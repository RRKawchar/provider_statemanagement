import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
   HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
    int x=10;

  @override
  Widget build(BuildContext context) {
    print("Rebuild");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider State management"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Text(DateTime.now().toString()),
        Center(
          child: Container(
            child: Text(x.toString(),style: const TextStyle(
              fontSize: 50
            ),),
          ),
        )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {

          });
          x++;
          print(x);
        },
        child: const Icon(Icons.add),
      ),

    );
  }
}
