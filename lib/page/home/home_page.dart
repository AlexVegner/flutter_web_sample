import 'package:flutter/material.dart';
import 'package:web_app/common/routes/app_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      appBarBuilder: (context, tabsRouter) => AppBar(
        title: Text(routeTitle(tabsRouter.activeIndex)),
        leading: const AutoLeadingButton(),
      ),
      routes: const [MeRoute(), ProjectListRoute(), SettingsRoute()],
      bottomNavigationBuilder: (
        context,
        tabsRouter,
      ) =>
          SizedBox(
        width: 10,
        child: BottomNavigationBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Me',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.storage),
              label: 'Projects',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }

  String routeTitle(int index) {
    switch (index) {
      case 0:
        return 'My Profile';
      case 1:
        return 'Projects';
      case 2:
        return 'Settings';
    }
    return "";
  }
}
