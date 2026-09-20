import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import '../widgets/menu_section.dart';
import '../widgets/profile_section.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 60, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [ProfileSection(), SizedBox(height: 50), MenuSection()],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: controller.increment,
      //   child: Icon(Icons.add_circle),
      // ),
    );
  }
}
