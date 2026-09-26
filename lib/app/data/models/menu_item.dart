import '../../routes/app_pages.dart';

class MenuItem {
  String name;
  String imagePath;
  String route;
  MenuItem({required this.name, required this.imagePath, required this.route});
}

final List<MenuItem> menuItems = [
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
    name: 'Switches',
    imagePath: 'assets/images/switch_icon.png',
    route: Routes.USERS,
  ),
  MenuItem(
    name: 'Voips',
    imagePath: 'assets/images/voip_icon.png',
    route: Routes.USERS,
  ),
];
