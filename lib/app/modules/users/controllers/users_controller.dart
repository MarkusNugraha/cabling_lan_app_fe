import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../data/models/user.dart';
import '../../../data/models/section.dart';
import '../../../data/models/location.dart';
import '../../../data/models/position.dart';
import '../../../data/providers/user_provider.dart';
import '../../../../app/modules/sections/controllers/sections_controller.dart';

class UsersController extends GetxController {
  final sectionsController = Get.find<SectionsController>();

  var users = List<User>.empty().obs;

  final isSearching = false.obs;
  final searchController = TextEditingController();

  final isFilterOpen = false.obs;
  final selectedSectionId = RxnInt();
  final selectedLocationId = RxnInt();
  final selectedPositionId = RxnInt();

  final sections = <Section>[].obs;
  final locations = <Location>[].obs;
  final positions = <Position>[].obs;
  final isActive = true.obs;

  @override
  void onInit() {
    super.onInit();

    getAllUsers();
    searchController.addListener(() {
      isSearching.value = searchController.text.isNotEmpty;
    });
  }

  void clearSearch() {
    searchController.clear();
  }

  void toggleFilter() {
    isFilterOpen.value = !isFilterOpen.value;
  }

  void getAllUsers() {
    UserProvider()
        .getAllUsers(search: searchController.text, isActive: isActive.value)
        .then((value) {
          users.value = List.generate(
            value.body['data'].length,
            (index) => User(
              id: value.body['data'][index]['id'],
              nik: value.body['data'][index]['nik'],
              location: value.body['data'][index]['location'],
              username: value.body['data'][index]['username'],
              email: value.body['data'][index]['email'],
              isActive: value.body['data'][index]['is_active'],
            ),
          );
        });
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}
