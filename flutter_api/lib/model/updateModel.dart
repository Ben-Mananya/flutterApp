// To parse this JSON data, do
//
//     final userUpdate = userUpdateFromJson(jsonString);

import 'dart:convert';

UserUpdate userUpdateFromJson(String str) => UserUpdate.fromJson(json.decode(str));

String userUpdateToJson(UserUpdate data) => json.encode(data.toJson());

class UserUpdate {
    UserUpdate({
        this.status,
        this.massage,
        this.data,
    });

    int? status;
    String? massage;
    Data? data;

    factory UserUpdate.fromJson(Map<String, dynamic> json) => UserUpdate(
        status: json["status"],
        massage: json["massage"],
        data: Data.fromJson(json["data"]),
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
