import 'package:flutter/cupertino.dart';

class FavoriteProvider with ChangeNotifier{


  List<int> _selectedIndex=[];
  
  List<int> get selectedIndex => _selectedIndex; 
  
  
  void addItem(int value){
    _selectedIndex.add(value);
    notifyListeners();
  }

  void removeItem(int value){
    _selectedIndex.remove(value);
    notifyListeners();
  }
  

}