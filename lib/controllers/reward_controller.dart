import 'package:app_coures/models/reward_model.dart';
import 'package:app_coures/services/api_service.dart';
class RewardOptionController {
  final ApiService _apiService = ApiService();
  Future<List<RewardOption>> fetchRewardOptions() {
    return _apiService.fetchRewardOptions();
  }
}
