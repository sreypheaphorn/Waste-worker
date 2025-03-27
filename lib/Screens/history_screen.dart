import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HistoryPage(),
    );
  }
}

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Light green background
      // bottomNavigationBar: BottomNavigationBar(
        // backgroundColor: Colors.green[100],
        // selectedItemColor: Colors.green[700],
        // unselectedItemColor: Colors.black54,
        // showUnselectedLabels: true,
        // items: const [
        //   BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        //   BottomNavigationBarItem(icon: Icon(Icons.history), label: "History"),
        //   BottomNavigationBarItem(icon: Icon(Icons.book), label: "Social"),
        //   BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        // ],
      // ),
      body: Column(
        children: [
          // Header Section
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            decoration: BoxDecoration(
              color: Colors.green[100],
              borderRadius: const BorderRadius.only(
                // bottomLeft: Radius.circular(20),
                // bottomRight: Radius.circular(20),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        // Profile Picture
                        CircleAvatar(
                          radius: 20,
                          backgroundImage: AssetImage('assets/profile.jpg'), // Replace with actual profile image
                        ),
                        const SizedBox(width: 10),
                        // Greeting Text
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Good Morning",
                                style: TextStyle(color: Colors.black54)),
                            Text(
                              "JayyJenn!",
                              style: TextStyle(
                                  color: Colors.green[800],
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                    // Notification Icon
                    const Icon(Icons.notifications, color: Colors.black54),
                  ],
                ),
                const SizedBox(height: 30),
                // Page Title
                Center(
                  child: Text(
                    "History Page",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.green[700],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // History List Section
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                historyItem(Icons.recycling, "Plastic Collection", "2.7 Kg", "+10 Points", "\$1"),
                historyItem(Icons.recycling, "Material Collection", "2.7 Kg", "+30 Points", "\$3"),
                historyItem(Icons.card_giftcard, "Points Redeemed", "2d Ago", "+40 Points", "\$4"),
                historyItem(Icons.recycling, "Plastic Collection", "2.7 Kg", "+10 Points", "\$1"),
                historyItem(Icons.recycling, "Material Collection", "2.7 Kg", "+30 Points", "\$3"),
                historyItem(Icons.card_giftcard, "Points Redeemed", "2d Ago", "+40 Points", "\$4"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget for each history item
  Widget historyItem(IconData icon, String title, String subtitle, String points, String price) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.green[100],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, size: 30, color: Colors.black54),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text(subtitle, style: const TextStyle(color: Colors.black54)),
                ],
              ),
            ],
          ),
          Column(
            children: [
              Text(points, style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
              Text(price, style: const TextStyle(color: Colors.black54)),
            ],
          ),
        ],
      ),
    );
  }
}
