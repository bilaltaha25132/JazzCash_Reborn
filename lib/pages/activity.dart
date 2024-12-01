import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../widgets/time_option_button.dart';

class ActivityPage extends StatelessWidget {
  final bool isUrdu; // Language toggle state

  const ActivityPage({super.key, required this.isUrdu});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xFF800000),
        title: Text(
          isUrdu ? "سرگرمی" : "Activity",
          style:
              const TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Smartpay Cards Section
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    3,
                    (index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 305,
                        height: 75,
                        decoration: BoxDecoration(
                          color: Colors.grey[900],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                isUrdu ? "اسمارٹ پے کارڈز" : "Smartpay Cards",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                              const Spacer(),
                              Text(
                                isUrdu ? "**** 1990" : "**** 1990",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 12.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    CircleAvatar(
                                      radius: 15,
                                      backgroundColor:
                                          Colors.red.withOpacity(0.8),
                                    ),
                                    Transform.translate(
                                      offset: const Offset(-10, 0),
                                      child: CircleAvatar(
                                        radius: 15,
                                        backgroundColor:
                                            Colors.orange.withOpacity(0.8),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              // Total Spending Section
              Container(
                padding: const EdgeInsets.all(12),
                width: double.maxFinite,
                height: 350,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(17),
                ),
                child: Column(
                  children: [
                    Text(
                      isUrdu ? "کل اخراجات" : "Total Spending",
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      isUrdu ? "\Rs.6,345.00" : "\Rs.6,345.00",
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const TimeOptionsRow(),
                    const SizedBox(height: 16),
                    Expanded(
                      child: LineChart(
                        LineChartData(
                          gridData: const FlGridData(show: false),
                          titlesData: FlTitlesData(
                            leftTitles: const AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                            bottomTitles: AxisTitles(
                              sideTitles: SideTitles(
                                  showTitles: true,
                                  getTitlesWidget: (value, meta) {
                                    const tiles = [
                                      'S',
                                      'M',
                                      'T',
                                      'W',
                                      'T',
                                      'F'
                                    ];
                                    const urduTiles = [
                                      'اتوار',
                                      'پیر',
                                      'منگل',
                                      'بدھ',
                                      'جمعرات',
                                      'جمعہ'
                                    ];
                                    final index = value.toInt();
                                    if (index >= 0 && index < tiles.length) {
                                      return Text(
                                        isUrdu
                                            ? urduTiles[index]
                                            : tiles[index],
                                        style: const TextStyle(
                                            color: Colors.black),
                                      );
                                    }
                                    return const Text("");
                                  },
                                  reservedSize: 22,
                                  interval: 1),
                            ),
                            rightTitles: const AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                            topTitles: const AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                          ),
                          borderData: FlBorderData(show: false),
                          lineBarsData: [
                            LineChartBarData(
                                spots: [
                                  const FlSpot(0, 2),
                                  const FlSpot(1, 1),
                                  const FlSpot(2, 4),
                                  const FlSpot(4, 3),
                                  const FlSpot(5, 4),
                                  const FlSpot(6, 6),
                                ],
                                isCurved: true,
                                color: Colors.teal,
                                barWidth: 3,
                                dotData: const FlDotData(show: false),
                                belowBarData: BarAreaData(
                                    show: true,
                                    color: Colors.teal.withOpacity(0.07)))
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 25),
              // Transactions Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    isUrdu ? "لین دین" : "Transaction",
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        isUrdu ? "سب" : "All",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.black,
                      )
                    ],
                  ),
                ],
              ),
              Column(
                children: List.generate(
                  3,
                  (index) => ListTile(
                    leading: const CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 239, 243, 245),
                      child: Icon(
                        Icons.payments_rounded,
                        color: Colors.black,
                      ),
                    ),
                    title: Text(
                      isUrdu ? "اسمارٹ پے یو آئی کٹ" : "Smartpay UI Kit",
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    subtitle: Text(isUrdu ? "یو آئی 8 ڈاٹ نیٹ" : "ui8.net"),
                    trailing: Text(
                      isUrdu ? "-\Rs.45.99" : "-\Rs.45.99",
                      style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Colors.red),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
