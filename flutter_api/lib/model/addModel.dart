// To parse this JSON data, do
//
//     final userAdd = userAddFromJson(jsonString);

import 'dart:convert';

UserAdd userAddFromJson(String str) => UserAdd.fromJson(json.decode(str));

String userAddToJson(UserAdd data) => json.encode(data.toJson());

class UserAdd {
    UserAdd({
        this.status,
        this.massage,
        this.data,
    });

    int? status;
    String? massage;
    Data? data;

    factory UserAdd.fromJson(Map<String, dynamic> json) => UserAdd(
        status: json["status"] ,
        massage: json["massage"] ,
        data: Data.fromJson(json["data"]) ,
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "massage": massage,
        "data": data!.toJson(),
    };
}

class Data {
    Data({
        this.username,
        this.password,
        this.fullname,
    });

    String? username;
    String? password;
    String? fullname;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        username: json["username"],
        password: json["password"],
        fullname: json["fullname"],
    );

    Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
        "fullname": fullname,
    };
}
