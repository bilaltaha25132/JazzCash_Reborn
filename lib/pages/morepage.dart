import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MorePage extends StatelessWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("More"),
        centerTitle: true,
        backgroundColor: const Color(0xFF800000),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildCategory("Money Transfer", [
                {"icon": FontAwesomeIcons.star, "label": "My Favorites"},
                {
                  "icon": FontAwesomeIcons.moneyBillTransfer,
                  "label": "JazzCash Transfer"
                },
                {"icon": FontAwesomeIcons.university, "label": "Bank Transfer"},
                {"icon": FontAwesomeIcons.idBadge, "label": "CNIC Transfer"},
                {"icon": FontAwesomeIcons.landmark, "label": "Raast"},
                {
                  "icon": FontAwesomeIcons.wallet,
                  "label": "Other Wallet Transfer"
                },
                {"icon": FontAwesomeIcons.paypal, "label": "Payoneer"},
              ]),
              buildCategory("Utility Bills", [
                {"icon": FontAwesomeIcons.star, "label": "My Favorites"},
                {"icon": FontAwesomeIcons.bolt, "label": "Electricity"},
                {"icon": FontAwesomeIcons.fire, "label": "Gas"},
                {"icon": FontAwesomeIcons.water, "label": "Water"},
                {"icon": FontAwesomeIcons.globe, "label": "Internet"},
                {"icon": FontAwesomeIcons.phone, "label": "Telephone"},
              ]),
              buildCategory("Mobile Load & Packages", [
                {"icon": FontAwesomeIcons.star, "label": "My Favorites"},
                {"icon": FontAwesomeIcons.mobile, "label": "ReadyLoad Prepaid"},
                {"icon": FontAwesomeIcons.mobileAlt, "label": "Prepaid Load"},
                {
                  "icon": FontAwesomeIcons.fileInvoice,
                  "label": "Postpaid Bill"
                },
                {"icon": FontAwesomeIcons.box, "label": "Mobile Packages"},
                {"icon": FontAwesomeIcons.archive, "label": "Mobile Packages"},
              ]),
              buildCategory("Banking & Finance", [
                {"icon": FontAwesomeIcons.star, "label": "My Favorites"},
                {"icon": FontAwesomeIcons.cashRegister, "label": "ReadyCash"},
                {"icon": FontAwesomeIcons.creditCard, "label": "Debit Card"},
                {"icon": FontAwesomeIcons.shieldAlt, "label": "Insurance"},
                {
                  "icon": FontAwesomeIcons.handHoldingUsd,
                  "label": "Islamic Savings"
                },
                {
                  "icon": FontAwesomeIcons.moneyCheckAlt,
                  "label": "Credit Card Payment"
                },
                {
                  "icon": FontAwesomeIcons.university,
                  "label": "State Life Insurance"
                },
                {"icon": FontAwesomeIcons.piggyBank, "label": "Mutual Funds"},
                {
                  "icon": FontAwesomeIcons.fileInvoiceDollar,
                  "label": "Savings Plan"
                },
              ]),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCategory(String title, List<Map<String, dynamic>> items) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 12),
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.8),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return GestureDetector(
                onTap: () {},
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 6,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Icon(
                        item["icon"],
                        color: Colors.black87,
                        size: 28,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      item["label"],
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
