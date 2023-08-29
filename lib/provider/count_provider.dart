import 'package:flutter/cupertino.dart';

class CountProvider with ChangeNotifier{

  int _count=2;
   int get count => _count;


   setCount(){
     _count++;
     notifyListeners();
   }

}