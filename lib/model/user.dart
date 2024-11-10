import 'package:get/get.dart';

class User extends GetConnect {
  final String name;
  final String email;
  final String avatar;
  final String text;
  final String url;

  User(
      {required this.name,
      required this.email,
      required this.avatar,
      required this.text,
      required this.url});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        name: json['data']['first_name'] + ' ' + json['data']['last_name'],
        email: json['data']['email'],
        avatar: json['data']['avatar'],
        text: json['support']['text'],
        url: json['support']['url']);
  }
}
