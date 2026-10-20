import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/computer.dart';
import '../../../routes/app_pages.dart';
import '../../../themes/app_colors.dart';
import '../../../data/enums/form_mode.dart';

class ComputerListItem extends StatelessWidget {
  final Computer computer;

  const ComputerListItem({super.key, required this.computer});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(
          Routes.ADD_EDIT_USERS,
          arguments: {'formMode': FormMode.VIEW, 'userId': computer.id},
        );
      },
      child: Container(
        padding: const EdgeInsets.all(3),
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
        decoration: BoxDecoration(
          color: AppColors.DJR,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      computer.hostname,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      computer.deviceSummary!.serialNumber,
                      style: const TextStyle(color: Colors.black, fontSize: 13),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Text(
                computer.deviceSummary!.deviceCategory.name,
                style: const TextStyle(color: Colors.black, fontSize: 13),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
