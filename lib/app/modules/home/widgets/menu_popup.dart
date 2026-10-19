import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/menu_item.dart';

class MenuPopup {
  static void show(MenuItem item) {
    Get.bottomSheet(
      SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),

              ...item.children!.map(
                (child) => ListTile(
                  leading: Image.asset(
                    child.imagePath,
                    width: 35,
                    height: 35,
                    fit: BoxFit.contain,
                  ),

                  title: Text(child.name),

                  trailing: const Icon(Icons.chevron_right),

                  onTap: () {
                    Get.back();
                    Get.toNamed(child.route);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
    );
  }
}
