import 'package:get/get.dart';

import '../../../../app/data/models/location.dart';
import '../../../../app/data/providers/location_provider.dart';

class LocationsController extends GetxController {
  var locations = List<Location>.empty().obs;

  void getAllLocations({String? search, int? sectionId, bool? isActive}) {
    LocationProvider()
        .getAllLocations(
          search: search,
          sectionId: sectionId,
          isActive: isActive,
        )
        .then((value) {
          locations.value = List.generate(
            value.body['data'].length,
            (index) => Location(
              id: value.body['data'][index]['id'],
              sectionId: value.body['data'][index]['section_id'],
              name: value.body['data'][index]['name'],
              isActive: value.body['data'][index]['is_active'],
            ),
          );
        });
  }

  void clearLocations() {
    locations.value = List.empty();
  }
}
