import 'package:bottom_appbar_demo/ActFloatingScreen.dart';
import 'package:bottom_appbar_demo/ActOnBoard.dart';
import 'package:bottom_appbar_demo/BottomNavigation.dart';
import 'package:bottom_appbar_demo/TabNavigator.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TabItem currentTab = TabItem.Product;
  Map<TabItem, GlobalKey<NavigatorState>> _navigatorKeys = {
    TabItem.Product: GlobalKey<NavigatorState>(),
    TabItem.News: GlobalKey<NavigatorState>(),
    TabItem.Floating: GlobalKey<NavigatorState>(),
  };

  void _selectTab(TabItem tabItem) {
    if (tabItem == currentTab) {
      // pop to first route
      _navigatorKeys[tabItem].currentState.popUntil((route) => route.isFirst);
    } else {
      setState(() => currentTab = tabItem);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
            !await _navigatorKeys[currentTab].currentState.maybePop();
        if (isFirstRouteInCurrentTab) {
          // if not on the 'main' tab
          if (currentTab != TabItem.Product) {
            // select 'main' tab
            _selectTab(TabItem.Product);
            // back button handled by app
            return false;
          }
        }
        // let system handle back button if we're on the first route
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        floatingActionButton: currentTab == TabItem.Floating
            ? null
            : FloatingActionButton(
                mini: true,
                onPressed: () => _selectTab(TabItem.Floating),
                child: Icon(Icons.add),
                heroTag: "demoTag",
              ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: Stack(children: <Widget>[
          _buildOffstageNavigator(TabItem.Product),
          _buildOffstageNavigator(TabItem.News),
          _buildOffstageNavigator(TabItem.Floating)
        ]),
        bottomNavigationBar: BottomNavigation(
          currentTab: currentTab,
          onSelectTab: _selectTab,
        ),
      ),
    );
  }

  Widget _buildOffstageNavigator(TabItem tabItem) {
    return Offstage(
      offstage: currentTab != tabItem,
      child: TabNavigator(
        navigatorKey: _navigatorKeys[tabItem],
        mainContext: context,
        tabItem: tabItem,
      ),
    );
  }
}
