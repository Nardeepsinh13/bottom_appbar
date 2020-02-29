import 'package:bottom_appbar_demo/ActProductDetail.dart';
import 'package:bottom_appbar_demo/Act_NewsTab.dart';
import 'package:bottom_appbar_demo/Act_ProductTab.dart';
import 'package:bottom_appbar_demo/BottomNavigation.dart';
import 'package:flutter/material.dart';

class TabNavigatorRoutes {
  static const String root = '/';
  static const String detail = '/detail';
}

class TabNavigator extends StatelessWidget {
  TabNavigator({this.navigatorKey, this.mainContext, this.tabItem});
  final GlobalKey<NavigatorState> navigatorKey;
  final BuildContext mainContext;
  final TabItem tabItem;

  void _push(BuildContext context, {int materialIndex: 500}) {
    var routeBuilders = _routeBuilders(context, materialIndex: materialIndex);

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                routeBuilders[TabNavigatorRoutes.detail](context)));
  }

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context,
      {int materialIndex: 500}) {
    return {
      TabNavigatorRoutes.root: (context) {
        if(tabItem == TabItem.Product){
          return Act_ProductTab(
            mainContext: mainContext,
            title: tabName[tabItem],
            onPush: (materialIndex) =>
                _push(context, materialIndex: materialIndex),
          );
        }
        if(tabItem == TabItem.News){
          return Act_NewsTab(
            title: tabName[tabItem],
            onPush: (materialIndex) =>
                _push(context, materialIndex: materialIndex),
          );
        }
        return Act_ProductTab(
          mainContext: mainContext,
          title: tabName[tabItem],
          onPush: (materialIndex) =>
              _push(context, materialIndex: materialIndex),
        );
      },
//        if(tabItem == TabItem.Product){
//          return Act_ProductTab(
//            onPush: (materialIndex) =>
//                _push(context, materialIndex: materialIndex),
//          );
//        }
//        return Act_ProductTab(
//          onPush: (materialIndex) =>
//              _push(context, materialIndex: materialIndex),
//        );

      TabNavigatorRoutes.detail: (context) => ActProductDetail(),
    };
  }

  @override
  Widget build(BuildContext context) {
    var routeBuilders = _routeBuilders(context);

    return Navigator(
        key: navigatorKey,
        initialRoute: TabNavigatorRoutes.root,
        onGenerateRoute: (routeSettings) {
          return MaterialPageRoute(
              builder: (context) => routeBuilders[routeSettings.name](context));
        });
  }
}
