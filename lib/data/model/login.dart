import 'package:mobx/mobx.dart';

part 'login.g.dart';


class Login = _LoginBase with _$Login;

abstract class _LoginBase with Store {
  @observable
  String user;
  @action
  setUser(String value) => user = value;

  @observable
  String pwd;
  @action
  setPwd(String value) => pwd = value;


  Login fromJson(Map<String, dynamic> json) => Login()..setUser(json["user"])..setPwd(json["pwd"]);
  
  Map<String, dynamic> toJson() => {
      "user": user == null ? null : user,
      "pwd": pwd == null ? null : pwd,
  };
}
// import 'dart:convert';

// Login loginFromJson(String str) => Login.fromJson(json.decode(str));

// String loginToJson(Login data) => json.encode(data.toJson());

// class Login {
//     String user;
//     String pwd;

//     Login({
//         this.user,
//         this.pwd,
//     });

//     factory Login.fromJson(Map<String, dynamic> json) => new Login(
//         user: json["user"] == null ? null : json["user"],
//         pwd: json["pwd"] == null ? null : json["pwd"],
//     );

//     Map<String, dynamic> toJson() => {
//         "user": user == null ? null : user,
//         "pwd": pwd == null ? null : pwd,
//     };

// }