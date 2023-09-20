import 'package:flutter/material.dart';

class ValueNotifierListener extends StatelessWidget {
  ValueNotifierListener({super.key});

  ValueNotifier<int> _counter = ValueNotifier<int>(0);
  ValueNotifier<bool> toggle = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    print("Rebuild");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifier Listener"),
      ),
      body: Column(
        children: [
          ValueListenableBuilder(
              valueListenable: toggle,
              builder: (context,value,child){
                return  TextFormField(
                  obscureText: toggle.value,
                  decoration: InputDecoration(
                      hintText: "Password",
                      suffixIcon: InkWell(

                          onTap: (){
                            toggle.value=!toggle.value;
                          },
                          child: Icon(toggle.value?Icons.visibility_off:Icons.visibility))
                  ),
                );
              }
          ),

          Center(
            child: ValueListenableBuilder(
              valueListenable: _counter,
              builder: (context,value,child){
                return Text(
                  _counter.value.toString(),
                  style: TextStyle(fontSize: 50),
                );
              },
            ),),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _counter.value++;
          print(_counter.value.toString());
        },
        child: Icon(Icons.add),
      ),
    );

  }

}
