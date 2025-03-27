// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: HistoryPage(),
//     );
//   }
// }

// class HistoryPage extends StatelessWidget {
//   const HistoryPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white, // Light green background
//       // bottomNavigationBar: BottomNavigationBar(
//         // backgroundColor: Colors.green[100],
//         // selectedItemColor: Colors.green[700],
//         // unselectedItemColor: Colors.black54,
//         // showUnselectedLabels: true,
//         // items: const [
//         //   BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
//         //   BottomNavigationBarItem(icon: Icon(Icons.history), label: "History"),
//         //   BottomNavigationBarItem(icon: Icon(Icons.book), label: "Social"),
//         //   BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
//         // ],
//       // ),
//       body: Column(
//         children: [
//           // Header Section
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
//             decoration: BoxDecoration(
//               color: Colors.green[100],
//               borderRadius: const BorderRadius.only(
//                 // bottomLeft: Radius.circular(20),
//                 // bottomRight: Radius.circular(20),
//               ),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Row(
//                       children: [
//                         // Profile Picture
//                         CircleAvatar(
//                           radius: 20,
//                           backgroundImage: AssetImage('assets/profile.jpg'), // Replace with actual profile image
//                         ),
//                         const SizedBox(width: 10),
//                         // Greeting Text
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             const Text("Good Morning",
//                                 style: TextStyle(color: Colors.black54)),
//                             Text(
//                               "JayyJenn!",
//                               style: TextStyle(
//                                   color: Colors.green[800],
//                                   fontWeight: FontWeight.bold),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                     // Notification Icon
//                     const Icon(Icons.notifications, color: Colors.black54),
//                   ],
//                 ),
//                 const SizedBox(height: 30),
//                 // Page Title
//                 Center(
//                   child: Text(
//                     "History Page",
//                     style: TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.green[700],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           // History List Section
//           Expanded(
//             child: ListView(
//               padding: const EdgeInsets.all(16),
//               children: [
//                 historyItem(Icons.recycling, "Plastic Collection", "2.7 Kg", "+10 Points", "\$1"),
//                 historyItem(Icons.recycling, "Material Collection", "2.7 Kg", "+30 Points", "\$3"),
//                 historyItem(Icons.card_giftcard, "Points Redeemed", "2d Ago", "+40 Points", "\$4"),
//                 historyItem(Icons.recycling, "Plastic Collection", "2.7 Kg", "+10 Points", "\$1"),
//                 historyItem(Icons.recycling, "Material Collection", "2.7 Kg", "+30 Points", "\$3"),
//                 historyItem(Icons.card_giftcard, "Points Redeemed", "2d Ago", "+40 Points", "\$4"),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // Widget for each history item
//   Widget historyItem(IconData icon, String title, String subtitle, String points, String price) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 10),
//       padding: const EdgeInsets.all(15),
//       decoration: BoxDecoration(
//         color: Colors.green[100],
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Row(
//             children: [
//               Icon(icon, size: 30, color: Colors.black54),
//               const SizedBox(width: 10),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
//                   Text(subtitle, style: const TextStyle(color: Colors.black54)),
//                 ],
//               ),
//             ],
//           ),
//           Column(
//             children: [
//               Text(points, style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
//               Text(price, style: const TextStyle(color: Colors.black54)),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }



import 'package:app_coures/controllers/cancel_history_controller.dart';
import 'package:app_coures/models/history_model.dart';
import 'package:flutter/material.dart';
import 'package:app_coures/controllers/pickup_controller.dart';

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

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final PickupController _pickupController = PickupController();
  final DeleteHistoryController _deleteHistoryController = DeleteHistoryController();
  List<Pickup> pickups = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchPickups();
  }
  Future<void> _cancelPickup(int pickupId) async {
    try {
      await _deleteHistoryController.cancelPickup(pickupId);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Pickup schedule canceled successfully'),
        backgroundColor: Color(0xFF086C74),),
      );
      _fetchPickups();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to cancel pickup: $e'),
        backgroundColor: Color(0xFFFF0000),),
      );
    }
  }

  // Fetch Pickup data
  Future<void> _fetchPickups() async {
    try {
      final fetchedPickups = await _pickupController.fetchPickups();
      setState(() {
        pickups = fetchedPickups;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print('Error fetching pickups: $e');
    }

  }

  // Delete an item from the list
  // void _deletePickup(int pickupId) {
  //   setState(() {
  //     pickups.removeWhere((pickup) => pickup.pickupId == pickupId);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Header Section
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            decoration: BoxDecoration(
              color: Colors.green[100],
              borderRadius: const BorderRadius.only(),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundImage: AssetImage('assets/icon/Rectangle 3.png'),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Good Morning", style: TextStyle(color: Colors.black54)),
                            Text("JayyJenn!", style: TextStyle(color: Colors.green[800], fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ],
                    ),
                    const Icon(Icons.notifications, color: Colors.black54),
                  ],
                ),
                const SizedBox(height: 30),
                Center(
                  child: Text(
                    "History Page",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green[700]),
                  ),
                ),
              ],
            ),
          ),
          // History List Section
          Expanded(
            child: isLoading
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                  
                    padding: const EdgeInsets.all(16),
                    itemCount: pickups.length,
                    itemBuilder: (context, index) {
                      final pickup = pickups[index];
                      return historyItem(
                        // Icons.recycling,
                        "Pickup #${pickup.pickupId}",
                        "Date: ${pickup.date}",
                        "${pickup.estimateWeight} Kg",
                        "+${pickup.status}",
                        pickup.pickupId,
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget historyItem( String title, String subtitle, String weight, String status, int pickupId) {
    return Container(
      width: 240,
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
              // Icon(icon, size: 30, color: Colors.black54),
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
              Text(weight, style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
              Text(status, style: const TextStyle(color: Colors.black54)),
            ],
          ),
          // Delete Button
          IconButton(
            
            icon: const Icon(Icons.delete, color: Colors.red),
            onPressed: () => _cancelPickup(pickupId),
          ),
        ],
      ),
    );
  }
}
