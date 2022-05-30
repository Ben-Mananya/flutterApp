import 'package:flutter/material.dart' ;
import 'package:flutter_quiz/view/Quiz.dart';
import 'Variable.dart';
class HomePage extends StatefulWidget{
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState()=> _HomePageState();
}

class _HomePageState extends State<HomePage>{

  TextEditingController nicknameControl = TextEditingController();
  Color? colorInput = Colors.blue[200];

  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: buildText(text: "QuizApp",size: 16.0,weight: FontWeight.bold),
        ),
       
        body: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Center(
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              buildText(text: "กรุณากรอกชื่อเล่น",size: 20.0,weight: FontWeight.bold,color: Colors.blue[400]),
              buildHeight(height: 20.0),
              buildInput(text: "ชื่อเล่น",color: colorInput),
              buildHeight(height: 20.0),
              buildButton(text: "START",size: 12.0,weight: FontWeight.normal,widthButton: 100.0,heightButton: 50.0)
            ],
            ),
          ),
        ),
    );
  }


  buildText({text,size,weight,color}){
    return Text(text, style: TextStyle(fontSize:size,fontWeight:weight,color: color));
  }


  buildInput({text,color}){
    return TextFormField(
      controller:nicknameControl,
      decoration: InputDecoration(
        labelText: text,
        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: color)) ,
        labelStyle: TextStyle(color: color)
        ),
    );
  }

buildButton({text,size,weight,color,heightButton,widthButton}){
  return Container(
    width: widthButton,
    height:heightButton ,
    child: ElevatedButton(onPressed: (){

      if(nicknameControl.text ==""){
        setState(() {
          colorInput = Colors.red ;       
          });
      }else{
        nickname = nicknameControl.text; //เก็บค่าชื่อเล่น

      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder:(context) => Quiz()), (route) => false);

      }
    },
    child: buildText(text:text , size: size , weight: weight , color: color )),
  );
}



buildHeight({height}){
  return SizedBox(
    height: height,
  );
}


}
