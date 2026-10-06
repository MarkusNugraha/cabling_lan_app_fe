import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackbarService {
  static void error(String message) {
    Get.snackbar(
      'Error',
      message,
      duration: const Duration(seconds: 2),
      backgroundColor: Colors.red[400],
      colorText: Colors.white,
    );
  }

  static void success(String message) {
    Get.snackbar(
      'Success',
      message,
      duration: const Duration(seconds: 2),
      backgroundColor: Colors.green[400],
      colorText: Colors.white,
    );
  }

  static void info(String message) {
    Get.snackbar(
      'Info',
      message,
      duration: const Duration(seconds: 2),
      backgroundColor: Colors.blue[400],
      colorText: Colors.white,
    );
  }
}
