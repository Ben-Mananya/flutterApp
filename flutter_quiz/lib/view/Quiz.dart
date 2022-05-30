import 'package:flutter/material.dart';
import 'package:flutter_quiz/view/Homepage.dart';
import 'Variable.dart';


class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  QuizState createState() => QuizState();
}


class QuizState extends State<Quiz>{
 
  String? answer1="" ;
  String? answer2="" ;
  String? answer3="" ;
  String? answer4="" ;
  String? answer5="" ;

  @override
  Widget build(BuildContext context){
    
     return Scaffold(appBar: AppBar(
      title : Text('Question')
     ),
      body: SingleChildScrollView(
          
          child: Padding(
            padding: const EdgeInsets.only(left: 25.0,right: 25.0,bottom: 30.0,top: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, //จัดแนวนอน
    
              children: <Widget>[
                
            
                      buildText(text: "1. คำถามข้อที่ 1",size: 20.0,weight: FontWeight.bold),
                      buildRadio1(text: "ตอบ A", value: "A"),
                      buildRadio1(text: "ตอบ B", value: "B"),
                      buildRadio1(text: "ตอบ C", value: "C"),
                      buildRadio1(text: "ตอบ D", value: "D"),   
                      buildDivider(),

                      buildText(text: "2. คำถามข้อที่ 2",size: 20.0,weight: FontWeight.bold),
                      buildRadio2(text: "ตอบ A", value: "A" ),
                      buildRadio2(text: "ตอบ B", value: "B"),
                      buildRadio2(text: "ตอบ C", value: "C"),
                      buildRadio2(text: "ตอบ D", value: "D"),
                      buildDivider(),

                      buildText(text: "3. คำถามข้อที่ 3",size: 20.0,weight: FontWeight.bold),
                      buildRadio3(text: "ตอบ A", value: "A" ),
                      buildRadio3(text: "ตอบ B", value: "B"),
                      buildRadio3(text: "ตอบ C", value: "C"),
                      buildRadio3(text: "ตอบ D", value: "D"),
                      buildDivider(),

                      buildText(text: "4. คำถามข้อที่ 4",size: 20.0,weight: FontWeight.bold),
                      buildRadio4(text: "ตอบ A", value: "A" ),
                      buildRadio4(text: "ตอบ B", value: "B"),
                      buildRadio4(text: "ตอบ C", value: "C"),
                      buildRadio4(text: "ตอบ D", value: "D"), 
                      buildDivider(),

                      buildText(text: "5. คำถามข้อที่ 5",size: 20.0,weight: FontWeight.bold),
                      buildRadio5(text: "ตอบ A", value: "A" ),
                      buildRadio5(text: "ตอบ B", value: "B"),
                      buildRadio5(text: "ตอบ C", value: "C"),
                      buildRadio5(text: "ตอบ D", value: "D"), 

                       buildHeight(height: 30.0),
                      buildButton(text: "ส่งคำตอบ",heightButton: 50.0,widthButton: 100.0)

                       
              ],
             
            ),
          ),
        ),

    );
  }
  buildText({text,size,weight,color}){
    return Text(text, style: TextStyle(fontSize: size, fontWeight: weight , color:  color));
  }
  buildDivider(){
    return Divider(
      color: Colors.grey,
      thickness: 1.0, //ความหนา
      height: 50.0, //ระยะห่าง
      indent: 10.0, //เส้นต้น
      endIndent: 10.0, //เส้นปลาย
      );
  }
  

  buildRadio1({text , value }){
    
    return ListTile(
      title: buildText(text : text, size:20.0),
      leading: Radio<String?>(
        value: value,
        groupValue: (answer1),
        onChanged: (val){

            setState(() {
              answer1 = val;
            });

        }),
    );
  }
  buildRadio2({text , value }){
    
    return ListTile(
      title: buildText(text : text, size:20.0),
      leading: Radio<String?>(
        value: value,
        groupValue: (answer2),
        onChanged: (val){

            setState(() {
              answer2 = val;
            });

        },
      ),
    );
  }

  buildRadio3({text , value }){
    
    return ListTile(
      title: buildText(text : text, size:20.0),
      leading: Radio<String?>(
        value: value,
        groupValue: (answer3),
        onChanged: (val){

            setState(() {
              answer3 = val;
            });
  
        },
      ),
    );
  }

  buildRadio4({text , value }){
    
    return ListTile(
      title: buildText(text : text, size:20.0),
      leading: Radio<String?>(
        value: value,
        groupValue: (answer4),
        onChanged: (val){

            setState(() {
              answer4 = val;
            });
          
        },
      ),
    );
  }
  buildRadio5({text , value }){
    
    return ListTile(
      title: buildText(text : text, size:20.0),
      leading: Radio<String?>(
        value: value,
        groupValue: (answer5),
        onChanged: (val){

            setState(() {
              answer5 = val;
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

      checkAnswer();
      
        showDialog(
          context: context, 
          builder: (context) => AlertDialog(
            title: Text('คะแนนของคุณ $nickname คือ $point'),

            content:buildText(text:("ข้อที่:1 "+" คุณ "+nickname+" ตอบ: "+answer1.toString()+"   เป็นคำตอบที่: "+income_answer[0]+"   เฉลย: "+realanswer[0]
            +'\nข้อที่:2  คุณ '+nickname+" ตอบ: "+answer2.toString()+"   เป็นคำตอบที่: "+income_answer[1]+"   เฉลย: "+realanswer[1]
            +'\nข้อที่:3  คุณ '+nickname+" ตอบ: "+answer3.toString()+"   เป็นคำตอบที่: "+income_answer[2]+"   เฉลย: "+realanswer[2]
            +'\nข้อที่:4  คุณ '+nickname+" ตอบ: "+answer4.toString()+"   เป็นคำตอบที่: "+income_answer[3]+"   เฉลย: "+realanswer[3]
            +'\nข้อที่:5  คุณ '+nickname+" ตอบ: "+answer5.toString()+"   เป็นคำตอบที่: "+income_answer[4]+"   เฉลย: "+realanswer[4]
            ),size: 12.0),
          

            actions: [
              TextButton(
                child: Text('Cancel'),
                onPressed:()=> {Navigator.pop(context),
                  point = 0,
                  income_answer=[],
                  }
                ),
                TextButton(
                child: Text('Finish'),
                onPressed:()=> {Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder:(context) => HomePage()), (route) => false),
                    point = 0,
                    answer1="",answer2="",answer3="",answer4="",answer5="",
                    income_answer=[],
                }
                          
                ),
            ],
          ),
          );
       //end if
      

    },child: buildText(text: text , size:15.0)),
  )
  );
 }


checkAnswer(){
  var answer = [answer1,answer2,answer3,answer4,answer5];

  for(var i=0; i<answer.length ;i++){
    if(answer[i] == realanswer[i]){
        point++;
        income_answer.add("ถูก");
       
       
    }else{
        income_answer.add("ผิด");
      
    }
  }
}

buildHeight({height}){
  return SizedBox(
    height: height,
  );
}


}
   
  
  
