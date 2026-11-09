import 'package:get/get.dart';

import '../../../../app/data/models/device_category.dart';
import '../../../../app/data/providers/device_category_provider.dart';

class DeviceCategoriesController extends GetxController {
  var deviceCategories = List<DeviceCategory>.empty().obs;

  // DeviceCategory? deviceCategory;

  void getAllDeviceCategories({String? search, bool? isActive}) {
    DeviceCategoryProvider()
        .getAllDeviceCategories(search: search, isActive: isActive)
        .then((value) {
          deviceCategories.value = List.generate(
            value.body['data'].length,
            (index) => DeviceCategory(
              id: value.body['data'][index]['id'],
              name: value.body['data'][index]['name'],
              isActive: value.body['data'][index]['is_active'],
            ),
          );
        });
  }

  // void findDeviceCategoryById(String id) {
  //   DeviceCategoryProvider().getDeviceCategoryById(id).then((value) {
  //     deviceCategory = DeviceCategory(
  //       id: value.body['data']['id'],
  //       name: value.body['data']['name'],
  //       isActive: value.body['data']['is_active'],
  //     );
  //   });
  // }

  void clearDeviceCategories() {
    deviceCategories.value = List.empty();
  }
}
