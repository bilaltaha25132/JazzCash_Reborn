import 'package:flutter/material.dart';

import '../pages/morepage.dart'; // Import the MorePage
import '../pages/bank_list_page.dart'; // Import the BankListPage
import '../pages/mobile_recharge_page.dart'; // Import the MobileRechargePage

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
          color: const Color.fromARGB(255, 239, 243, 245),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ActionButton(
              icon: Icons.account_balance,
              label: 'Bank Transfer', // Bank Transfer Button
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const BankListPage()),
                );
              },
            ),
            ActionButton(
              icon: Icons.phone_android, // Icon for "Recharge"
              label: 'Recharge', // Updated label from "Transfer" to "Recharge"
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MobileRechargePage()),
                );
              },
            ),
            ActionButton(
              icon: Icons.attach_money,
              label: 'Withdraw',
              onPressed: () {
                // Implement Withdraw functionality if needed
              },
            ),
            ActionButton(
              icon: Icons.apps_sharp,
              label: 'More',
              onPressed: () {
                // Navigate to the MorePage
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
    this.onPressed,
  });

  final IconData icon;
  final String label;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton.outlined(
          onPressed: onPressed,
          icon: Icon(
            icon,
            color: const Color.fromARGB(255, 16, 80, 98), // App's teal color
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
