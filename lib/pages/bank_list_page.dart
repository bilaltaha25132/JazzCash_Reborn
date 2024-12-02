import 'package:fintech_ui_tutorial/pages/transfer_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart'; // Import flutter_tts package

class BankListPage extends StatelessWidget {
  const BankListPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize FlutterTts
    final FlutterTts flutterTts = FlutterTts();

    // Function to speak bank name
    Future<void> _speakBankName(String bankName) async {
      await flutterTts.setLanguage("en-US"); // Set language to English
      await flutterTts.setSpeechRate(0.5); // Adjust speech rate (optional)
      await flutterTts.speak(bankName); // Speak the bank name
    }

    final banks = [
      {"name": "Meezan Bank", "logo": "assets/img_1.png"},
      {"name": "APNA Microfinance", "logo": "assets/img_2.png"},
      {"name": "Al Baraka Bank", "logo": "assets/img_3.png"},
      {"name": "Allied Bank", "logo": "assets/img_4.png"},
      {"name": "Askari Bank", "logo": "assets/img_5.png"},
      {"name": "Bank Al-Habib", "logo": "assets/img_6.png"},
      {"name": "Bank Alfalah", "logo": "assets/img_7.png"},
      {"name": "Sadapay", "logo": "assets/img_13.png"},
      {"name": "Nayapay", "logo": "assets/img_14.png"},
      {"name": "Soneri Bank", "logo": "assets/img_15.png"},
      {"name": "UBL", "logo": "assets/img_16.png"},
      {"name": "Faysal Bank", "logo": "assets/img_17.png"},
      {"name": "Habib Metro", "logo": "assets/img_18.png"},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Send Money"),
        centerTitle: true,
        backgroundColor: const Color(0xFF800000),
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                hintText: 'Search (e.g. bank name)',
                hintStyle: const TextStyle(color: Colors.grey),
                filled: true,
                fillColor: const Color.fromARGB(255, 239, 243, 245),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          // Bank List
          Expanded(
            child: ListView.builder(
              itemCount: banks.length,
              itemBuilder: (context, index) {
                final bank = banks[index];
                return Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage:
                          AssetImage(bank["logo"]!), // Use bank logo
                      radius: 25,
                      backgroundColor: Colors.grey[200],
                    ),
                    title: Text(
                      bank["name"]!,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    onTap: () {
                      // Speak the bank name
                      _speakBankName(bank["name"]!);

                      // Navigate to the TransferDetailsPage with bank details
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TransferDetailsPage(
                            bankName: bank["name"]!,
                            bankLogo: bank["logo"]!,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
