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
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: isUrdu ? 18 : 15,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      isUrdu ? "تمام لین دین" : "All Transactions",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: isUrdu ? 18 : 15,
                      ),
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
            title: Text(
              isUrdu ? "جم" : "Gym",
              style: TextStyle(
                  fontSize: isUrdu ? 18 : 16,
                  fontWeight: isUrdu ? FontWeight.bold : FontWeight.normal),
            ),
            subtitle: Text(
              isUrdu ? "ادائیگی" : "Payment",
              style: TextStyle(
                fontSize: isUrdu ? 18 : 15,
              ),
            ),
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
            title: Text(
              isUrdu ? "بینک آف پنجاب" : "Bank of Punjab",
              style: TextStyle(
                  fontSize: isUrdu ? 18 : 16,
                  fontWeight: isUrdu ? FontWeight.bold : FontWeight.normal),
            ),
            subtitle: Text(
              isUrdu ? "جمع" : "Deposit",
              style: TextStyle(
                fontSize: isUrdu ? 18 : 15,
              ),
            ),
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
            title: Text(
              isUrdu ? "معاذ عارف کو" : "To Muaz Arif",
              style: TextStyle(
                  fontSize: isUrdu ? 18 : 16,
                  fontWeight: isUrdu ? FontWeight.bold : FontWeight.normal),
            ),
            subtitle: Text(
              isUrdu ? "بھیجا گیا" : "Sent",
              style: TextStyle(
                fontSize: isUrdu ? 18 : 15,
              ),
            ),
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
