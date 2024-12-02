import 'package:flutter/material.dart';
import '../main.dart';

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
        title: const Text("Transaction Status"),
        centerTitle: true,
        backgroundColor: const Color(0xFF800000),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Success Icon
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.green.withOpacity(0.2),
                ),
                padding: const EdgeInsets.all(40),
                child: const Icon(
                  Icons.check_circle,
                  size: 100,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 30),
              // Success Message
              const Text(
                "Transaction Successful",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 10),
              // From Account Details
              Text(
                "$fromAccountName (${fromAccountNumber})",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const Divider(thickness: 1, height: 30),
              // Money Transferred
              Column(
                children: [
                  const Text(
                    "Amount Transferred",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Rs. $amount",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                      color: Colors.teal,
                    ),
                  ),
                ],
              ),
              const Divider(thickness: 1, height: 30),
              // To Account Details
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Transferred To",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "$toAccountName - ${toAccountNumber.substring(toAccountNumber.length - 4)}",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    bankName,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.teal,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const Divider(thickness: 1, height: 30),
              // Transaction Details
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildDetailRow("Date & Time", dateTime),
                  const SizedBox(height: 5),
                  _buildDetailRow("Transaction ID", transactionId),
                  const SizedBox(height: 5),
                  _buildDetailRow("Payment Mode", paymentMode),
                ],
              ),
              const SizedBox(height: 40),
              // Action Buttons
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        // Implement Screenshot logic
                      },
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        side: BorderSide(
                          color: const Color(0xFF800000).withOpacity(0.8),
                        ),
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
                  const SizedBox(width: 10),
                  Expanded(
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
                        padding: const EdgeInsets.symmetric(vertical: 14),
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
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black54,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}
