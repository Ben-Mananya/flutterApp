// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
    Welcome({
        this.status,
        this.massage,
    });

    int? status;
    String? massage;

    factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        status: json["status"],
        massage: json["massage"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "massage": massage,
    };
}
