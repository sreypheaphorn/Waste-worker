// import 'package:app_coures/controllers/activity_controller.dart';
// import 'package:app_coures/models/activity_model.dart';
// import 'package:flutter/material.dart';
// // import 'package:app_test/controllers/activity_controller.dart';
// // import 'package:app_test/models/activity_model.dart';

// class ActivityScreen extends StatefulWidget {
//   @override
//   _ActivityScreenState createState() => _ActivityScreenState();
// }

// class _ActivityScreenState extends State<ActivityScreen> {
//   final ActivityController _activityController = ActivityController();
//   late Future<List<Activity>> _activities;

//   @override
//   void initState() {
//     super.initState();
//     _activities = _activityController.fetchActivities();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Activity')),
//       body: FutureBuilder<List<Activity>>(
//         future: _activities,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return Center(child: Text('No activities found'));
//           } else {
//             return ListView.builder(
//               itemCount: snapshot.data!.length,
//               itemBuilder: (context, index) {
//                 final activity = snapshot.data![index];
//                 return ListTile(
//                   title: Text(activity.title),
//                   subtitle: Text(activity.description),
//                 );
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:app_coures/controllers/activity_controller.dart';
import 'package:app_coures/models/activity_model.dart';

class ActivityScreen extends StatefulWidget {
  @override
  _ActivityScreenState createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  final ActivityController _activityController = ActivityController();
  late Future<List<Activity>> _activities;
  @override
  void initState() {
    super.initState();
    _activities = _activityController.fetchActivities();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Activity')),
      body: FutureBuilder<List<Activity>>(
        future: _activities,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No activities found'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final activity = snapshot.data![index];
                return ActivityCard(activity: activity);
              },
            );
          }
        },
      ),
    );
  }
}

class ActivityCard extends StatelessWidget {
  final Activity activity;

  const ActivityCard({Key? key, required this.activity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.green[100], // Light green background
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.recycling, color: Colors.grey[700]), // Recycling icon
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      activity.title,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4),
                    
                  ],
                ),
              ],
            ),
            
          ],
        ),
      ),
    );
  }
}
