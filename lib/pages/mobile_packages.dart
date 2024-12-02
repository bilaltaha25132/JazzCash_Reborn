import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart'; // Import flutter_tts package

class MobilePackagesPage extends StatefulWidget {
  const MobilePackagesPage({super.key});

  @override
  State<MobilePackagesPage> createState() => _MobilePackagesPageState();
}

class _MobilePackagesPageState extends State<MobilePackagesPage> {
  String selectedOperator = "Jazz";
  late FlutterTts flutterTts; // Initialize FlutterTts instance

  final operators = [
    {"name": "Jazz", "image": "assets/img_8.png"},
    {"name": "Ufone", "image": "assets/img_9.png"},
    {"name": "Telenor", "image": "assets/img_10.png"},
    {"name": "Zong", "image": "assets/img_11.png"},
  ];

  final packages = {
    "Jazz": List.generate(
      10,
      (index) => {
        "name": "Jazz Plan $index",
        "price": "${(index + 1) * 500}",
        "details": "${(index + 1) * 1000} mins, ${(index + 1) * 10} GB",
        if (index % 2 == 0) "badge": "Best Value"
      },
    ),
    "Ufone": List.generate(
      8,
      (index) => {
        "name": "Ufone Plan $index",
        "price": "${(index + 1) * 400}",
        "details": "${(index + 1) * 800} mins, ${(index + 1) * 5} GB",
        if (index % 3 == 0) "badge": "Popular"
      },
    ),
    "Telenor": List.generate(
      12,
      (index) => {
        "name": "Telenor Plan $index",
        "price": "${(index + 1) * 600}",
        "details": "${(index + 1) * 1200} mins, ${(index + 1) * 8} GB",
        if (index % 4 == 0) "badge": "Best"
      },
    ),
    "Zong": List.generate(
      10,
      (index) => {
        "name": "Zong Plan $index",
        "price": "${(index + 1) * 700}",
        "details": "${(index + 1) * 900} mins, ${(index + 1) * 7} GB",
        if (index % 5 == 0) "badge": "Exclusive"
      },
    ),
  };

  @override
  void initState() {
    super.initState();
    flutterTts = FlutterTts();
    _initializeTts();
  }

  @override
  void dispose() {
    flutterTts.stop(); // Stop TTS on widget disposal
    super.dispose();
  }

  void _initializeTts() async {
    await flutterTts.setLanguage("en-US"); // Set TTS language
    await flutterTts.setSpeechRate(0.5); // Optional: Adjust speech rate
  }

  Future<void> _speakOperator(String operatorName) async {
    await flutterTts.speak(operatorName); // Speak the operator's name
  }

  @override
  Widget build(BuildContext context) {
    final selectedPackages = packages[selectedOperator] ?? [];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Prepaid Mobile Packages"),
        centerTitle: true,
        backgroundColor: const Color(0xFF800000),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Select an operator and package",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 15),
            // Operator Selector
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
                        selectedOperator = operator["name"]! as String;
                      });
                      _speakOperator(selectedOperator); // Announce selection
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      padding: const EdgeInsets.all(12),
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
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(operator["image"]! as String,
                              height: 40, width: 40),
                          const SizedBox(height: 10),
                          Text(
                            operator["name"]! as String,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: selectedOperator == operator["name"]
                                  ? const Color(0xFF800000)
                                  : Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            // Packages List
            Expanded(
              child: ListView.builder(
                itemCount: selectedPackages.length,
                itemBuilder: (context, index) {
                  final package = selectedPackages[index];
                  return Card(
                    elevation: 5,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      package["name"]! as String,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    if (package.containsKey("badge"))
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 6, vertical: 3),
                                        decoration: BoxDecoration(
                                          color: const Color(0xFF00897B),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Text(
                                          package["badge"]! as String,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  package["details"]! as String,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "Rs. ${package["price"]}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Color(0xFF800000),
                                ),
                              ),
                              const SizedBox(height: 8),
                              ElevatedButton(
                                onPressed: () {
                                  // Subscription logic
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF800000),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: const Text(
                                  "Subscribe",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
