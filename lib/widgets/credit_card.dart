import 'package:flutter/material.dart';

class CreditCard extends StatelessWidget {
  const CreditCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 220,
        width: 350,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  // color:  const Color.fromARGB(255, 29, 29, 29),
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
                        top: 65,
                        left: 16,
                        child: Image.asset(
                          "assets/credit-card.png",
                          height: 30,
                          color: Colors.white,
                        ),
                      ),
                      Positioned(
                        top: 55,
                        left: 260,
                        child: Image.asset(
                          "assets/wifi.png",
                          height: 50,
                          color: Colors.white,
                        ),
                      ),
                      const Positioned(
                        bottom: 5,
                        left: 16,
                        child: Text(
                          "Muhammad Bilal Taha",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                          ),
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
                       const Text(
                          '\Rs. 10,250.00',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                          ),
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
        ));
  }
}
