import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perfection/controller/detailed_user_controller.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

class profile extends StatelessWidget {
  String id = "";
  profile({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Icon(
          Icons.arrow_back,
          size: 30,
        ),
      ),
      body: GetBuilder(
          init: detaileUserController(id: id),
          builder: (user) {
            return user.isLoading.value
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
                : Stack(
                    children: [
                      Container(
                        height: MediaQuery.sizeOf(context).height * 0.35,
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                              Colors.blueAccent,
                              Colors.lightBlueAccent
                            ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight)),
                      ),
                      SafeArea(
                          child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 50,
                                  backgroundImage:
                                      NetworkImage(user.user.value.avatar),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "${user.user.value.name}",
                                  style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                Text(
                                  user.user.value.email,
                                  style: const TextStyle(
                                      fontSize: 16, color: Colors.white70),
                                ),
                                MaterialButton(
                                  onPressed: () async {
                                    final Uri url =
                                        Uri.parse(user.user.value.url);
                                    if (await canLaunchUrl(url)) {
                                      await launchUrl(url);
                                    }
                                  },
                                  child: const Icon(
                                    Icons.contact_emergency,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 10),
                            child: Text(
                              user.user.value.text,
                              style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.blueGrey,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ))
                    ],
                  );
          }),
    );
  }
}
