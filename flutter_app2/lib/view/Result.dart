import 'package:flutter/material.dart';
import 'package:flutter_app2/view/Homepage.dart';
import 'package:flutter_app2/view/variable.dart';


class finalPage extends StatefulWidget {
  const finalPage({Key? key}) : super(key: key);

  @override
  _finalPage createState() => _finalPage();
}

class _finalPage extends State<finalPage>{

 int point = 0 ;
 var check = [] ;

  @override
  Widget build(BuildContext context){
 buildResult();
     return Scaffold(appBar: AppBar(
      title : Text("Score")
     ),
     body: Padding(
       padding: const EdgeInsets.all(40.0),
         child: Center(
           child: Column(
             mainAxisAlignment:MainAxisAlignment.center,
             //crossAxisAlignment: CrossAxisAlignment.start, //จัดแนวนอน
             children: [
              buildText(text: "คะแนนของคุณ "+nickname +" คือ" ,size:20.0,weight: FontWeight.bold ,color: Colors.blue[400]),
              buildHeight(height: 10.0),
                Text("$point" ,style:TextStyle(color:Colors.blue[200],fontSize: 35.0) ),
              buildHeight(height: 20.0),

              for(var i=0;i<answer.length;i++)
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text("ข้อที่: "+(i+1).toString()+" คุณ "+nickname+" ตอบ: "+income_answer[i]+"   เป็นคำตอบที่: "+check[i]+"   เฉลย: "+answer[i], 
                  style:TextStyle(color:Colors.blue[400])),
                ),
              buildHeight(height: 20.0),
              buildButton(text: "เริ่มใหม่",heightButton: 50.0,widthButton: 100.0)
              
             ],
       ),
         ),
     ),
    );
  }
  buildText({text,size,weight,color}){
    return Text(text, style: TextStyle(fontSize: size, fontWeight: weight , color:  color));
  }
buildHeight({height}){
  return SizedBox(
    height: height,
  );
}

buildButton({text, heightButton, widthButton}){
  
  return Center(
  child: Container(
   
    width: widthButton,
    height: heightButton,
    child: ElevatedButton(onPressed:() {

      check = [];
      income_answer = [] ;
      point = 0 ;

      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder:(context) => HomePage()), (route) => false);
      

    },child: buildText(text: text , size:15.0)),
  )
  );
}

buildResult(){
  point = 0 ;
  
  for(var i=0; i<answer.length ;i++){
    if(income_answer[i] == answer[i]){
        point++ ;
        check.add("ถูก");
       
    }else{
        check.add("ผิด");
        
    }
    
  }
}

}
   
  
  
