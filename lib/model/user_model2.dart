import 'package:get/get.dart';
import 'package:perfection/constants.dart';

class userServices extends GetConnect {
  Future<List<Map<String, dynamic>>> fetch() async {
    final response = await get('$domain$users_end_point_page2');
    if (response.status.hasError) {
      throw Exception('failed to load users');
    }

    return List<Map<String, dynamic>>.from(response.body["data"]);
  }
}
