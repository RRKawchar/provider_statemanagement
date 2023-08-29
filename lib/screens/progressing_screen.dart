import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_statemanagement/provider/progressing_provider.dart';

class ProgressingScreen extends StatefulWidget {
  const ProgressingScreen({super.key});

  @override
  State<ProgressingScreen> createState() => _ProgressingScreenState();
}

class _ProgressingScreenState extends State<ProgressingScreen> {

  @override
  Widget build(BuildContext context) {
    final provider=Provider.of<ProgressingProvider>(context,listen: false);
    print("Rebuild");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Progress test"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Consumer<ProgressingProvider>(builder: (context,value,child){
            return Text(value.value.toString());
          }),

          Consumer<ProgressingProvider>(builder: (context,value,child){
            return Slider(
                min: 0,
                max: 1,
                value: value.value, onChanged: (val){
              print(value.value);
              value.setValue(val);
            },);
          },),



          Consumer<ProgressingProvider>(builder: (context,value,child){
            return Row(
              children: [

                Expanded(
                  child: Container(
                    height: 100,
                    color: Colors.green.withOpacity(value.value),
                    child: const Center(
                      child: Text("Container1"),
                    ),
                  ),
                ),
                const SizedBox(width: 10,),
                Expanded(
                  child: Container(
                    height: 100,
                    color: Colors.red.withOpacity(value.value),
                    child: const Center(
                      child: Text("Container2"),
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
