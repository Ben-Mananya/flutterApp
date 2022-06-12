import 'package:flutter/material.dart';
import 'package:flutter_api/model/addModel.dart';
import 'package:flutter_api/model/deleteModel.dart';
import 'package:flutter_api/model/updateModel.dart';
import 'package:flutter_api/model/userModel.dart';
import 'package:flutter_api/service/addService.dart';
import 'package:flutter_api/service/deleteService.dart';
import 'package:flutter_api/service/updateService.dart';
import 'package:flutter_api/service/userService.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  UserAdd? userAdd = UserAdd();
  UserDelete? userDelete = UserDelete();
  UserUpdate? userUpdate = UserUpdate();
  String? incorrect = "";

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();

  final TextEditingController new_usernameController = TextEditingController();
  final TextEditingController new_passwordController = TextEditingController();
  final TextEditingController new_firstnameController = TextEditingController();
  final TextEditingController new_lastnameController = TextEditingController();

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('UserListView'),
        ),
        body: FutureBuilder<List<UserModel>>(
          future: userService().getUserAll(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView(
                children: [
                  ...snapshot.data!.map((e) => ListTile(
                        title: Text(e.username),
                        subtitle: Text(e.firstname + ' ' + e.lastname),
                        trailing: Container(
                          width: 100.0,
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    updateshowDialog(e.id,username: e.username,password: e.password, firstname:e.firstname, lastname: e.lastname );
                                   // print('Update');
                                  },
                                  icon: Icon(Icons.edit_outlined)),
                              IconButton(
                                  onPressed: () {
                                    delete(e.id);
                                   // print('Delete');
                                  },
                                  icon: Icon(Icons.delete_outlined)),
                            ],
                          ),
                        ),
                      ))
                ],
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: buildDialog,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ));
  }

  buildDialog() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('เพิ่มข้อมูล User'),
        content: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.4,
            child: Column(
              children: [
                buildUsername(usernameController),
                buildText(text: '$incorrect', size: 12.0, color: Colors.red),
                buildSizebox(height: 5.0),
                buildPassword(passwordController),
                buildText(text: '$incorrect', size: 12.0, color: Colors.red),
                buildSizebox(height: 5.0),
                buildFirstname(firstnameController),
                buildText(text: '$incorrect', size: 12.0, color: Colors.red),
                buildSizebox(height: 5.0),
                buildLastname(lastnameController),
                buildText(text: '$incorrect', size: 12.0, color: Colors.red)
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
              child: Text('Cancel'),
              onPressed: () => {
                    Navigator.pop(context),
                  }),
          TextButton(child: Text('OK'), onPressed: () => {checkInput()}),
        ],
      ),
    );
  }

  buildText({text, size, weight, color}) {
    return Text(text,
        style: TextStyle(fontSize: size, fontWeight: weight, color: color));
  }

  buildSizebox({height, width}) {
    return SizedBox(
      height: height,
      width: width,
    );
  }

  buildUsername(usernameController) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      child: TextFormField(
        controller: usernameController,
        decoration: InputDecoration(
            labelText: 'Username',
            icon: Icon(Icons.person_outline),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black))),
      ),
    );
  }

  buildPassword(passwordController) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      child: TextFormField(
        controller: passwordController,
        decoration: InputDecoration(
            labelText: 'Password',
            icon: Icon(Icons.key_outlined),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black))),
      ),
    );
  }

  buildFirstname(firstnameController) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      child: TextFormField(
        controller: firstnameController,
        decoration: InputDecoration(
            labelText: 'Firstname',
            icon: Icon(Icons.person_outlined),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black))),
      ),
    );
  }

  buildLastname(lastnameController) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      child: TextFormField(
        controller: lastnameController,
        decoration: InputDecoration(
            labelText: 'Lastname',
            icon: Icon(Icons.person_outlined),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black))),
      ),
    );
  }


  checkInput({username, password, firstname, lastname}) async {
    if (username != "" || password == "" || firstname == "" || lastname == "") {
      final UserAdd? data = await addService.AddUser(
          username: usernameController.text,
          password: passwordController.text,
          firstname: firstnameController.text,
          lastname: lastnameController.text);

      setState(() {
        userAdd = data;
      });

      if (data != null) {
        if (userAdd!.status == 1) {//AddUser สำเร็จ
         
          Navigator.pop(context);
          CoolAlert.show(
              context: context,
              type: CoolAlertType.success,
              title: "บันทึกข้อมูลสำเร็จ!!!",
              confirmBtnText: 'ตกลง',
              onConfirmBtnTap: () {
                Navigator.pop(context);
                  Get.put({usernameController.text = '',
                  passwordController.text = '',
                  firstnameController.text = '',
                  lastnameController.text = '',
                });
              
              });

        } else {
          setState(() {
            incorrect = userAdd!.massage;
          });

          Navigator.pop(context);
          CoolAlert.show(
              context: context,
              type: CoolAlertType.error,
              title: "บันทึกข้อมูลไม่สำเร็จ!!!",
              confirmBtnText: 'ตกลง',
              onConfirmBtnTap: () {
                Navigator.pop(context);
                Get.put({
                  usernameController.text = '',
                  passwordController.text = '',
                  firstnameController.text = '',
                  lastnameController.text = '',
                });
                // setState(() {
                //   usernameController.text = '';
                //   passwordController.text = '';
                //   firstnameController.text = '';
                //   lastnameController.text = '';
                // });
              });
         
        }//end else
      }
    } else {

      setState(() {
        incorrect = userAdd!.massage;
      });

    }
  }

  delete(int? id) async {
    
      final UserDelete? data = await deleteService.DeleteUser(id:id!.toInt());

      setState(() {
        userDelete = data;
      });

      if (userDelete!.status == 1) {
        //delete สำเร็จ
    // alertSeccess('ลบข้อมูลสำเร็จ');
   
      }else{
    //alertFalse('ลบข้อมูลไม่สำเร็จ');
      }
    
  }

  updateshowDialog(int? id,{ username, password, firstname, lastname}) async{ 
    


    TextEditingController new_usernameController = TextEditingController(text: username);
    TextEditingController new_passwordController = TextEditingController(text: password);
    TextEditingController new_firstnameController = TextEditingController(text: firstname);
    TextEditingController new_lastnameController = TextEditingController(text: lastname);
  
      showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('อัปเดตข้อมูล User'),
        content: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.4,
            child: Column(
              children: [
                buildUsername(new_usernameController),
                buildText(text: '$incorrect', size: 12.0, color: Colors.red),
                buildSizebox(height: 5.0),
                buildPassword(new_passwordController),
                buildText(text: '$incorrect', size: 12.0, color: Colors.red),
                buildSizebox(height: 5.0),
                buildFirstname(new_firstnameController),
                buildText(text: '$incorrect', size: 12.0, color: Colors.red),
                buildSizebox(height: 5.0),
                buildLastname(new_lastnameController),
                buildText(text: '$incorrect', size: 12.0, color: Colors.red)
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
              child: Text('Cancel'),
              onPressed: () => {
                    Navigator.pop(context),
                  }),
          TextButton(child: Text('OK'), 
            onPressed: () => {
               Navigator.pop(context),
              update(id, username: new_usernameController.text,password: new_passwordController.text, firstname: new_firstnameController.text, lastname: new_lastnameController.text)
               }),
        ],
      ),
    );
  }
    
    
  
void update(int? id,{ username, password, firstname, lastname}) async{
    final UserUpdate? data = await updateService.UpdateUser(id: id!.toInt(), username: username , password: password, firstname: firstname, lastname: lastname );
  print("username");
    Get.put(userUpdate = data);
  
    if (userUpdate!.status == 1) {

        alertSeccess('อัปเดตข้อมูลสำเร็จ');
   
      }else{
        alertFalse('อัปเดตข้อมูลไม่สำเร็จ');
      }
  }


alertSeccess(String massage){
  CoolAlert.show(
              context: context,
              type: CoolAlertType.success,
              title: "$massage!!!",
              confirmBtnText: 'ตกลง',
              onConfirmBtnTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => super.widget ));

                Get.put({
                  usernameController.text = '',
                  passwordController.text = '',
                  firstnameController.text = '',
                  lastnameController.text = '',
                });
              });
}

alertFalse(String masssge){
   CoolAlert.show(
              context: context,
              type: CoolAlertType.error,
              title: "$masssge!!!",
              confirmBtnText: 'ตกลง',
              onConfirmBtnTap: () {
                Navigator.pop(context);
                 Get.put({
                  usernameController.text = '',
                  passwordController.text = '',
                  firstnameController.text = '',
                  lastnameController.text = '',
                });
              });
}




}
