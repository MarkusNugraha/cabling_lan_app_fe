import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/sections_controller.dart';

class SectionsView extends GetView<SectionsController> {
  const SectionsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SectionsView'), centerTitle: true),
      body: const Center(
        child: Text('SectionsView is working', style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
