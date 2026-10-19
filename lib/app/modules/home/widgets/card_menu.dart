import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/app/data/models/menu_item.dart';
import '../../../../app/modules/home/widgets/menu_popup.dart';

class CardMenu extends StatelessWidget {
  const CardMenu({super.key, required this.menuItem});

  final MenuItem menuItem;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () {
        if (menuItem.hasChildren) {
          MenuPopup.show(menuItem);
        } else {
          Get.toNamed(menuItem.route);
        }
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
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
