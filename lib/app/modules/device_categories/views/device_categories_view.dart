import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/device_categories_controller.dart';

class DeviceCategoriesView extends GetView<DeviceCategoriesController> {
  const DeviceCategoriesView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DeviceCategoriesView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DeviceCategoriesView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
