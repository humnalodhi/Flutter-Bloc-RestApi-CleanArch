import 'package:bloc_rest_api_clean_arch/config/app_urls.dart';
import 'package:bloc_rest_api_clean_arch/data/network/network_services_api.dart';
import 'package:bloc_rest_api_clean_arch/model/user_model.dart';
import 'package:bloc_rest_api_clean_arch/repository/auth/login_repository.dart';

class LoginHttpApiRepository implements LoginRepository{
  final api = NetworkServicesApi();

  @override
  Future<UserModel> loginAPI(dynamic data) async {
    final response = await api.postAPI(
      AppUrls.loginApi,
      data,
    );
    return UserModel.fromJson(response);
  }
}
