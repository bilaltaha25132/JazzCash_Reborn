import 'package:flutter/material.dart';
import '../main.dart'; // Ensure this imports your MainPage()

class TransactionSuccessPage extends StatelessWidget {
  final String fromAccountName;
  final String fromAccountNumber;
  final String toAccountName;
  final String toAccountNumber;
  final String bankName;
  final String amount;
  final String transactionId;
  final String dateTime;
  final String paymentMode;

  const TransactionSuccessPage({
    super.key,
    required this.fromAccountName,
    required this.fromAccountNumber,
    required this.toAccountName,
    required this.toAccountNumber,
    required this.bankName,
    required this.amount,
    required this.transactionId,
    required this.dateTime,
    required this.paymentMode,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Send Money"),
        centerTitle: true,
        backgroundColor: const Color(0xFF800000),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              // Success Icon
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.green.withOpacity(0.2),
                child: const Icon(
                  Icons.check_circle,
                  size: 60,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 20),
              // Success Message
              const Text(
                "Transaction Successful",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 10),
              // From Account Details
              Text(
                "$fromAccountName ($fromAccountNumber)",
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              // Money Transferred
              const Text(
                "Money Transferred",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              Text(
                "Rs. $amount",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                  color: Colors.teal,
                ),
              ),
              const SizedBox(height: 10),
              // To Account Details
              const Text(
                "to",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              Text(
                "$toAccountName - ${toAccountNumber.substring(toAccountNumber.length - 4)}",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              // Bank Details
              Text(
                bankName,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                dateTime,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Transaction ID (TID): $transactionId",
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Mode: $paymentMode",
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              // Action Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Screenshot Button
                  Flexible(
                    child: OutlinedButton(
                      onPressed: () {
                        // Implement Screenshot logic
                      },
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 10,
                        ),
                        side: BorderSide(color: const Color(0xFF800000).withOpacity(0.8)),
                      ),
                      child: const Text(
                        "Screenshot",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF800000),
                        ),
                      ),
                    ),
                  ),
                  // Share Receipt Button
                  Flexible(
                    child: OutlinedButton(
                      onPressed: () {
                        // Implement Share Receipt logic
                      },
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 10,
                        ),
                        side: BorderSide(color: const Color(0xFF800000).withOpacity(0.8)),
                      ),
                      child: const Text(
                        "Share Receipt",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF800000),
                        ),
                      ),
                    ),
                  ),
                  // OK Button
                  Flexible(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MainPage(),
                          ),
                              (route) => false,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF800000),
                        padding: const EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 20,
                        ),
                      ),
                      child: const Text(
                        "OK",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
