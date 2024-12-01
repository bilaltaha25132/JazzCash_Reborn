import 'package:fintech_ui_tutorial/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:fintech_ui_tutorial/pages/activity.dart';
import 'package:fintech_ui_tutorial/pages/home.dart';
import 'package:fintech_ui_tutorial/pages/my_card.dart';
import 'package:fintech_ui_tutorial/pages/profile.dart';
import 'package:fintech_ui_tutorial/pages/scan.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF800000),
        ),
        useMaterial3: true,
      ),
      home: const LoginPage(), // Set LoginPage as the initial screen
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
  bool isVoiceModeEnabled = false; // Toggle for Voice Mode
  bool isUrdu = false; // Toggle for Language (English/Urdu)
  final FlutterTts flutterTts = FlutterTts();
  late List<Widget> pages;

  @override
  void initState() {
    super.initState();
    flutterTts.setSpeechRate(0.6); // Set TTS speed
    flutterTts.setVolume(1.0); // Set TTS volume
    flutterTts.setLanguage("en-US"); // Set TTS language
    _initializePages();
  }

  void _initializePages() {
    // Initialize the pages based on the current language
    pages = [
      Home(isUrdu: isUrdu),
      const MyCardPage(),
      const ScanPage(),
      ActivityPage(isUrdu: isUrdu),
      ProfilePage(isUrdu: isUrdu),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          isUrdu ? "جاز کیش ریبورن" : "JazzCash Reborn",
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF800000),
        foregroundColor: Colors.white,
        actions: [
          // Voice Mode Toggle
          IconButton(
            icon: Icon(
              isVoiceModeEnabled ? Icons.volume_up : Icons.volume_off,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                isVoiceModeEnabled = !isVoiceModeEnabled;
              });
              if (isVoiceModeEnabled) {
                _speak(isUrdu ? "وائس موڈ فعال ہے" : "Voice mode enabled");
              } else {
                _speak(isUrdu ? "وائس موڈ غیر فعال ہے" : "Voice mode disabled");
              }
            },
          ),
          // Language Toggle Button
          TextButton(
            onPressed: () {
              setState(() {
                isUrdu = !isUrdu; // Toggle language
                _initializePages(); // Reinitialize pages for language change
              });
            },
            child: Text(
              isUrdu ? "English" : "اردو",
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: pages[currentIndex], // Show the selected page
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            tabItem(Icons.home, isUrdu ? "ہوم" : "Home", 0),
            tabItem(Icons.credit_card, isUrdu ? "میرا کارڈ" : "My Card", 1),
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
            tabItem(Icons.bar_chart, isUrdu ? "سرگرمی" : "Activity", 3),
            tabItem(Icons.person, isUrdu ? "پروفائل" : "Profile", 4),
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
              color: currentIndex == index ? Colors.black : Colors.grey,
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
    if (isVoiceModeEnabled) {
      _speak(getPageLabel(index));
    }
  }

  String getPageLabel(int index) {
    switch (index) {
      case 0:
        return isUrdu ? "ہوم" : "Home";
      case 1:
        return isUrdu ? "میرا کارڈ" : "My Card";
      case 2:
        return isUrdu ? "اسکین کریں" : "Scan";
      case 3:
        return isUrdu ? "سرگرمی" : "Activity";
      case 4:
        return isUrdu ? "پروفائل" : "Profile";
      default:
        return isUrdu ? "نامعلوم" : "Unknown";
    }
  }

  Future<void> _speak(String text) async {
    await flutterTts.speak(text);
  }

  @override
  void dispose() {
    flutterTts.stop();
    super.dispose();
  }
}
