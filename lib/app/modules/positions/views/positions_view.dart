import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/positions_controller.dart';

class PositionsView extends GetView<PositionsController> {
  const PositionsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PositionsView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PositionsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
