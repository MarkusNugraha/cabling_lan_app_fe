import '../../routes/app_pages.dart';

class MenuItem {
  String name;
  String imagePath;
  String route;
  List<MenuItem>? children;

  MenuItem({
    required this.name,
    required this.imagePath,
    required this.route,
    this.children = const [],
  });

  bool get hasChildren => children!.isNotEmpty;
}

final List<MenuItem> menuItems = [
  MenuItem(
    name: 'Hierarchy',
    imagePath: 'assets/images/hierarchy_icon.png',
    route: Routes.HIERARCHY,
    children: [
      MenuItem(
        name: 'Sections',
        imagePath: 'assets/images/section_icon.png',
        route: Routes.SECTIONS,
      ),
      MenuItem(
        name: 'Sub Sections',
        imagePath: 'assets/images/sub_section_icon.png',
        route: Routes.SECTIONS,
      ),
      MenuItem(
        name: 'Locations',
        imagePath: 'assets/images/location_icon.png',
        route: Routes.LOCATIONS,
      ),
      MenuItem(
        name: 'Positions',
        imagePath: 'assets/images/position_icon.png',
        route: Routes.POSITIONS,
      ),
    ],
  ),
  MenuItem(
    name: 'Users',
    imagePath: 'assets/images/user_icon.png',
    route: Routes.USERS,
  ),
  MenuItem(
    name: 'Cables',
    imagePath: 'assets/images/lan_cable_icon.png',
    route: Routes.CABLES,
  ),
  MenuItem(
    name: 'Devices',
    imagePath: 'assets/images/devices_icon.png',
    route: Routes.DEVICES,
    children: [
      MenuItem(
        name: 'Computers',
        imagePath: 'assets/images/computer_icon.png',
        route: Routes.COMPUTERS,
      ),
      MenuItem(
        name: 'Switches',
        imagePath: 'assets/images/switch_icon.png',
        route: Routes.SWITCHES,
      ),
      MenuItem(
        name: 'Voips',
        imagePath: 'assets/images/voip_icon.png',
        route: Routes.VOIPS,
      ),
    ],
  ),
];
