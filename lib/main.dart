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
  final FlutterTts flutterTts = FlutterTts();

  // Define pages for navigation
  final List<Widget> pages = [
    const Home(),
    const MyCardPage(),
    const ScanPage(),
    const ActivityPage(),
    const ProfilePage(),
  ];

  @override
  void initState() {
    super.initState();
    flutterTts.setSpeechRate(0.6); // Set TTS speed
    flutterTts.setVolume(1.0); // Set TTS volume
    flutterTts.setLanguage("us-En"); // Set TTS language
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "JazzCash Reborn",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
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
                _speak("Voice mode enabled");
              } else {
                _speak("Voice mode disabled");
              }
            },
          ),
        ],
      ),
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
      _speak("${getPageLabel(index)}");
    }
  }

  String getPageLabel(int index) {
    switch (index) {
      case 0:
        return "Home";
      case 1:
        return "My Card";
      case 2:
        return "Scan";
      case 3:
        return "Activity";
      case 4:
        return "Profile";
      default:
        return "Unknown";
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
