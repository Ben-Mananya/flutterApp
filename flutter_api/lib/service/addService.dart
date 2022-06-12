import 'package:http/http.dart' as http;
import 'package:flutter_api/variable.dart';
import 'package:flutter_api/model/addModel.dart';

class addService{
   static Future<UserAdd?> AddUser({String? username, String? password, String? firstname, String? lastname,}) async{
     final String url = url_local + '/addUser';

     final response = await http.post(Uri.parse(url),
      body: {
        "username": username,
        "password": password,
        "firstname": firstname,
        "lastname": lastname

      },
      headers: {
        "Content-Type" : "application/x-www-form-urlencoded"
      }
     );

     if(response.statusCode == 200){
       final String responseseString =response.body;

       return userAddFromJson(responseseString);

     }else{

     }
   }
}