import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart'; // Import flutter_tts package

class MobileRechargePage extends StatefulWidget {
  const MobileRechargePage({super.key});

  @override
  State<MobileRechargePage> createState() => _MobileRechargePageState();
}

class _MobileRechargePageState extends State<MobileRechargePage> {
  String selectedOperator = "Jazz";
  late FlutterTts flutterTts; // Initialize FlutterTts

  @override
  void initState() {
    super.initState();
    flutterTts = FlutterTts();
    _initializeTts();
  }

  @override
  void dispose() {
    flutterTts.stop(); // Stop TTS when the widget is disposed
    super.dispose();
  }

  void _initializeTts() async {
    await flutterTts.setLanguage("en-US"); // Set language to English
    await flutterTts.setSpeechRate(0.5); // Adjust speech rate (optional)
  }

  Future<void> _speakOperator(String operatorName) async {
    await flutterTts.speak(operatorName); // Speak the operator name
  }

  @override
  Widget build(BuildContext context) {
    // Operators with images
    final operators = [
      {"name": "Jazz", "image": "assets/img_8.png"},
      {"name": "Ufone", "image": "assets/img_9.png"},
      {"name": "Telenor", "image": "assets/img_10.png"},
      {"name": "Zong", "image": "assets/img_11.png"},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Mobile Recharge"),
        centerTitle: true,
        backgroundColor: const Color(0xFF800000), // Match app's teal color
        foregroundColor: Colors.white,
        elevation: 1,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              // Operator Selection Title
              const Text(
                "Choose Your Operator",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 15),
              // Operator Selection with Images
              SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: operators.length,
                  itemBuilder: (context, index) {
                    final operator = operators[index];
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedOperator = operator["name"] as String;
                        });
                        _speakOperator(selectedOperator); // Speak operator name
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: selectedOperator == operator["name"]
                              ? const Color(0xFF800000).withOpacity(0.2)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: selectedOperator == operator["name"]
                                ? const Color(0xFF800000)
                                : Colors.grey.shade300,
                            width: 2,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              blurRadius: 10,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        width: 85,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Display operator image
                            Image.asset(
                              operator["image"] as String,
                              height: 40,
                              width: 40,
                              fit: BoxFit.contain,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              operator["name"] as String,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: selectedOperator == operator["name"]
                                    ? const Color(0xFF800000)
                                    : Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 25),
              // Phone Number Input Title
              const Text(
                "Enter Mobile Number",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 10),
              // Phone Number Input
              TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.phone, color: Colors.grey),
                  hintText: "03XX-XXXXXXX",
                  hintStyle: const TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: const Color.fromARGB(255, 239, 243, 245),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 30),
              // No Contacts Section
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 239, 243, 245),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Icon(Icons.people_alt_outlined,
                        size: 40, color: Colors.grey[400]),
                    const SizedBox(height: 10),
                    const Text(
                      "No Contacts Linked",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Link your contacts to easily search and send them money.",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        // Add contacts functionality
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF800000), // Teal
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                      ),
                      child: const Text(
                        "Add Contacts",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              // Proceed Button
              ElevatedButton(
                onPressed: () {
                  // Speak the selected operator before proceeding
                  _speakOperator("Proceeding with $selectedOperator Recharge");
                  // Proceed to Recharge functionality
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF800000), // Teal
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Proceed to Recharge",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
