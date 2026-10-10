import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/locations/bindings/locations_binding.dart';
import '../modules/locations/views/locations_view.dart';
import '../modules/positions/bindings/positions_binding.dart';
import '../modules/positions/views/positions_view.dart';
import '../modules/sections/bindings/sections_binding.dart';
import '../modules/sections/views/sections_view.dart';
import '../modules/users/bindings/users_add_edit_binding.dart';
import '../modules/users/bindings/users_binding.dart';
import '../modules/users/views/users_view.dart';
import '../modules/users/views/view_edit_users_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(name: _Paths.HOME, page: () => HomeView(), binding: HomeBinding()),
    GetPage(
      name: _Paths.USERS,
      page: () => UsersView(),
      binding: UsersBinding(),
    ),
    GetPage(
      name: _Paths.ADD_EDIT_USERS,
      page: () => ViewEditUsersView(),
      binding: UsersAddEditBinding(),
    ),
    GetPage(
      name: _Paths.SECTIONS,
      page: () => const SectionsView(),
      binding: SectionsBinding(),
    ),
    GetPage(
      name: _Paths.LOCATIONS,
      page: () => const LocationsView(),
      binding: LocationsBinding(),
    ),
    GetPage(
      name: _Paths.POSITIONS,
      page: () => const PositionsView(),
      binding: PositionsBinding(),
    ),
  ];
}
