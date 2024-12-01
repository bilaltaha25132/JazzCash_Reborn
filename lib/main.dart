import 'package:fintech_ui_tutorial/pages/activity.dart';
import 'package:fintech_ui_tutorial/pages/home.dart';
import 'package:fintech_ui_tutorial/pages/my_card.dart';
import 'package:fintech_ui_tutorial/pages/profile.dart';
import 'package:fintech_ui_tutorial/pages/scan.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fintech App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF800000),
        ),
        useMaterial3: true,
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  // Define pages for navigation
  final List<Widget> pages = [
    const Home(),
    const MyCardPage(),
    const ScanPage(),
    const ActivityPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex], // Show the selected page
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            tabItem(Icons.home, "Home", 0),
            tabItem(Icons.credit_card, "My Card", 1),
            FloatingActionButton(
              onPressed: () => onTabTapped(2),
              backgroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Icon(
                Icons.qr_code_scanner,
                color: Colors.white,
              ),
            ),
            tabItem(Icons.bar_chart, "Activity", 3),
            tabItem(Icons.person, "Profile", 4),
          ],
        ),
      ),
    );
  }

  Widget tabItem(IconData icon, String label, int index) {
    return IconButton(
      onPressed: () {
        onTabTapped(index); // Change the selected tab
      },
      icon: Column(
        children: [
          Icon(
            icon,
            color: currentIndex == index ? Colors.black : Colors.grey,
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              color: currentIndex == index
                  ? Colors.black
                  : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  // Update the current index for navigation
  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }
}
