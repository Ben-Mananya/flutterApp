import 'dart:convert';
import 'dart:math';

import 'package:flutter_api/model/userModel.dart';
import 'package:flutter_api/variable.dart';
import 'package:http/http.dart' ;

class userService{
   final String url = url_local + '/getUserAll';

   Future<List<UserModel>> getUserAll() async{
   final response = await get(Uri.parse(url));
   if(response.statusCode == 200){
       final List result = jsonDecode(response.body)['data'];

       return result.map(((e) => UserModel.fromJson(e))).toList();

     }else{
       throw Exception(response.reasonPhrase);
     }
   }
}