import 'package:flutter/material.dart';

class TabBarWithBackground extends StatelessWidget
    implements PreferredSizeWidget {
  final Color backgroundColor;
  final TabBar tabBar;

  TabBarWithBackground({this.tabBar, this.backgroundColor})
      : assert(tabBar != null);

  @override
  Size get preferredSize => tabBar.preferredSize;

  @override
  Widget build(BuildContext context) => Container(
        child: tabBar,
        color: backgroundColor,
      );
}