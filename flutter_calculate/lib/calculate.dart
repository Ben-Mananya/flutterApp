
import 'package:flutter/material.dart';
import 'package:cool_alert/cool_alert.dart';

class HomeCalculate extends StatefulWidget {
  const HomeCalculate({Key? key}) : super(key: key);

  @override
  _HomeCalculateState createState() => _HomeCalculateState();
}

class _HomeCalculateState extends State<HomeCalculate> {

  String output ="0";
  String output2 ="0";
  double num1 = 0 ; //ใช้คำนวณ
  double num2 = 0 ;
  String operation = ""; //เก็บสัญลักษณ์ + - / *
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: buildText(text: "Calculate App"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
         
          children: [
            buildText(text: "$output", size: 70.0, weight: FontWeight.bold , alignment: Alignment.centerRight),
            Container(
              child: Row(
                  children: [
                    buildButton(
                      text: "C",
                      size:25.0, 
                      weight: FontWeight.bold,
                      back_color: Colors.grey[300] ,
                      widgth: MediaQuery.of(context).size.width *0.25 , 
                      height: MediaQuery.of(context).size.height * 0.15,
                      onTap: (){buttonPressed('C');} ),
                    buildButton(
                      text: "+/-", 
                      size:25.0, 
                      weight: FontWeight.bold,
                      back_color: Colors.grey[300],
                      widgth: MediaQuery.of(context).size.width *0.25 , 
                      height: MediaQuery.of(context).size.height * 0.15 ,
                      onTap: (){buttonPressed('+/-');} ),
                    buildButton(
                      text: "%", 
                      size:25.0, 
                      weight: FontWeight.bold,
                      back_color: Colors.grey[300],
                      widgth: MediaQuery.of(context).size.width *0.25, 
                      height: MediaQuery.of(context).size.height * 0.15 ,
                      onTap: (){buttonPressed("%");}  ),
                    buildButton(
                      text: "⌦", 
                      size:25.0, 
                      weight: FontWeight.bold,
                      textColor: Colors.white, 
                      back_color: Colors.orange,
                      widgth: MediaQuery.of(context).size.width *0.25 , 
                      height: MediaQuery.of(context).size.height * 0.15 ,
                      onTap: (){removeAnswerLast();}  ),
                  ],
              ),
            ),
            Container(
               child: Row(
                  children: [
                    buildButton(
                      text: "7", 
                      size:25.0, 
                      weight: FontWeight.bold,
                      back_color: Colors.grey[300], 
                      widgth: MediaQuery.of(context).size.width *0.25, 
                      height: MediaQuery.of(context).size.height * 0.15, 
                      onTap: (){buttonPressed("7"); } ),
                    buildButton(
                      text: "8", 
                      size:25.0, 
                      weight: FontWeight.bold,
                      back_color: Colors.grey[300],
                      widgth: MediaQuery.of(context).size.width *0.25 , 
                      height: MediaQuery.of(context).size.height * 0.15, 
                      onTap: (){buttonPressed("8");}),
                    buildButton(
                      text: "9", 
                      size:25.0, 
                      weight: FontWeight.bold,
                      back_color: Colors.grey[300],
                      widgth: MediaQuery.of(context).size.width *0.25 , 
                      height: MediaQuery.of(context).size.height * 0.15, 
                      onTap: (){buttonPressed("9");}),
                    buildButton(
                      text: "÷", 
                      size:25.0, 
                      weight: FontWeight.bold,
                      textColor: Colors.white,
                      back_color: Colors.orange,
                      widgth: MediaQuery.of(context).size.width *0.25 , 
                      height: MediaQuery.of(context).size.height * 0.15, 
                      onTap: (){buttonPressed("÷");}),
                  ],
              ),
            ),
            Container(
               child: Row(
                  children: [
                    buildButton(
                      text: "4", 
                      size:25.0,
                      back_color: Colors.grey[300], 
                      weight: FontWeight.bold,
                      widgth: MediaQuery.of(context).size.width *0.25 , 
                      height: MediaQuery.of(context).size.height * 0.15, 
                      onTap: (){buttonPressed("4");}),
                    buildButton(
                      text: "5", 
                      size:25.0,
                      back_color: Colors.grey[300], 
                      weight: FontWeight.bold,
                      widgth: MediaQuery.of(context).size.width *0.25 , 
                      height: MediaQuery.of(context).size.height * 0.15, 
                      onTap: (){buttonPressed("5");}),
                    buildButton(
                      text: "6", 
                      size:25.0,
                      back_color: Colors.grey[300], 
                      weight: FontWeight.bold,
                      widgth: MediaQuery.of(context).size.width *0.25 , 
                      height: MediaQuery.of(context).size.height * 0.15, 
                      onTap: (){buttonPressed("6");}),
                    buildButton(
                      text: "x", 
                      size:25.0,
                      textColor: Colors.white,
                      back_color: Colors.orange, 
                      weight: FontWeight.bold,
                      widgth: MediaQuery.of(context).size.width *0.25 , 
                      height: MediaQuery.of(context).size.height * 0.15, 
                      onTap: (){buttonPressed("x");}),
                  ],
              ),
            ),
            Container(
               child: Row(
                  children: [
                    buildButton(
                      text: "1", 
                      size:25.0, 
                      weight: FontWeight.bold,
                      back_color: Colors.grey[300],
                      widgth: MediaQuery.of(context).size.width *0.25 , 
                      height: MediaQuery.of(context).size.height * 0.15, 
                      onTap: (){buttonPressed("1");}),
                    buildButton(
                      text: "2", 
                      size:25.0, 
                      weight: FontWeight.bold,
                      back_color: Colors.grey[300],
                      widgth: MediaQuery.of(context).size.width *0.25 , 
                      height: MediaQuery.of(context).size.height * 0.15, 
                      onTap: (){buttonPressed("2");}),
                    buildButton(
                      text: "3", 
                      size:25.0, 
                      weight: FontWeight.bold,
                      back_color: Colors.grey[300],
                      widgth: MediaQuery.of(context).size.width *0.25 , 
                      height: MediaQuery.of(context).size.height * 0.15, 
                      onTap: (){buttonPressed("3");}),
                    buildButton(
                      text: "-", 
                      size:35.0,
                      textColor: Colors.white, 
                      weight: FontWeight.bold,
                      back_color: Colors.orange,
                      widgth: MediaQuery.of(context).size.width *0.25 , 
                      height: MediaQuery.of(context).size.height * 0.15, 
                      onTap: (){buttonPressed("-");}),
                    ],
              ),
            ),
            Container(
               child: Row(
                  children: [
                    buildButton(
                      text: "0", 
                      size:25.0,
                      back_color: Colors.grey[300], 
                      weight: FontWeight.bold,widgth: MediaQuery.of(context).size.width *0.25 , 
                      height: MediaQuery.of(context).size.height * 0.15, 
                      onTap: (){buttonPressed("0");}),
                    buildButton(
                      text: ".",
                      size:25.0,
                      back_color: Colors.grey[300], 
                      weight: FontWeight.bold,widgth: MediaQuery.of(context).size.width *0.25 , 
                      height: MediaQuery.of(context).size.height * 0.15, 
                      onTap: (){buttonPressed(".");}),
                    buildButton(
                      text: "=", 
                      size: 30.0,
                      textColor: Colors.white,
                      back_color: Colors.orange, 
                      weight: FontWeight.bold,
                      widgth: MediaQuery.of(context).size.width *0.25 , 
                      height: MediaQuery.of(context).size.height * 0.15, 
                      onTap: (){buttonPressed("=");}),
                      buildButton(
                      text: "+", 
                      size: 30.0,
                      textColor: Colors.white,
                      back_color: Colors.orange, 
                      weight: FontWeight.bold,
                      widgth: MediaQuery.of(context).size.width *0.25 , 
                      height: MediaQuery.of(context).size.height * 0.15, 
                      onTap: (){buttonPressed("+");}),
                   
                  ],
              ),
            )
          ],
        ),
      ),

    );
  }

buildText({text, size, weight, color, width, height, alignment,back_color }){
  return Container(
    alignment: alignment,
    width: width,
    height: height,
    color: back_color,
    child: Text(text, style: TextStyle(fontSize: size, fontWeight: weight, color: color)),
  );
}
Widget buildButton({text, size , weight , widgth , height, back_color, Function()? onTap , textColor }){
  return GestureDetector(
     //action
    onTap: onTap, //ตัวคุมevent
    
    child: Container(
      width: widgth,
      height: height,
      decoration: BoxDecoration(
        color: back_color,
        border: Border.all(
          color: Colors.grey.shade400,
        )
       ),
      
      child:  buildText(text: text,alignment: Alignment.center,color: textColor,size: size,weight: weight ),
    ),
     
   
  );
}

buttonPressed(String buttonText){
  
  if(buttonText == 'C'){
    output2 = '0' ;
    num1 = 0 ;
    num2 = 0 ;
    operation = "";

  }else if(buttonText == '+' || buttonText == '-' || buttonText == 'x'  || buttonText == '÷' || buttonText == '%' ){

    num1 = double.parse(output) ; //แปลงค่า
    operation = buttonText ;
    output2 = '0' ;

  }else if(buttonText == '.'){
     

    if(!output.contains(".")){ //หากoutput ไม่มีเครื่องหมาย . อยู่
      output2 = output2 + buttonText;
      
    }else if(output.split(".").length > 1 ){
        output2 = '0' ;
        operation = "";
        return;
   
    }else{
      output2 = '0';
       operation = "";
       return;
       
    }

  }else if(buttonText == '+/-'){
    if(output[0] != '-' ){
      output2 = '-'+output ;

    }else{
      output2 = output.substring(1);
    }

  }else if(buttonText == '='){
    num2 = double.parse(output);

    if(operation == "+"){
      var splitString = num1.toString().split('.')[1];
      var splitString2 = num2.toString().split('.')[1];
      
      if(splitString.length > 1 || splitString2.length > 1){
       
        output2 =(num1 + num2).toStringAsFixed(2);
      }else{
       
        output2 =(num1 + num2).toStringAsFixed(0);
      }  
    
    }
    
    if(operation == "-"){
      var splitString = num1.toString().split('.')[1];
      var splitString2 = num2.toString().split('.')[1];
      
      if(splitString.length > 1 || splitString2.length > 1){
       
        output2 =(num1 - num2).toStringAsFixed(2);
      }else{
       
        output2 =(num1 - num2).toStringAsFixed(0);
      }
        
    }

    if(operation == "x"){
       
      var splitString = num1.toString().split('.')[1];
      var splitString2 = num2.toString().split('.')[1];
      
      if(splitString.length > 1 || splitString2.length > 1){
       
        output2 =(num1 * num2).toStringAsFixed(2);
      }else{
       output2 =(num1 * num2).toStringAsFixed(0); 
      }
      
    }

    if(operation == "÷"){
  
      if(num2 !=0){
      
          if(num1 % num2 >0){
              
              output2 =(num1 / num2).toStringAsFixed(2);
          }else{
              output2 =(num1 / num2).toStringAsFixed(0);   
          }
      }else{
          alertFalse('ไม่สามารถหารด้วยศูนย์ได้');
          //print('ไม่สามารถหารด้วยศูนย์ได้');
          output2 = '0' ;
          num1 = 0 ;
          num2 = 0 ;
          operation = "";
    }    
    
     
    }if(operation == "%"){
      var doublenumber = double.parse(output2) ;
      var splitString = doublenumber.toString().split('.')[1];
      if(num2 !=0){

        if(splitString.length > 1 ){
          output2 =(num1 % num2 ).toString();
          output = double.parse(output2).toStringAsFixed(2);
        }else{
          output2 =(num1 % num2 ).toString();
          output = double.parse(output2).toStringAsFixed(0);
        }
      }else{
          alertFalse('ไม่สามารถหารด้วยศูนย์ได้');
          //print('ไม่สามารถหารด้วยศูนย์ได้');
          output2 = '0' ;
          num1 = 0 ;
          num2 = 0 ;
          operation = "";
       
      }
      
       
    
      // var doublenumber = double.parse(output2) ;
      // var splitString = doublenumber.toString().split('.')[1];
      // if(splitString.length > 1){
      //   output = double.parse(output2).toStringAsFixed(2);
      // }else{
      //   output = double.parse(output2).toStringAsFixed(0);
      // }
      
    }

    // num1 = 0;
    // num2 = 0;
    // operation = "";
     
  }else{ //if(buttonText == '=')
    
     output2 = output2 + buttonText;
   
    
  }
  print(output2);


  setState(() {
    
    

      var doublenumber = double.parse(output2) ;
      var splitString = doublenumber.toString().split('.')[1];
      
      if(splitString.length > 1 || int.parse(splitString) > 0){
        
        output = double.parse(output2).toStringAsFixed(2);
      }else{
        output = double.parse(output2).toStringAsFixed(0);
      }
      
  
   
  });
  
 
}
 removeAnswerLast() {
    if (output == "0") {
      // Not do anything.
    } else {
      setState(() {
        if (output.length > 1) {
          output = output.substring(0, output.length - 1);
          output2 = output2.substring(0, output2.length - 1);


          if (output.length == 1 && (output == "." || output == "-")) {
            output = "0";
            output2 = "0";
          }
        } else {
          output = "0";
          output2 = "0";
        }
      });
    }
  }

  alertFalse(String masssge){
   CoolAlert.show(
              context: context,
              type: CoolAlertType.error,
              title: "$masssge!!!",
              confirmBtnText: 'ตกลง',
              onConfirmBtnTap: () {
                Navigator.pop(context);
                 
              });
}

}