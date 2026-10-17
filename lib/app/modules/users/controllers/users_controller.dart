import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../data/models/user.dart';
import '../../../data/providers/user_provider.dart';
import '../../../../app/modules/sections/controllers/sections_controller.dart';
import '../../../../app/modules/locations/controllers/locations_controller.dart';
import '../../../../app/modules/positions/controllers/positions_controller.dart';

class UsersController extends GetxController {
  final sectionsController = Get.find<SectionsController>();
  final locationsController = Get.find<LocationsController>();
  final positionsController = Get.find<PositionsController>();

  var users = List<User>.empty().obs;

  final isSearching = false.obs;
  final searchController = TextEditingController();

  final isFilterOpen = false.obs;
  final selectedSectionId = RxnInt();
  final selectedLocationId = RxnInt();
  final selectedPositionId = RxnInt();
  final isActive = true.obs;

  @override
  void onInit() {
    super.onInit();

    getAllUsers(isActive: true);
    searchController.addListener(() {
      isSearching.value = searchController.text.isNotEmpty;
    });

    sectionsController.getAllSections();
  }

  void clearSearch() {
    searchController.clear();
  }

  void toggleFilter() {
    isFilterOpen.value = !isFilterOpen.value;
  }

  void clearFilter() {
    selectedSectionId.value = null;
    selectedLocationId.value = null;
    selectedPositionId.value = null;
    isActive.value = true;

    clearSearch();
  }

  void getAllUsers({String? search, int? positionId, bool? isActive}) {
    UserProvider()
        .getAllUsers(
          search: search,
          position: positionId.toString(),
          isActive: isActive,
        )
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
