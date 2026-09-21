import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import '../widgets/menu_section.dart';
import '../widgets/profile_section.dart';
import '../../users/controllers/users_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({super.key});
  final usrCtrller = Get.find<UsersController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 60, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileSection(),
            SizedBox(height: 50),
            MenuSection(),

            Expanded(
              child: Obx(
                () => usrCtrller.users.isEmpty
                    ? const Center(child: Text('No Data'))
                    : ListView.builder(
                        itemCount: usrCtrller.users.length,
                        itemBuilder: (context, index) {
                          final user = usrCtrller.users[index];

                          return ListTile(
                            title: Text(user.username),
                            subtitle: Text(user.nik),
                            leading: const CircleAvatar(child: Text('U')),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                Get.defaultDialog(
                                  title: 'Delete User',
                                  middleText:
                                      'Are you sure you want to delete ${user.username}?',
                                  onConfirm: () {
                                    // delete user
                                    Get.back();
                                  },
                                );
                              },
                            ),
                            onTap: () {
                              // edit user
                            },
                          );
                        },
                      ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                usrCtrller.getAllUsers();
              },
            ),
          ],
        ),
        // child: Obx(
        //   () => Column(
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [ProfileSection(), SizedBox(height: 50), MenuSection()],
        //   ),
        // ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: controller.increment,
      //   child: Icon(Icons.add_circle),
      // ),
    );
  }
}
