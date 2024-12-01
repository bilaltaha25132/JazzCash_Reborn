import 'package:flutter/material.dart';


class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xFF800000),
        elevation: 0,
        title: const Text(
          "Profile",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            // Profile Picture and Name
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/img.png'),
            ),
            const SizedBox(height: 10),
            const Text(
              "Muhammad Bilal Taha",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              "bilaltaha@gmail.com",
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            // Account Balance and Details
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  profileDetail(
                    context,
                    title: "Total Balance",
                    value: "\Rs.12,300.00",
                    icon: Icons.account_balance_wallet_outlined,
                  ),
                  profileDetail(
                    context,
                    title: "Transactions",
                    value: "123",
                    icon: Icons.swap_horiz_outlined,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Profile Options
            buildSectionHeader("Account Options"),
            const SizedBox(height: 10),
            profileOption(
              context,
              icon: Icons.person_outline,
              title: "Edit Profile",
              onTap: () {},
            ),
            profileOption(
              context,
              icon: Icons.lock_outline,
              title: "Change Password",
              onTap: () {},
            ),
            profileOption(
              context,
              icon: Icons.credit_card_outlined,
              title: "Manage Cards",
              onTap: () {},
            ),
            const SizedBox(height: 20),
            buildSectionHeader("Settings"),
            const SizedBox(height: 10),
            profileOption(
              context,
              icon: Icons.notifications_none,
              title: "Notifications",
              onTap: () {},
            ),
            profileOption(
              context,
              icon: Icons.security_outlined,
              title: "Privacy & Security",
              onTap: () {},
            ),
            profileOption(
              context,
              icon: Icons.help_outline,
              title: "Help & Support",
              onTap: () {},
            ),
            const SizedBox(height: 20),
            // Log Out Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF800000),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text(
                  "Log Out",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget profileDetail(BuildContext context,
      {required String title, required String value, required IconData icon}) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.blueGrey.withOpacity(0.1),
          child: Icon(icon, color: Colors.black),
        ),
        const SizedBox(height: 10),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          title,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  Widget profileOption(BuildContext context,
      {required IconData icon,
      required String title,
      required VoidCallback onTap}) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.grey[200],
        child: Icon(icon, color: Colors.black),
      ),
      title: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }

  Widget buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
}
