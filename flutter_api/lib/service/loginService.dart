
import 'package:flutter_api/model/loginModel.dart';
import 'package:flutter_api/variable.dart';
import 'package:http/http.dart' as http;

class loginService{
   static Future<Welcome?> loginUser({String? username, String? password}) async{
     final String url = url_local + '/login';

     final response = await http.post(Uri.parse(url),
      body: {
        "username": username,
        "password": password

      },
      headers: {
        "Content-Type" : "application/x-www-form-urlencoded"
      }
     );

     if(response.statusCode == 200){
       final String responseseString =response.body;

       return welcomeFromJson(responseseString);

     }else{

     }
   }
}