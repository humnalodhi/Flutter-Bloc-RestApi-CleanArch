import 'package:bloc_rest_api_clean_arch/model/user_model.dart';

import 'login_repository.dart';

class LoginMockApiRepository implements LoginRepository {
  @override
  Future<UserModel> loginAPI(dynamic data) async {
    await Future.delayed(
      const Duration(
        seconds: 2,
      ),
    );

    final response = {'token': 'sdf23eaxkj23'};
    return UserModel.fromJson(response);
  }
}
