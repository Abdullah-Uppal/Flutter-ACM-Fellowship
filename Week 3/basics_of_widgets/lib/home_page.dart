import 'package:flutter/material.dart';
import 'top_container.dart';
import 'globals.dart';
import 'scrollable_section.dart';
import 'custom_icons.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    _index = 0;
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Globals.topBgColor,
        actions: [
          IconButton(onPressed: () {}, icon: CustomIcons.messages),
          IconButton(onPressed: () {}, icon: CustomIcons.bell),
        ],
        leading: IconButton(
            icon: CustomIcons.menu,
            onPressed: () {
              scaffoldKey.currentState!.openDrawer();
            }),
      ),
      drawer: const Drawer(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey.shade700,
        items: [
          BottomNavigationBarItem(icon: CustomIcons.home, label: 'Home'),
          BottomNavigationBarItem(icon: CustomIcons.book, label: 'Learn'),
          BottomNavigationBarItem(icon: CustomIcons.grid, label: 'Hub'),
          BottomNavigationBarItem(icon: CustomIcons.chatbubble, label: 'Chat'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_rounded), label: 'Profile'),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopContainer(
              gridItems: Globals.gridItems,
              bgColor: Globals.topBgColor,
              heading: "Hello, Priya!",
              subheading: "What do you wanna learn today?",
            ),
            // below container
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: Globals.sections.keys.map((key) {
                Widget? action;
                if (_index == 0) {
                  action = null;
                } else if (_index == 1) {
                  action = OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(
                        color: Colors.blue,
                        width: 0.5,
                      ),
                      padding: const EdgeInsets.all(0),
                    ),
                    child: const Text(
                      "Book",
                      style: TextStyle(fontSize: 10, height: 1),
                    ),
                    onPressed: () {},
                  );
                } else {
                  action = Icon(
                    Icons.lock_rounded,
                    color: Colors.grey.shade700,
                  );
                }
                _index++;
                return ScrollableSection(
                  title: key,
                  onSeeAllPressed: () {},
                  items: Globals.sections[key]!,
                  action: action,
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
