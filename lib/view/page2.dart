import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:perfection/controller/all_users_controller2.dart';
import 'package:perfection/view/profile.dart';
import 'package:shimmer/shimmer.dart';

class page2 extends StatelessWidget {
  final userController2 user2 = Get.put(userController2());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return user2.isLoading.value
          ? ListView.builder(
              itemCount: 6,
              itemBuilder: (context, index) {
                return Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 16.0),
                      child: Container(
                        height: 80.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                      ),
                    ));
              })
          : ListView.builder(
              itemCount: user2.user.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            child:
                                profile(id: user2.user[index]['id'].toString()),
                            type: PageTransitionType.leftToRight));
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    elevation: 4,
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(16),
                      leading: CircleAvatar(
                          radius: 30,
                          backgroundImage:
                              NetworkImage(user2.user[index]['avatar'])),
                      title: Text(
                        "${user2.user[index]['first_name']} ${user2.user[index]['last_name']}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.blueGrey[800]),
                      ),
                      subtitle: Row(
                        children: [
                          Icon(
                            Icons.email,
                            color: Colors.blueGrey[300],
                            size: 16,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            user2.user[index]['email'],
                            style: TextStyle(color: Colors.blueGrey[600]),
                          ),
                        ],
                      ),
                      trailing: Icon(
                        Icons.chevron_right,
                        color: Colors.blueGrey[300],
                      ),
                    ),
                  ),
                );
              },
            );
    });
  }
}
