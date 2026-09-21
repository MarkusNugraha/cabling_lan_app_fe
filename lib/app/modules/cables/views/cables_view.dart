import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/cables_controller.dart';

class CablesView extends GetView<CablesController> {
  const CablesView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CablesView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'CablesView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
