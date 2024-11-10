import 'package:get/get.dart';
import 'package:perfection/model/user_model2.dart';

class userController2 extends GetxController {
  final userServices user_service = userServices();
  RxList user = <Map<String, dynamic>>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchUsers();
    super.onInit();
  }

  void fetchUsers() async {
    isLoading.value = true;
    try {
      final fetchedUsers = await user_service.fetch();
      user.value = fetchedUsers;
    } catch (error) {
      print("Error : $error");
    } finally {
      isLoading.value = false;
    }
  }
}
