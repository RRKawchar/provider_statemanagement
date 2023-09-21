import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

class AuthProvider with ChangeNotifier {

  bool _isLoading=false;
  bool get isLoading=> _isLoading;

  bool _isObsecureText=true;
  bool get isObsecureText=> _isObsecureText;

   showPass(){
     _isObsecureText=! _isObsecureText;
     notifyListeners();
   }

  setLoading(bool value){
    _isLoading=value;
    notifyListeners();
  }





  login(String email, String password) async {
    setLoading(true);
    try {
      Response response =
          await post(Uri.parse('https://reqres.in/api/login'), body: {
        "email": email,
        "password": password,
      });

      if (response.statusCode == 200) {
        setLoading(false);
        print("Login Successfully");
      } else {
        setLoading(false);
        print("Login Failed!!");
      }
    } catch (e) {
      setLoading(false);
      print(e.toString());
    }
  }
}
