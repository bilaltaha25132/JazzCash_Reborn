import 'package:flutter/material.dart';

import '../widgets/action_button.dart';
import '../widgets/credit_card.dart';
import '../widgets/transaction_list.dart';

class Home extends StatelessWidget {
  final bool isUrdu; // Language toggle state

  const Home({super.key, required this.isUrdu});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF800000),
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        isUrdu ? "خوش آمدید!" : "Welcome back!",
                        style: const TextStyle(color: Colors.white),
                      ),
                      Text(
                        isUrdu ? "محمد بلال طہ" : "Muhammad Bilal Taha",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  IconButton.outlined(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.notifications,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 167),
                    color: Colors.white,
                    child: Column(
                      children: [
                        const SizedBox(height: 110),
                        ActionButtons(
                            isUrdu: isUrdu), // Pass isUrdu to ActionButtons
                        const SizedBox(height: 30),
                        TransactionList(
                            isUrdu: isUrdu), // Pass isUrdu to TransactionList
                      ],
                    ),
                  ),
                  Positioned(
                    top: 20,
                    left: 25,
                    right: 25,
                    child: CreditCard(
                      isUrdu: isUrdu,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
