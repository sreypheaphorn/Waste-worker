import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import '../models/schedule_pickup.dart'; // Import your PickupRequest model

class PickupController {
  final String apiUrl = 'https://yourbackend.com/api/schedule-pickup';

  Future<void> schedulePickup(PickupRequest request) async {
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: json.encode(request.toJson()),
      );

      if (response.statusCode == 200) {
        Fluttertoast.showToast(
          msg: request.isRecurring
              ? "Recurring Pickup Scheduled for ${request.pickupDate.toString().substring(0, 10)} at ${request.pickupTime}"
              : "One-time Pickup Scheduled for ${request.pickupDate.toString().substring(0, 10)} at ${request.pickupTime}",
          fontSize: 18,
        );
      } else {
        Fluttertoast.showToast(
          msg: "Failed to schedule pickup. Please try again.",
          fontSize: 18,
        );
      }
    } catch (error) {
      Fluttertoast.showToast(
        msg: "An error occurred. Please try again later.",
        fontSize: 18,
      );
    }
  }
}
