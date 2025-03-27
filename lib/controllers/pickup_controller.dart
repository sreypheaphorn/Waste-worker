import 'package:app_coures/models/history_model.dart';
import 'package:app_coures/services/api_service.dart';
class PickupController {
  final ApiService _apiService = ApiService();
  Future<List<Pickup>> fetchPickups() {
    return _apiService.fetchPickups();
  }
}
