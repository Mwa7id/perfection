import 'dart:convert';

import 'package:get/get.dart';
import 'package:perfection/constants.dart';
import 'package:perfection/model/user.dart';
import 'package:http/http.dart' as http;

class detaileUserController extends GetxController {
  var user = User(name: "", email: "", avatar: "", text: "", url: "").obs;
  var isLoading = true.obs;
  final String id;
  detaileUserController({required this.id});

  @override
  void onInit() {
    fetchUsers();
    super.onInit();
  }

  void fetchUsers() async {
    isLoading.value = true;
    final response =
        await http.get(Uri.parse('$domain$detailed_user_end_point$id'));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      user.value = User.fromJson(data);
      isLoading.value = false;
    }
    update();
  }
}
