// To parse this JSON data, do
//
//     final userDelete = userDeleteFromJson(jsonString);

import 'dart:convert';

UserDelete userDeleteFromJson(String str) => UserDelete.fromJson(json.decode(str));

String userDeleteToJson(UserDelete data) => json.encode(data.toJson());

class UserDelete {
    UserDelete({
        this.status,
        this.massage,
    });

    int? status;
    String? massage;

    factory UserDelete.fromJson(Map<String, dynamic> json) => UserDelete(
        status: json["status"],
        massage: json["massage"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "massage": massage,
    };
}
