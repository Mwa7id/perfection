import 'package:flutter/material.dart';

import 'package:perfection/view/page1.dart';
import 'package:perfection/view/page2.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

final PageController _pageController = PageController();

class users extends StatelessWidget {
  users({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              "All Users",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            onPressed: null,
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            splashColor: Colors.transparent,
            child: SmoothPageIndicator(
              controller: _pageController,
              count: 2,
              effect: WormEffect(
                  dotHeight: 12,
                  dotWidth: 12,
                  activeDotColor: Colors.blueGrey,
                  dotColor: Colors.grey[300]!),
            ),
          ),
          body: PageView(
              controller: _pageController, children: [Page1(), page2()])),
    );
  }
}
