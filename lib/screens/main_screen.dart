import 'package:flutter/material.dart';
import '../screens/tabPages/home_tab.dart';
import '../screens/tabPages/chat_tab.dart';
import '../screens/tabPages/notification_tab.dart';
import '../screens/tabPages/profile_tab.dart';
import '../const.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  int selectedIndex = 0;

  onItemClicked(int index) {
    setState(() {
      selectedIndex = index;
      tabController!.index = selectedIndex;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          controller: tabController,
          children: const [
            HomeTabScreen(),
            ChatTabScreen(),
            NotificationTabScreen(),
            ProfileTabScreen(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chat"),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications), label: "Notification"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
          unselectedItemColor: Colors.white,
          selectedItemColor: kprimarryColor,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: const TextStyle(fontSize: 14.0),
          backgroundColor: kblackColor,
          showUnselectedLabels: true,
          currentIndex: selectedIndex,
          onTap: onItemClicked,
        ),
      ),
    );
  }
}
