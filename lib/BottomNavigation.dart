import 'package:flutter/material.dart';

enum TabItem { Product, News }

Map<TabItem, String> tabName = {
  TabItem.Product: 'Product',
  TabItem.News: 'News',
};

Map<TabItem, IconData> tabIcon = {
  TabItem.Product: Icons.ac_unit,
  TabItem.News: Icons.directions_bike,
};

Map<TabItem, MaterialColor> activeTabColor = {
  TabItem.Product: Colors.red,
  TabItem.News: Colors.green,
};

class BottomNavigation extends StatelessWidget {
  BottomNavigation({this.currentTab, this.onSelectTab});
  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectTab;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        _buildItem(tabItem: TabItem.Product),
        _buildItem(tabItem: TabItem.News),
      ],
      onTap: (index) => onSelectTab(
        TabItem.values[index],
      ),
    );
  }

  BottomNavigationBarItem _buildItem({TabItem tabItem}) {
    String text = tabName[tabItem];
    IconData icon = tabIcon[tabItem];
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        color: _colorTabMatching(item: tabItem),
      ),
      title: Text(
        text,
        style: TextStyle(
          color: _colorTabMatching(item: tabItem),
        ),
      ),
    );
  }

  Color _colorTabMatching({TabItem item}) {
    return currentTab == item ? activeTabColor[item] : Colors.grey;
  }
}