import 'package:get/get.dart';
import '../../../../app/data/models/section.dart';
import '../../../../app/data/providers/section_provider.dart';

class SectionsController extends GetxController {
  var sections = List<Section>.empty().obs;

  @override
  void onInit() {
    super.onInit();

    getAllSections();
  }

  void getAllSections() {
    SectionProvider().getAllSections(isActive: true).then((value) {
      sections.value = List.generate(
        value.body['data'].length,
        (index) => Section(
          id: value.body['data'][index]['id'],
          name: value.body['data'][index]['name'],
          isActive: value.body['data'][index]['is_active'],
        ),
      );
    });
  }
}
