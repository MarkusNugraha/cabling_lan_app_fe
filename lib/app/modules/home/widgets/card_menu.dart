import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/app/data/models/menu_item.dart';

class CardMenu extends StatelessWidget {
  const CardMenu({super.key, required this.menuItem});

  final MenuItem menuItem;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () {
        Get.toNamed(menuItem.route);
      },
      child: Column(
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                width: 50,
                height: 50,
                child: Image.asset(menuItem.imagePath, fit: BoxFit.cover),
              ),
            ),
          ),
          Text(
            menuItem.name,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
