import 'package:flutter/material.dart';
import 'package:flutter_app2/view/Result.dart';
//import 'package:flutter/widgets.dart';
import 'package:flutter_app2/view/variable.dart';


class NumberPage5 extends StatefulWidget {
  const NumberPage5({Key? key}) : super(key: key);

  @override
  _NumberPage5State createState() => _NumberPage5State();
}

class _NumberPage5State extends State<NumberPage5>{

  String? answer ="";

  @override
  Widget build(BuildContext context){
     return Scaffold(appBar: AppBar(
      title : Text("Question5")
     ),
     body: Padding(
       padding: const EdgeInsets.all(30.0),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start, //จัดแนวนอน
         children: [
           buildProgress(),
           buildText(text: "5. คำถามข้อที่ 5",size: 20.0,weight: FontWeight.bold),
           buildRadio(text: "ตอบ A", value: "A"),
           buildRadio(text: "ตอบ B", value: "B"),
           buildRadio(text: "ตอบ C", value: "C"),
           buildRadio(text: "ตอบ D", value: "D"),
           buildButton(text: "NEXT",heightButton: 50.0,widthButton: 100.0)
         ],
         ),
     ),
    );
  }
  buildText({text,size,weight,color}){
    return Text(text, style: TextStyle(fontSize: size, fontWeight: weight , color:  color));
  }

  buildProgress(){
    return Container(
      alignment: Alignment.topCenter,
      margin: EdgeInsets.all(20.0),
      child: LinearProgressIndicator(
        value: 1.0,
        valueColor: new AlwaysStoppedAnimation<Color>(Colors.green),
        backgroundColor: Colors.grey,
      ) ,
    );
  }

  buildRadio({text , value}){
    return ListTile(
      title: buildText(text : text, size:20.0),
      leading: Radio<String?>(
        value: value,
        groupValue: answer,
        onChanged: (val){

        

            setState(() {
              answer = val ;
            });
        },
      ),
    );
  }

buildButton({text, heightButton, widthButton}){
  return Center(
  child: Container(
    width: widthButton,
    height: heightButton,
    child: ElevatedButton(onPressed:() {

      if(answer !=""){
        income_answer.add(answer);

       Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder:(context) => finalPage()), (route) => false);
      }
      
      

    },child: buildText(text: text , size:15.0)),
  )
  );
}

}
   
  
  
