import 'package:ai_med_health/presentation/dashboard/dashboard_pages/video_page.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:ai_med_health/presentation/dashboard/dashboard_pages/doctor_page/doctor_list_page.dart';
import 'package:ai_med_health/presentation/dashboard/dashboard_pages/chat_page.dart';
import 'package:ai_med_health/presentation/dashboard/dashboard_pages/home_page.dart';
import 'package:ai_med_health/presentation/dashboard/dashboard_pages/profile_page.dart';

class BottomNavigationBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      screens: [
        HomePage(),
        DoctorListPage(),
        VideoPage(),
        ChatPage(),
        ProfilePage(),
      ],
      items: [
        PersistentBottomNavBarItem(
          icon: Icon(Icons.home),
          title: 'Home',
          activeColorPrimary: Colors.blue,
          inactiveColorPrimary: Colors.grey,
          textStyle: TextStyle(color: Colors.black), // Add this line for Style 15
        ),
        PersistentBottomNavBarItem(
          icon: Icon(Icons.search),
          title: 'Search',
          activeColorPrimary: Colors.blue,
          inactiveColorPrimary: Colors.grey,
          textStyle: TextStyle(color: Colors.black), // Add this line for Style 15
        ),
        PersistentBottomNavBarItem(
          icon: Icon(Icons.video_camera_back_rounded,color: Colors.white,),
          title: 'Video',
          activeColorPrimary: Colors.blue,
          inactiveColorPrimary: Colors.grey,
          textStyle: TextStyle(color: Colors.black), // Add this line for Style 15
        ),
        PersistentBottomNavBarItem(
          icon: Icon(Icons.chat),
          title: 'Chat',
          activeColorPrimary: Colors.blue,
          inactiveColorPrimary: Colors.grey,
          textStyle: TextStyle(color: Colors.black), // Add this line for Style 15
        ),
        PersistentBottomNavBarItem(
          icon: Icon(Icons.person),
          title: 'Profile',
          activeColorPrimary: Colors.blue,
          inactiveColorPrimary: Colors.grey,
          textStyle: TextStyle(color: Colors.black), // Add this line for Style 15
        ),
      ],
      navBarStyle: NavBarStyle.style15, // Specify Style 15
      confineInSafeArea: true,
      backgroundColor: Colors.white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: NavBarDecoration(
        boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 4.0)],
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
