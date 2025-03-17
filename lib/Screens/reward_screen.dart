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
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 430,
            height:259 ,
            padding: const EdgeInsets.symmetric(vertical: 20),
            color: Colors.green[100], 
            child: Column(
              children: [
                const Text("Total Points",
                    style: TextStyle(fontSize: 14, color: Colors.black54,)),
                const SizedBox(height: 5),
                const Text(
                  "2,4375", 
                  style: TextStyle(
                    
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          const Text(
            "Redeemable Rewards",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),

          const SizedBox(height: 10),

          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Two columns
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                // childAspectRatio: 1,
              ),
              itemCount: rewards.length,
              itemBuilder: (context, index) {
                var reward = rewards[index];
                return Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.green, width: 2), //boder
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(reward['icon'], size: 40, color: Colors.green),
                        const SizedBox(height: 8),
                        Text(
                          reward['title'],
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                        const SizedBox(height: 8),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
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
                          style: const TextStyle(fontSize: 14, color: Colors.grey,),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
