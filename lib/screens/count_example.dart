import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_statemanagement/provider/count_provider.dart';

class CountExample extends StatefulWidget {
  const CountExample({super.key});

  @override
  State<CountExample> createState() => _CountExampleState();
}

class _CountExampleState extends State<CountExample> {
  @override
  void initState() {
    final countProvide=Provider.of<CountProvider>(context,listen: false);
    super.initState();

    Timer.periodic(Duration(seconds: 1), (timer) {
      countProvide.setCount();
    });


  }

  @override
  Widget build(BuildContext context) {
    final countProvide=Provider.of<CountProvider>(context,listen: false);
    print("Rebuild");
    return Scaffold(
      appBar: AppBar(
        title: Text("Count Example"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Consumer<CountProvider>(builder: (context,value,child){
            print("Only build this Widget");
            return Center(child: Text(value.count.toString(),style: TextStyle(fontSize: 50),));
          } ,),

        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          countProvide.setCount();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
