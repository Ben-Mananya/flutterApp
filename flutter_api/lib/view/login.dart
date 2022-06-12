import 'package:flutter/material.dart';
import 'package:flutter_api/model/loginModel.dart';
import 'package:flutter_api/service/loginService.dart';
import 'package:flutter_api/view/home.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Welcome? welcome = Welcome();
  String? incorrect = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            
            buildText(text: 'เข้าสู่ระบบ', size: 20.0),
            buildSizebox(height: 15.0),
            buildUsername(),
            buildSizebox(height: 15.0),
            buildPassword(),
            buildSizebox(height: 15.0),
            buildText(text: '$incorrect',size:12.0,color: Colors.red),
            buildButton()
          ],
        ),
      ),
    );
  }

  buildText({text, size , weight , color}){
    return Text(text , style: TextStyle(fontSize: size, fontWeight: weight , color:  color));
  }

  buildUsername(){
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      child: TextFormField(
        controller: usernameController,
        decoration: InputDecoration(
          labelText: 'Username',
          icon: Icon(Icons.person_outline),
          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black))

        ),

      ),
    );
  }

  buildPassword(){
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      child: TextFormField(
        controller: passwordController,
        decoration: InputDecoration(
          labelText: 'Password',
          icon: Icon(Icons.key_outlined),
          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black))
        ),
      ),
    );
  }

  buildButton(){
    return ElevatedButton(onPressed: (){

      checkLogin(username: usernameController.text, password: passwordController.text);
    },child: buildText(text: 'Login'),
    );
  }

  buildSizebox({height , width}){
    return SizedBox(
      height: height,
      width: width,
    );

  
  }

  void checkLogin({username , password}) async{
    if(username != "" || password ==""){

      final Welcome? data = await loginService.loginUser(username: username , password: password);

      setState(() {
        welcome = data ;
      });

      if(data != null){
        if(welcome!.status == 1){//login สำเร็จ

            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder:(context) => HomePage()), (route) => false);

        }else{
          setState(() {
            incorrect = welcome!.massage;
          });

          print("Username or password incorrect!!");
        }
      }
    }else{
      setState(() {
            incorrect = welcome!.massage;
          });
    }
  }


}