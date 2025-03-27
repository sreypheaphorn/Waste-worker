// import 'package:flutter/material.dart';
// class RewardScreen extends StatefulWidget {
//   const RewardScreen({super.key});
//   @override
//   State<RewardScreen> createState() => _RewardScreenState();
// }
// class _RewardScreenState extends State<RewardScreen> {
//   final List<Map<String, dynamic>> rewards = [
//     {
//       'icon': Icons.shopping_bag,
//       'title': "20% OFF",
//       'description': "Shopping Discount\n1000 points"
//     },
//     {
//       'icon': Icons.card_giftcard,
//       'title': "Gift Box",
//       'description': "Eco-Friendly\n750 points"
//     },
//     {
//       'icon': Icons.local_shipping,
//       'title': "Free Pickup",
//       'description': "1 Service\n250 points"
//     },
//     {
//       'icon': Icons.attach_money,
//       'title': "\$10",
//       'description': "Cash voucher\n500 points"
//     },
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white, 
//       appBar: AppBar(
//         backgroundColor: Colors.green[100], 
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.green),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//       body: Column(
//         // crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Container(
//             width: 430,
//             height:259 ,
//             // padding: const EdgeInsets.symmetric(vertical: 20),
//             color: Colors.green[100], 
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const Text("Total Points",
//                     style: TextStyle(fontSize: 14, color: Colors.black54,)),
//                 const SizedBox(height: 5),
//                 const Text(
//                   "2,4375", 
//                   style: TextStyle(
                    
//                     fontSize: 40,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.green,
//                   ),
//                 ),
//               ],
//             ),
//           ),

//           const SizedBox(height: 20),

//           const Text(
//             "Redeemable Rewards",
//             style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//               color: Colors.green,
//             ),
//           ),

//           const SizedBox(height: 10),

//           Expanded(
//             child: GridView.builder(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2, // Two columns
//                 crossAxisSpacing: 12,
//                 mainAxisSpacing: 12,
//                 // childAspectRatio: 1,
//               ),
//               itemCount: rewards.length,
//               itemBuilder: (context, index) {
//                 var reward = rewards[index];
//                 return Container(
//                   decoration: BoxDecoration(
//                     border: Border.all(color: Colors.green, width: 2), //boder
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.all(12),
//                     child: Column(
//                       // mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Icon(reward['icon'], size: 40, color: Colors.green),
//                         const SizedBox(height: 8),
//                         Text(
//                           reward['title'],
//                           style: const TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.green,
//                           ),
//                         ),
//                         const SizedBox(height: 8),
//                         ElevatedButton(
//                           onPressed: () {},
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.green,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(8),
//                             ),
//                             padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
//                           ),
//                           child: const Text(
//                             "Redeem",
//                             style: TextStyle(color: Colors.white, fontSize: 14),
//                           ),
//                         ),
//                         const SizedBox(height: 6),
//                         Text(
//                           reward['description'],
//                           textAlign: TextAlign.center,
//                           style: const TextStyle(fontSize: 14, color: Colors.grey,),
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:app_coures/controllers/reward_controller.dart';
// import 'package:app_coures/models/reward_model.dart';

// class RewardScreen extends StatefulWidget {
//   const RewardScreen({super.key});

//   @override
//   State<RewardScreen> createState() => _RewardScreenState();
// }

// class _RewardScreenState extends State<RewardScreen> {
//   final RewardOptionController _controller = RewardOptionController();
//   List<RewardOption> _rewardOptions = [];
//   bool _isLoading = true;
//   bool _hasError = false;

//   // Static icons for rewards
//   final Map<String, IconData> rewardIcons = {
//     "discount": Icons.shopping_bag,
//     "gift": Icons.card_giftcard,
//     "pickup": Icons.local_shipping,
//     "cash": Icons.attach_money,
//   };

//   @override
//   void initState() {
//     super.initState();
//     _fetchRewards();
//   }

//   Future<void> _fetchRewards() async {
//     try {
//       List<RewardOption> rewards = await _controller.fetchRewardOptions();
//       setState(() {
//         _rewardOptions = rewards;
//         _isLoading = false;
//         _hasError = false;
//       });
//     } catch (e) {
//       setState(() {
//         _isLoading = false;
//         _hasError = true;
//       });
//       print("Error loading rewards: $e");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.green[100],
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.green),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         title: const Text(
//           "Rewards",
//           style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
//         ),
//         centerTitle: true,
//       ),
//       body: Column(
//         children: [
//           // Total Points Section
//           Container(
//             width: double.infinity,
//             height: 250,
//             color: Colors.green[100],
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const Text(
//                   "Total Points",
//                   style: TextStyle(fontSize: 16, color: Colors.black54),
//                 ),
//                 const SizedBox(height: 8),
//                 const Text(
//                   "24,375", // Replace with actual API value if needed
//                   style: TextStyle(
//                     fontSize: 42,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.green,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(height: 20),

//           // Redeemable Rewards Title
//           const Text(
//             "Redeemable Rewards",
//             style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//               color: Colors.green,
//             ),
//           ),

//           const SizedBox(height: 15),

//           // Rewards Grid
//           Expanded(
//             child: _isLoading
//                 ? const Center(child: CircularProgressIndicator())
//                 : _hasError
//                     ? const Center(child: Text("Failed to load rewards"))
//                     : Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 16),
//                         child: GridView.builder(
//                           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                             crossAxisCount: 2,
//                             crossAxisSpacing: 12,
//                             mainAxisSpacing: 12,
//                             childAspectRatio: 0.9,
//                           ),
//                           itemCount: _rewardOptions.length,
//                           itemBuilder: (context, index) {
//                             final reward = _rewardOptions[index];

//                             // Get icon based on reward type (default: `card_giftcard`)
//                             IconData iconData = rewardIcons[reward] ?? Icons.card_giftcard;

//                             return Container(
//                               decoration: BoxDecoration(
//                                 border: Border.all(color: Colors.green, width: 2),
//                                 borderRadius: BorderRadius.circular(12),
//                               ),
//                               child: Padding(
//                                 padding: const EdgeInsets.all(12),
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Icon(iconData, size: 48, color: Colors.green),
//                                     const SizedBox(height: 8),
//                                     Text(
//                                       reward.title,
//                                       textAlign: TextAlign.center,
//                                       style: const TextStyle(
//                                         fontSize: 16,
//                                         fontWeight: FontWeight.bold,
//                                         color: Colors.green,
//                                       ),
//                                     ),
//                                     const SizedBox(height: 10),
//                                     ElevatedButton(
//                                       onPressed: () {
//                                         // Handle reward redemption logic
//                                       },
//                                       style: ElevatedButton.styleFrom(
//                                         backgroundColor: Colors.green,
//                                         shape: RoundedRectangleBorder(
//                                           borderRadius: BorderRadius.circular(8),
//                                         ),
//                                         padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
//                                       ),
//                                       child: const Text(
//                                         "Redeem",
//                                         style: TextStyle(color: Colors.white, fontSize: 14),
//                                       ),
//                                     ),
//                                     const SizedBox(height: 6),
//                                     Text(
//                                       "${reward.description}\n${reward.exchangePoint} points",
//                                       textAlign: TextAlign.center,
//                                       style: const TextStyle(
//                                         fontSize: 14,
//                                         color: Colors.black54,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             );
//                           },
//                         ),
//                       ),
//           ),
//         ],
//       ),
//     );
//   }
// }





import 'package:flutter/material.dart';

class RewardScreen extends StatefulWidget {
  const RewardScreen({super.key});

  @override
  State<RewardScreen> createState() => _RewardScreenState();
}

class _RewardScreenState extends State<RewardScreen> {
  final List<Map<String, dynamic>> rewards = [
    {
      'icon': Icons.shopping_bag,
      'title': "20% OFF",
      'description': "Shopping Discount\n1000 points"
      
    },
    {
      'icon': Icons.card_giftcard,
      'title': "Gift Box",
      'description': "Eco-Friendly\n750 points"
    },
    {
      'icon': Icons.local_shipping,
      'title': "Free Pickup",
      'description': "1 Service\n250 points"
    },
    {
      'icon': Icons.attach_money,
      'title': "\$10",
      'description': "Cash voucher\n500 points"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green[100],
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.green),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Rewards",
          style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Total Points Section
          Container(
            width: double.infinity,
            height: 250,
            color: Colors.green[100],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Total Points",
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
                const SizedBox(height: 8),
                const Text(
                  "24,375", // Fixed Formatting
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Redeemable Rewards Title
          const Text(
            "Redeemable Rewards",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),

          const SizedBox(height: 15),

          // Rewards Grid
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Two columns
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.9, // Adjust aspect ratio for better spacing
                ),
                itemCount: rewards.length,
                itemBuilder: (context, index) {
                  var reward = rewards[index];
                  return Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.green, width: 2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(reward['icon'], size: 48, color: Colors.green),
                          const SizedBox(height: 8),
                          Text(
                            reward['title'],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                          const SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 24, vertical: 10),
                            ),
                            child: const Text(
                              "Redeem",
                              style: TextStyle(color: Colors.white, fontSize: 14),
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            reward['description'],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
