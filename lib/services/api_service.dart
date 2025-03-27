// import 'dart:convert';
// import 'package:app_coures/models/activity_model.dart';
// import 'package:app_coures/models/points_model.dart';
// import 'package:app_coures/models/user_model.dart';
// import 'package:app_coures/services/storage_service.dart';
// import 'package:http/http.dart' as http;
// // import 'package:app_test/models/user_model.dart'; // Ensure this import exists
// // import 'package:app_test/models/activity_model.dart'; // Ensure this import exists
// // import 'package:app_test/services/storage_service.dart';

// class ApiService {
//   static const String baseUrl = 'https://pay1.jetdev.life';
//   final StorageService _storageService = StorageService();

//   Future<User?> login(String email, String password) async {
//     final response = await http.post(
//       Uri.parse('$baseUrl/api/account/login'),
//       body: jsonEncode({'username': email, 'password': password}),
//       headers: {'Content-Type': 'application/json'},
//     );
//     if (response.statusCode == 200) {
//       final user = User.fromJson(jsonDecode(response.body));
//       if (user.token != null) {
//         await _storageService.saveToken(user.token!); // Save token
//       }
//       return user;
//     }
//     return null;
//   }

//   Future<bool> register(User user) async {
//     final response = await http.post(
//       Uri.parse('$baseUrl/api/account/register'),
//       body: jsonEncode(user.toJson()), // Includes password in the payload
//       headers: {'Content-Type': 'application/json'},
//     );
//     return response.statusCode == 200;
//   }

//   Future<List<Activity>> fetchActivities({int limit = 20}) async {
//     // final token = await _storageService.getToken(); // Retrieve token
//     final token = "eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InNvcGhlYWtAZ21haWwuY29tIiwiZ2l2ZW5fbmFtZSI6InNvcGhlYWsiLCJzdWIiOiJhNjM0ZDBiMy02YzIzLTQ4ZGEtOTdhNy01ZTU4MTIxYzYyN2YiLCJpZCI6ImE2MzRkMGIzLTZjMjMtNDhkYS05N2E3LTVlNTgxMjFjNjI3ZiIsIm5iZiI6MTc0Mjg2MTgxNCwiZXhwIjoxNzQzNDY2NjE0LCJpYXQiOjE3NDI4NjE4MTQsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6NTI0NiIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NTI0NiJ9.9B2y1oUDaaWoOc3FsAvIOdTvYqwu1uNcrRuYifpLjVld4Xqq8tzQFCZWsoO1OI6oYadshv-CW6mLSDJ_qgDvKg";
//     if (token == null) {
//       throw Exception('Token not found');
//     }

//     final response = await http.get(
//       Uri.parse('$baseUrl/api/account/activity?limit=$limit'),
//       headers: {'Authorization': 'Bearer $token'}, // Use token
//     );

//     if (response.statusCode == 200) {
//       List<dynamic> data = jsonDecode(response.body);
//       return data.map((json) => Activity.fromJson(json)).toList();
//     }
//     return [];
//   }

// }

import 'dart:convert';
import 'package:app_coures/Screens/schedule_pickup.dart';
import 'package:app_coures/models/activity_model.dart';
import 'package:app_coures/models/history_model.dart';
import 'package:app_coures/models/points_model.dart';
import 'package:app_coures/models/reward_model.dart';
import 'package:app_coures/models/user_model.dart';
import 'package:app_coures/services/storage_service.dart';
import 'package:http/http.dart' as http;
import 'package:app_coures/models/schedule_pickup.dart';

class ApiService {
  static const String baseUrl = 'https://pay1.jetdev.life';
  final StorageService _storageService = StorageService();

  // Login method
  Future<User?> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/account/login'),
      body: jsonEncode({'username': email, 'password': password}),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      final user = User.fromJson(jsonDecode(response.body));
      if (user.token != null) {
        await _storageService.saveToken(user.token!); // Save token
      }
      return user;
    }
    return null;
  }

  // Register method
  Future<bool> register(User user) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/account/register'),
      body: jsonEncode(user.toJson()), // Includes password in the payload
      headers: {'Content-Type': 'application/json'},
    );
    return response.statusCode == 200;
  }

  // Fetch activities
  Future<List<Activity>> fetchActivities({int limit = 20}) async {
    try {
      final token = await _storageService.getToken(); // Retrieve token
      // final token =
      //     "eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InNvcGhlYWtAZ21haWwuY29tIiwiZ2l2ZW5fbmFtZSI6InNvcGhlYWsiLCJzdWIiOiJhNjM0ZDBiMy02YzIzLTQ4ZGEtOTdhNy01ZTU4MTIxYzYyN2YiLCJpZCI6ImE2MzRkMGIzLTZjMjMtNDhkYS05N2E3LTVlNTgxMjFjNjI3ZiIsIm5iZiI6MTc0Mjg2MTgxNCwiZXhwIjoxNzQzNDY2NjE0LCJpYXQiOjE3NDI4NjE4MTQsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6NTI0NiIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NTI0NiJ9.9B2y1oUDaaWoOc3FsAvIOdTvYqwu1uNcrRuYifpLjVld4Xqq8tzQFCZWsoO1OI6oYadshv-CW6mLSDJ_qgDvKg";

      if (token == null) {
        throw Exception('Token not found');
      }

      final response = await http.get(
        Uri.parse('$baseUrl/api/account/activity?limit=$limit'),
        headers: {'Authorization': 'Bearer $token'}, // Use token
      );

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        return data.map((json) => Activity.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load activities');
      }
    } catch (e) {
      print('Error fetching activities: $e');
      return [];
    }
  }

  // Fetch points
  Future<Points?> fetchPoints() async {
    try {
      final token = await _storageService.getToken(); // Retrieve token
      // final token =
      //     "eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InNvcGhlYWtAZ21haWwuY29tIiwiZ2l2ZW5fbmFtZSI6InNvcGhlYWsiLCJzdWIiOiJhNjM0ZDBiMy02YzIzLTQ4ZGEtOTdhNy01ZTU4MTIxYzYyN2YiLCJpZCI6ImE2MzRkMGIzLTZjMjMtNDhkYS05N2E3LTVlNTgxMjFjNjI3ZiIsIm5iZiI6MTc0Mjg2MTgxNCwiZXhwIjoxNzQzNDY2NjE0LCJpYXQiOjE3NDI4NjE4MTQsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6NTI0NiIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NTI0NiJ9.9B2y1oUDaaWoOc3FsAvIOdTvYqwu1uNcrRuYifpLjVld4Xqq8tzQFCZWsoO1OI6oYadshv-CW6mLSDJ_qgDvKg";
      if (token == null) {
        throw Exception('Token not found');
      }

      final response = await http.get(
        Uri.parse('$baseUrl/api/account/points'),
        headers: {'Authorization': 'Bearer $token'},
      );
      if (response.statusCode == 200) {
        return Points.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load points');
      }
    } catch (e) {
      print('Error fetching points: $e');
      return null;
    }
  }

  Future<void> cancelPickup(int pickupId) async {
    final token = await _storageService.getToken(); // Retrieve token
    if (token == null) {
      throw Exception('Token not found');
    }

    final response = await http.delete(
      Uri.parse('$baseUrl/api/pickup/cancel/$pickupId'),
      headers: {'Authorization': 'Bearer $token'}, // Use token
    );

    if (response.statusCode == 200) {
      print('Pickup successfully canceled');
    } else {
      throw Exception('Failed to cancel pickup: ${response.body}');
    }
  }

  Future<List<User>> fetchProfile() async {
    try {
      // Replace with actual token retrieval method
      final token =
          "eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InNvcGhlYWtAZ21haWwuY29tIiwiZ2l2ZW5fbmFtZSI6InNvcGhlYWsiLCJzdWIiOiJhNjM0ZDBiMy02YzIzLTQ4ZGEtOTdhNy01ZTU4MTIxYzYyN2YiLCJpZCI6ImE2MzRkMGIzLTZjMjMtNDhkYS05N2E3LTVlNTgxMjFjNjI3ZiIsIm5iZiI6MTc0Mjg2MTgxNCwiZXhwIjoxNzQzNDY2NjE0LCJpYXQiOjE3NDI4NjE4MTQsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6NTI0NiIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NTI0NiJ9.9B2y1oUDaaWoOc3FsAvIOdTvYqwu1uNcrRuYifpLjVld4Xqq8tzQFCZWsoO1OI6oYadshv-CW6mLSDJ_qgDvKg";

      if (token.isEmpty) {
        throw Exception('Token not found');
      }

      final response = await http.get(
        Uri.parse(
          '$baseUrl/api/account/user',
        ), // Updated endpoint for user profile
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        print("------------ ${jsonResponse}");

        if (jsonResponse is List) {
          // Response is a list of users
          return jsonResponse.map((json) => User.fromJson(json)).toList();
        } else if (jsonResponse is Map<String, dynamic>) {
          // Response is a single user object
          return [User.fromJson(jsonResponse)];
        } else {
          throw Exception('Unexpected data format received');
        }
      } else {
        throw Exception('Failed to load users: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching profile: $e');
      return [];
    }
  }

  Future<List<RewardOption>> fetchRewardOptions() async {
    try {
      final token =
          "eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InNvcGhlYWtAZ21haWwuY29tIiwiZ2l2ZW5fbmFtZSI6InNvcGhlYWsiLCJzdWIiOiJhNjM0ZDBiMy02YzIzLTQ4ZGEtOTdhNy01ZTU4MTIxYzYyN2YiLCJpZCI6ImE2MzRkMGIzLTZjMjMtNDhkYS05N2E3LTVlNTgxMjFjNjI3ZiIsIm5iZiI6MTc0MzA0NzIxMSwiZXhwIjoxNzQzNjUyMDExLCJpYXQiOjE3NDMwNDcyMTEsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6NTI0NiIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NTI0NiJ9.KrwUWT2Aw56skuxzx79WOZKDPpKwvpCDm6Cu_2u_NIG2yaCVUm6m-BuCjrzkMdV6H_zwlQ4mO9vOwkYAwFuI8A"; // Replace with actual token retrieval method

      if (token.isEmpty) {
        throw Exception('Token not found');
      }

      final response = await http.get(
        Uri.parse(
          '$baseUrl/api/reward/listReward',
        ), // Update with correct API endpoint
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        print("API Response: $jsonResponse");

        if (jsonResponse is List) {
          return jsonResponse
              .map((json) => RewardOption.fromJson(json))
              .toList();
        } else {
          throw Exception('Unexpected data format received');
        }
      } else {
        throw Exception(
          'Failed to load reward options: ${response.statusCode}',
        );
      }
    } catch (e) {
      print('Error fetching reward options: $e');
      return [];
    }
  }
  Future<List<Pickup>> fetchPickups() async {
    try {
final token =
          "eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InNvcGhlYWtAZ21haWwuY29tIiwiZ2l2ZW5fbmFtZSI6InNvcGhlYWsiLCJzdWIiOiJhNjM0ZDBiMy02YzIzLTQ4ZGEtOTdhNy01ZTU4MTIxYzYyN2YiLCJpZCI6ImE2MzRkMGIzLTZjMjMtNDhkYS05N2E3LTVlNTgxMjFjNjI3ZiIsIm5iZiI6MTc0MzA0NzIxMSwiZXhwIjoxNzQzNjUyMDExLCJpYXQiOjE3NDMwNDcyMTEsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6NTI0NiIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NTI0NiJ9.KrwUWT2Aw56skuxzx79WOZKDPpKwvpCDm6Cu_2u_NIG2yaCVUm6m-BuCjrzkMdV6H_zwlQ4mO9vOwkYAwFuI8A"; // Replace with actual token retrieval method

      if (token.isEmpty) {
        throw Exception('Token not found');
      }

      final response = await http.get(
        Uri.parse('$baseUrl/api/pickup/history'), // Update with correct API endpoint
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        print("API Response: $jsonResponse");

        if (jsonResponse is List) {
          return jsonResponse.map((json) => Pickup.fromJson(json)).toList();
        } else {
          throw Exception('Unexpected data format received');
        }
      } else {
        throw Exception('Failed to load pickups: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching pickups: $e');
      return [];
    }
  }
}
 Future<void> addPickup(PickupRequest pickup) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/api/pickup/schedule'), // API endpoint for posting data
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer YOUR_API_TOKEN', // Replace with your actual API token
        },
        body: json.encode(pickup.toJson()), // Convert the SchedulePickup model to JSON
      );

      // Check if the response was successful
      if (response.statusCode == 200) {
        print("Pickup scheduled successfully");
      } else {
        // Handle response error
        print("Failed to schedule pickup: ${response.statusCode}");
      }
    } catch (e) {
      print('Error during HTTP request: $e'); // Handle network or other errors
    }
  }
}
