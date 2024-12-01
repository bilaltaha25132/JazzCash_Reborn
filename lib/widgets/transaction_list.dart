import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  final bool isUrdu; // Language toggle state

  const TransactionList({super.key, required this.isUrdu});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  isUrdu ? "آج، 29 دسمبر" : "Today, Dec 29",
                  style: const TextStyle(color: Colors.black),
                ),
                Row(
                  children: [
                    Text(
                      isUrdu ? "تمام لین دین" : "All Transactions",
                      style: const TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ],
            ),
          ),
          ListTile(
            leading: const CircleAvatar(
              backgroundColor: Color.fromARGB(255, 239, 243, 245),
              child: Icon(
                Icons.fitness_center,
                color: Colors.purpleAccent,
              ),
            ),
            title: Text(isUrdu ? "جم" : "Gym"),
            subtitle: Text(isUrdu ? "ادائیگی" : "Payment"),
            trailing: Text(
              isUrdu ? "-\Rs.45.99" : "-\Rs.45.99",
              style: const TextStyle(color: Colors.red),
            ),
          ),
          Divider(
            color: Colors.grey[200],
          ),
          ListTile(
            leading: const CircleAvatar(
              backgroundColor: Color.fromARGB(255, 239, 243, 245),
              child: Icon(
                Icons.account_balance,
                color: Colors.teal,
              ),
            ),
            title: Text(isUrdu ? "بینک آف پنجاب" : "Bank of Punjab"),
            subtitle: Text(isUrdu ? "جمع" : "Deposit"),
            trailing: Text(
              isUrdu ? "+\Rs.1,328.00" : "+\Rs.1,328.00",
              style: const TextStyle(color: Colors.teal),
            ),
          ),
          Divider(
            color: Colors.grey[200],
          ),
          ListTile(
            leading: const CircleAvatar(
              backgroundColor: Color.fromARGB(255, 239, 243, 245),
              child: Icon(
                Icons.send,
                color: Colors.orangeAccent,
              ),
            ),
            title: Text(isUrdu ? "معاذ عارف کو" : "To Muaz Arif"),
            subtitle: Text(isUrdu ? "بھیجا گیا" : "Sent"),
            trailing: Text(
              isUrdu ? "-\Rs.699.00" : "-\Rs.699.00",
              style: const TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}
