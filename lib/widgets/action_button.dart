import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_tts/flutter_tts.dart'; // Import flutter_tts package
import '../pages/mobile_packages.dart';
import '../pages/mobile_recharge_page.dart';
import '../pages/morepage.dart'; // Import the MorePage
import '../pages/bank_list_page.dart'; // Import the BankListPage

class ActionButtons extends StatelessWidget {
  const ActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ActionButton(
              icon: Icons.account_balance,
              label: 'Bank Transfer',
              ttsText: 'Bank Transfer', // English
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const BankListPage()),
                );
              },
            ),
            ActionButton(
              icon: Icons.phone_android,
              label: 'Recharge',
              ttsText: 'Recharge', // English
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MobileRechargePage()),
                );
              },
            ),
            ActionButton(
              icon: FontAwesomeIcons.box,
              label: 'Packages',
              ttsText: 'Packages', // English
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MobilePackagesPage()),
                );
              },
            ),
            ActionButton(
              icon: Icons.apps_sharp,
              label: 'More',
              ttsText: 'More', // English
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MorePage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  const ActionButton({
    super.key,
    required this.icon,
    required this.label,
    required this.ttsText, // Text for TTS
    this.onPressed,
  });

  final IconData icon;
  final String label;
  final String ttsText; // Text to speak
  final void Function()? onPressed;

  // Initialize FlutterTts
  void _speakText() async {
    FlutterTts flutterTts = FlutterTts();
    await flutterTts.setLanguage("en-US"); // Set language to English
    await flutterTts.setSpeechRate(0.5); // Optional: Adjust speech rate
    await flutterTts.speak(ttsText); // Speak the text
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {
            _speakText(); // Speak the label in English
            if (onPressed != null) {
              onPressed!(); // Execute the button's action
            }
          },
          icon: Icon(
            icon,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
