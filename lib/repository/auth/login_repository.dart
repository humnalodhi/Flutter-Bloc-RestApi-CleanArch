import 'package:bloc_rest_api_clean_arch/model/user_model.dart';

abstract class LoginRepository {
  Future<UserModel> loginAPI(dynamic data);
}
