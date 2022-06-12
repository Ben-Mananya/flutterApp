import 'package:flutter_api/model/updateModel.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_api/variable.dart';


class updateService{
   static Future<UserUpdate?> UpdateUser({int? id ,String? username, String? password, String? firstname, String? lastname,}) async{
     final String url = url_local + '/updateUser';

     final response = await http.post(Uri.parse(url),
      body: {
        "id": id.toString(),
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

       return userUpdateFromJson(responseseString);

     }else{

     }
   }
}