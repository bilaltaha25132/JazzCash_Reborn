import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_tts/flutter_tts.dart'; // Import flutter_tts package
import '../pages/mobile_packages.dart';
import '../pages/mobile_recharge_page.dart';
import '../pages/morepage.dart'; // Import the MorePage
import '../pages/bank_list_page.dart'; // Import the BankListPage

class ActionButtons extends StatelessWidget {
  final bool isUrdu; // Language toggle (English/Urdu)

  const ActionButtons({super.key, required this.isUrdu});

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
              label: isUrdu ? 'بینک ٹرانسفر' : 'Bank Transfer',
              ttsText: isUrdu ? 'بینک ٹرانسفر' : 'Bank Transfer',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const BankListPage()),
                );
              },
              isUrdu: isUrdu,
            ),
            ActionButton(
              icon: Icons.phone_android,
              label: isUrdu ? 'ریچارج' : 'Recharge',
              ttsText: isUrdu ? 'ریچارج' : 'Recharge',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MobileRechargePage()),
                );
              },
              isUrdu: isUrdu,
            ),
            ActionButton(
              icon: FontAwesomeIcons.box,
              label: isUrdu ? 'پیکجز' : 'Packages',
              ttsText: isUrdu ? 'پیکجز' : 'Packages',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MobilePackagesPage()),
                );
              },
              isUrdu: isUrdu,
            ),
            ActionButton(
              icon: Icons.apps_sharp,
              label: isUrdu ? 'مزید' : 'More',
              ttsText: isUrdu ? 'مزید' : 'More',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MorePage()),
                );
              },
              isUrdu: isUrdu,
            ),
          ],
        ),
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final String ttsText;
  final void Function()? onPressed;
  final bool isUrdu;

  const ActionButton({
    super.key,
    required this.icon,
    required this.label,
    required this.ttsText,
    this.onPressed,
    required this.isUrdu,
  });

  // Initialize FlutterTts
  void _speakText() async {
    FlutterTts flutterTts = FlutterTts();
    await flutterTts
        .setLanguage(isUrdu ? "ur-PK" : "en-US"); // Set language dynamically
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
            _speakText(); // Speak the label in the current language
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
