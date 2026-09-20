class MenuItem {
  String name;
  String imagePath;
  MenuItem({required this.name, required this.imagePath});
}

final List<MenuItem> menuItems = [
  MenuItem(name: 'Users', imagePath: 'assets/images/user_icon.png'),
  MenuItem(name: 'Cables', imagePath: 'assets/images/lan_cable_icon.png'),
  MenuItem(name: 'Switches', imagePath: 'assets/images/switch_icon.png'),
  MenuItem(name: 'Voips', imagePath: 'assets/images/voip_icon.png'),
];
