import 'package:flutter/material.dart';


class MyCardPage extends StatelessWidget {
  const MyCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xFF800000),
        elevation: 0,
        title: const Text(
          "My Card",
          style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white)
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              // BackCard
              const BackCard(),
              const SizedBox(height: 25),
              // FrontCard
              const FrontCard(),
              const SizedBox(height: 30),
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add),
                label: const Text(
                  "Add new card",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    side: BorderSide(color: Colors.grey[100]!),
                    fixedSize: const Size(double.maxFinite, 55),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    backgroundColor: const Color(0xFF800000),
                    foregroundColor: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class FrontCard extends StatefulWidget {
  const FrontCard({super.key});

  @override
  State<FrontCard> createState() => _FrontCardState();
}

class _FrontCardState extends State<FrontCard> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.grey[900],
                child: Stack(
                  children: [
                    Positioned(
                      top: 16,
                      left: 16,
                      child: Image.asset(
                        "assets/jazzcash_logo.png",
                        height: 40,
                      ),
                    ),
                    Positioned(
                      top: 70,
                      left: 16,
                      child: Image.asset(
                        "assets/credit-card.png",
                        height: 30,
                        color: Colors.white,
                      ),
                    ),
                    Positioned(
                      top: 60,
                      left: 260,
                      child: Image.asset(
                        "assets/wifi.png",
                        height: 50,
                        color: Colors.white,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 16,
                      child: Row(
                        children: [
                          Text(
                            isVisible ? "4590 2162 3897 1990": "**** **** **** 1990",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                isVisible = !isVisible; // Toggle the visibility
                              });
                            },
                            icon: Icon(
                              isVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off, // Change the icon dynamically
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.grey[900],
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Muhammad Bilal Taha',
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Text(
                            '9/23',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.red.withOpacity(0.8),
                          ),
                          Transform.translate(
                            offset: const Offset(-10, 0),
                            child: CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.orange.withOpacity(0.8),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BackCard extends StatefulWidget {
  const BackCard({super.key});

  @override
  State<BackCard> createState() => _BackCardState();
}

class _BackCardState extends State<BackCard> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey[900]),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.red.withOpacity(0.8),
                        ),
                        Transform.translate(
                          offset: const Offset(-10, 0),
                          child: CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.orange.withOpacity(0.8),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          isVisible ? "4590 2162 3897 1990": "**** **** **** 1990",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              isVisible = !isVisible; // Toggle the visibility
                            });
                          },
                          icon: Icon(
                            isVisible
                                ? Icons.visibility
                                : Icons.visibility_off, // Change the icon dynamically
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const Text(
                      "9/23",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                const Text(
                  "Muhammad Bilal Taha",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
