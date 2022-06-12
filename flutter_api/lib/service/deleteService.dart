
import 'package:flutter_api/model/deleteModel.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_api/variable.dart';


class deleteService{
   static Future<UserDelete?> DeleteUser({int? id}) async{
     final String url = url_local + '/deleteUser';

     final response = await http.post(Uri.parse(url),
      body: {
        "id": id.toString(), 

      },
      headers: {
        "Content-Type" : "application/x-www-form-urlencoded"
      }
     );

     if(response.statusCode == 200){
       final String responseseString = response.body;

       return userDeleteFromJson(responseseString);

     }else{

     }
   }
}