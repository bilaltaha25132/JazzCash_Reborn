import 'dart:async';
import 'package:flutter/material.dart';

import '../main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _pinController = TextEditingController();
  final String correctPin = "12345";

  // Welcome texts to cycle through
  final List<String> welcomeMessages = [
    "Welcome Back!",
    "Let's manage your finances!",
    "Your security is our priority!"
  ];
  int _currentMessageIndex = 0;
  late Timer _textSwitchTimer;

  @override
  void initState() {
    super.initState();
    // Timer to switch welcome messages every 3 seconds
    _textSwitchTimer = Timer.periodic(const Duration(seconds: 3), (timer) {
      setState(() {
        _currentMessageIndex =
            (_currentMessageIndex + 1) % welcomeMessages.length;
      });
    });
  }

  @override
  void dispose() {
    _textSwitchTimer.cancel(); // Cancel timer when widget is disposed
    _pinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900], // Fintech color scheme
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 25),
                // JazzCash Logo (Diagonally Positioned)
                Transform.rotate(
                  angle: -0.3, // Rotate logo diagonally (in radians)
                  child: ClipRect(
                    child: SizedBox(
                      width: 280, // Image width
                      height: 250, // Image height
                      child: Image.asset(
                        'assets/jazzcash_logo.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                // Dynamic Welcome Text
                Text(
                  welcomeMessages[_currentMessageIndex],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Securely login to manage your finances",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 40),
                // PIN Input
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextField(
                    controller: _pinController,
                    obscureText: true,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Enter your PIN",
                      hintStyle: const TextStyle(color: Colors.white54),
                      filled: true,
                      fillColor: Colors.transparent,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: const Icon(
                        Icons.lock_outline,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Login Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_pinController.text == correctPin) {
                        // Navigate to MainPage
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MainPage(),
                          ),
                        );
                      } else {
                        // Show error message
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              "Incorrect PIN. Please try again.",
                              style: TextStyle(color: Colors.white),
                            ),
                            backgroundColor: Colors.redAccent,
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      "LOGIN",
                      style: TextStyle(
                        color: Colors.grey[900],
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Forgot PIN
                GestureDetector(
                  onTap: () {
                    // Forgot PIN functionality
                  },
                  child: const Text(
                    "Forgot your PIN?",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                // Security Tip
                const Text(
                  "For your security, never share your PIN with anyone.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white54,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
