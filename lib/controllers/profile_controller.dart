import 'package:app_coures/models/activity_model.dart';
import 'package:app_coures/models/user_model.dart';
import 'package:app_coures/services/api_service.dart';
// import 'package:app_test/models/activity_model.dart';
// import 'package:app_test/services/api_service.dart';

class ProfileController {
  final ApiService _apiService = ApiService();

  Future<List<User>> fetchProfile() {
    return _apiService.fetchProfile();
  }
}