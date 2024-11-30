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
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
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
                {
                  "icon": FontAwesomeIcons.box,
                  "label": "ReadyLoad Mobile Packages"
                },
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
              buildCategory("Travel", [
                {"icon": FontAwesomeIcons.star, "label": "My Favorites"},
                {"icon": FontAwesomeIcons.car, "label": "Careem Voucher"},
                {"icon": FontAwesomeIcons.tag, "label": "M-Tag"},
                {"icon": FontAwesomeIcons.bus, "label": "Zu Peshawar"},
                {"icon": FontAwesomeIcons.ticketAlt, "label": "Bus Tickets"},
                {"icon": FontAwesomeIcons.book, "label": "BookMe"},
              ]),
              buildCategory("Education", [
                {"icon": FontAwesomeIcons.school, "label": "School"},
                {"icon": FontAwesomeIcons.university, "label": "Colleges"},
                {
                  "icon": FontAwesomeIcons.chalkboardTeacher,
                  "label": "Coaching Centers"
                },
                {
                  "icon": FontAwesomeIcons.graduationCap,
                  "label": "Universities"
                },
                {"icon": FontAwesomeIcons.fileAlt, "label": "Entry Tests"},
                {
                  "icon": FontAwesomeIcons.clipboard,
                  "label": "Education Boards"
                },
              ]),
              buildCategory("Marketplace", [
                {"icon": FontAwesomeIcons.shoppingBag, "label": "Daraz Wallet"},
                {"icon": FontAwesomeIcons.gift, "label": "E-Vouchers"},
                {"icon": FontAwesomeIcons.shoppingCart, "label": "Price Oye"},
              ]),
              buildCategory("Government Payments", [
                {"icon": FontAwesomeIcons.landmark, "label": "Govt. Payments"},
                {"icon": FontAwesomeIcons.carCrash, "label": "Traffic Challan"},
                {"icon": FontAwesomeIcons.university, "label": "FBR-PRAL"},
                {"icon": FontAwesomeIcons.passport, "label": "Passport Fee"},
                {"icon": FontAwesomeIcons.idCard, "label": "Nadra"},
                {"icon": FontAwesomeIcons.receipt, "label": "PaymIr by KPITB"},
                {"icon": FontAwesomeIcons.fileInvoice, "label": "Tax Payments"},
              ]),
              buildCategory("Other Payments & Services", [
                {"icon": FontAwesomeIcons.star, "label": "My Favorites"},
                {"icon": FontAwesomeIcons.ticket, "label": "Online Vouchers"},
                {
                  "icon": FontAwesomeIcons.handHoldingUsd,
                  "label": "Loan Repayment"
                },
                {
                  "icon": FontAwesomeIcons.handHoldingHeart,
                  "label": "Flood Relief & Donations"
                },
                {
                  "icon": FontAwesomeIcons.handshake,
                  "label": "Corporate Payments"
                },
                {"icon": FontAwesomeIcons.apple, "label": "PomPak"},
                {"icon": FontAwesomeIcons.tag, "label": "Deals and Discounts"},
                {"icon": FontAwesomeIcons.city, "label": "PortAll"},
                {"icon": FontAwesomeIcons.wallet, "label": "JazzCash Khata"},
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
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: items
                .map(
                  (item) => Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.grey[200],
                        child: Icon(item["icon"], color: Colors.black),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        item["label"],
                        style: const TextStyle(fontSize: 12),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
