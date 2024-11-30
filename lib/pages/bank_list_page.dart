import 'package:flutter/material.dart';

class BankListPage extends StatelessWidget {
  const BankListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final banks = [
      {"name": "Meezan Bank", "logo": "assets/img_1.png"},
      {"name": "APNA Microfinance", "logo": "assets/img_2.png"},
      {"name": "Al Baraka Bank", "logo": "assets/img_3.png"},
      {"name": "Allied Bank", "logo": "assets/img_4.png"},
      {"name": "Askari Bank", "logo": "assets/img_5.png"},
      {"name": "Bank Al-Habib", "logo": "assets/img_6.png"},
      {"name": "Bank Alfalah", "logo": "assets/img_7.png"},
      // Add all remaining banks here
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Send Money"),
        centerTitle: true,
        backgroundColor:
            const Color.fromARGB(255, 16, 80, 98), // Match app's teal color
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
                fillColor: const Color.fromARGB(
                    255, 239, 243, 245), // Light gray background
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none, // No border
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
                    color: Colors.white, // White card background
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1), // Subtle shadow
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
                        color: Color.fromARGB(
                            255, 16, 80, 98), // Match app's teal color
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    onTap: () {
                      // Implement functionality when a bank is selected
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
