import 'package:flutter/material.dart';

import 'confirm_transfer_page.dart';

class TransferDetailsPage extends StatefulWidget {
  final String bankName;
  final String bankLogo;

  const TransferDetailsPage({
    super.key,
    required this.bankName,
    required this.bankLogo,
  });

  @override
  State<TransferDetailsPage> createState() => _TransferDetailsPageState();
}

class _TransferDetailsPageState extends State<TransferDetailsPage> {
  final TextEditingController accountNumberController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  String? selectedPurpose;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Send Money"),
        centerTitle: true,
        backgroundColor: const Color(0xFF800000),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // From Account Section
              const Text(
                "From Account",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey[900],
                      radius: 25, // Overall size of the avatar
                      child: ClipOval(
                        child: SizedBox(
                          width: 50, // Image width
                          height: 50, // Image height
                          child: Image.asset(
                            'assets/jazzcash_logo.png',
                            fit: BoxFit.contain,
                            // Adjust the image's fit
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(width: 10),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Muhammad Bilal",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            "9876 5432 1234 1990",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // To Account Section
              const Text(
                "To Account",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage(widget.bankLogo),
                          radius: 25,
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.bankName,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                              const Text(
                                "Available balance: Rs. 19,304",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: accountNumberController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: "Enter Account Number",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // Amount Input Section
              TextField(
                controller: amountController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Enter Amount",

                  border: OutlineInputBorder(),
                  hintText: "Enter between Rs.1 and Rs.5,000,000",
                ),
              ),

              const SizedBox(height: 16),

              // Purpose Dropdown
              const Text(
                "Purpose of Payment",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 4),
              DropdownButtonFormField<String>(
                items: const [
                  DropdownMenuItem(
                    value: "Others",
                    child: Text("Others"),
                  ),
                  DropdownMenuItem(
                    value: "Utility Bills",
                    child: Text("Utility Bills"),
                  ),
                  DropdownMenuItem(
                    value: "Shopping",
                    child: Text("Shopping"),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    selectedPurpose = value;
                  });
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Select Purpose",
                ),
              ),

              const SizedBox(height: 16),

              // Next Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Validate inputs and navigate to ConfirmDetailsPage
                    if (accountNumberController.text.isEmpty ||
                        amountController.text.isEmpty ||
                        selectedPurpose == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Please fill all fields"),
                        ),
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ConfirmDetailsPage(
                            fromAccountName: "Muhammad Bilal",
                            fromAccountNumber: "9876 5432 1234 1990",
                            toAccountName: widget.bankName,
                            toAccountNumber: accountNumberController.text,
                            bankName: widget.bankName,
                            bankLogo: widget.bankLogo,
                            amount: amountController.text,
                            purpose: selectedPurpose!,
                          ),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    backgroundColor: const Color(0xFF800000),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text(
                    "Next",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
