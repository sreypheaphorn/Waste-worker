// import 'package:flutter/material.dart';
// import 'package:fl_chart/fl_chart.dart';

// class HomeScreenPage extends StatefulWidget {
//   const HomeScreenPage({super.key});

//   @override
//   State<HomeScreenPage> createState() => _HomeScreenPageState();
// }

// class _HomeScreenPageState extends State<HomeScreenPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         title: Row(
//           children: [
//             Image.asset('assets/icon/Rectangle 3.png', width: 20, height: 20),
//             const SizedBox(width: 10),
//             const Text(
//               'JayyJenn!',
//               style: TextStyle(
//                 color: Color.fromARGB(255, 29, 151, 13),
//                 fontWeight: FontWeight.bold,
//                 fontSize: 22,
//               ),
//             ),
//           ],
//         ),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.notifications_none, color: Colors.black),
//             onPressed: () {},
//           ),
//         ],
//       ),
//       body: Container(
//         padding: EdgeInsets.all(16.0),
//         child: LineChartWithTable(),
//       ),
//     );
//   }
// }

// class LineChartWithTable extends StatelessWidget {
//   const LineChartWithTable({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           // Line Chart
//           SizedBox(
//             height: 300, // Adjust height as needed
//             child: LineChart(
//               LineChartData(
//                 gridData: const FlGridData(show: true),
//                 titlesData: FlTitlesData(show: true),
//                 borderData: FlBorderData(show: true),
//                 minX: 0,
//                 maxX: 4,
//                 minY: 0,
//                 maxY: 5,
//                 lineBarsData: [
//                   LineChartBarData(
//                     spots: const [
//                       FlSpot(0, 1),
//                       FlSpot(1, 3),
//                       FlSpot(2, 1.5),
//                       FlSpot(3, 4),
//                       FlSpot(4, 2),
//                     ],
//                     isCurved: true,
//                     color: const Color.fromARGB(255, 65, 218, 98),
//                     dotData: const FlDotData(show: false),
//                     belowBarData: BarAreaData(
//                       show: true,
//                       color: const Color.fromARGB(
//                         255,
//                         52,
//                         217,
//                         88,
//                       ).withOpacity(0.3),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),

//           const SizedBox(height: 10), // Space between chart and table

//           Container(
//             alignment: Alignment.centerLeft,
//             padding: EdgeInsets.all(30), // Corrected padding
//               child: Text(
//               "Get Started",
//               style: TextStyle(
//                 fontSize: 20,
//                 color: Colors.green,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//           Column(
//             children: [
//               Container(

//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class HomeScreenPage extends StatefulWidget {
  const HomeScreenPage({super.key});

  @override
  State<HomeScreenPage> createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<HomeScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/icon/profile.jpg'),
              radius: 16,
            ),
            const SizedBox(width: 10),
            const Text(
              'JayyJenn!',
              style: TextStyle(
                color: Color(0xFF1D970D),
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTotalPointsCard(),
              const SizedBox(height: 20),
              _buildGetStartedSection(),
              const SizedBox(height: 20),
              _buildRecentActivitySection(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }
}

Widget _buildTotalPointsCard() {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.green),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Line Chart
        SizedBox(
          height: 300, // Adjust height as needed
          child: LineChart(
            LineChartData(
              gridData: const FlGridData(show: true),
              titlesData: FlTitlesData(show: true),
              borderData: FlBorderData(show: true),
              minX: 0,
              maxX: 4,
              minY: 0,
              maxY: 5,
              lineBarsData: [
                LineChartBarData(
                  spots: const [
                    FlSpot(0, 1),
                    FlSpot(1, 3),
                    FlSpot(2, 1.5),
                    FlSpot(3, 4),
                    FlSpot(4, 2),
                  ],
                  isCurved: true,
                  color: const Color.fromARGB(255, 65, 218, 98),
                  dotData: const FlDotData(show: false),
                  belowBarData: BarAreaData(
                    show: true,
                    color: const Color.fromARGB(
                      255,
                      52,
                      217,
                      88,
                    ).withOpacity(0.3),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _buildGetStartedSection() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        "Get Started",
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.green,
        ),
      ),
      const SizedBox(height: 10),
      _buildActionCard(
        "Schedule Pickup",
        "Redeem Your Points And Get Exciting Rewards!",
      ),
      const SizedBox(height: 10),
      _buildActionCard(
        "Get Your Rewards!",
        "Schedule A Pickup And Turn Your Waste Into Value Quick!",
      ),
    ],
  );
}

Widget _buildRecentActivitySection() {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Recent Activity",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              "View All",
              style: TextStyle(color: Colors.green),
            ),
          ),
        ],
      ),
      Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.green),
                          color: const Color.fromARGB(255, 201, 238, 203),

            
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Plastic Collection",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text("+10 Points", style: TextStyle(color: Colors.green)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Text("2.7 Kg", style: TextStyle(color: Colors.black54)),
                    const SizedBox(height: 4),
                    Text(
                      "\$1",
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ],
  );
}

Widget _buildActionCard(String title, String description) {
  return Card(
    elevation: 1,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
      side: const BorderSide(color: Colors.green),
    ),
    child: ListTile(
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
      subtitle: Text(description),
      trailing: const Icon(Icons.arrow_forward, color: Colors.green),
    ),
  );
}

Widget _buildActivityItem(
  String title,
  String points,
  String weightOrTime,
  String price,
) {
  return Card(
    elevation: 1,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    child: ListTile(
      leading: const Icon(Icons.recycling, color: Colors.green),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(weightOrTime),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(points, style: const TextStyle(color: Colors.green)),
          Text(price, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    ),
  );
}
Widget _buildBottomNavBar() {
  return BottomNavigationBar(
    selectedItemColor: Colors.green,
    unselectedItemColor: Colors.grey,
    items: const [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
      BottomNavigationBarItem(icon: Icon(Icons.history), label: "History"),
      BottomNavigationBarItem(icon: Icon(Icons.layers), label: "Social"),
      BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
    ],
  );
}
