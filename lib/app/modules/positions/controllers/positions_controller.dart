import 'package:get/get.dart';

import '../../../../app/data/models/position.dart';
import '../../../../app/data/providers/position_provider.dart';

class PositionsController extends GetxController {
  var positions = List<Position>.empty().obs;

  void getAllPositions({String? search, int? locationId, bool? isActive}) {
    PositionProvider()
        .getAllPositions(
          search: search,
          locationId: locationId,
          isActive: isActive,
        )
        .then((value) {
          positions.value = List.generate(
            value.body['data'].length,
            (index) => Position(
              id: value.body['data'][index]['id'],
              locationId: value.body['data'][index]['location_id'],
              name: value.body['data'][index]['name'],
              isActive: value.body['data'][index]['is_active'],
            ),
          );
        });
  }

  void clearPositions() {
    positions.value = List.empty();
  }
}
