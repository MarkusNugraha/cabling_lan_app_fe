import 'package:get/get_connect/connect.dart';
import '../../../app/config/api_config.dart';

class SectionProvider extends GetConnect {
  Future<Response> getAllSections({bool? isActive, String? search}) {
    final params = <String, String>{};

    if (isActive != null) {
      params['isActive'] = isActive.toString();
    }

    if (search != null) {
      params['search'] = search;
    }
    return get('${ApiConfig.baseUrl}/section', query: params);
  }
}
