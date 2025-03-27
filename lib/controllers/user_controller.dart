import 'package:app_coures/bloc/user_bloc.dart';
import 'package:app_coures/models/user_model.dart';
import 'package:app_coures/services/api_service.dart';
// import 'package:app_test/bloc/user_bloc.dart';
// import 'package:app_test/models/user_model.dart';
// import 'package:app_test/services/api_service.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

class UserController {
  final ApiService _apiService = ApiService();

  Future<User?> login(String username, String password, [UserBloc? userBloc]) async { // Made UserBloc optional
    final user = await _apiService.login(username, password);
    if (user != null && userBloc != null) { // Null check for userBloc
      userBloc.add(SetUserEvent(user)); // Dispatch user event to bloc
    }
    return user;
  }
  Future<bool> register(String email, String profileImageUrl, String username, String password) async {
    final user = User(
      email: email,
      profileImageUrl: profileImageUrl,
      userName: username,
      password: password,
    );
    return await _apiService.register(user);
  }
}
