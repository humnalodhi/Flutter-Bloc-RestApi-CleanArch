import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:bloc_rest_api_clean_arch/data/exceptions/app_exceptions.dart';
import 'package:bloc_rest_api_clean_arch/data/network/base_api_services.dart';
import 'package:http/http.dart' as http;

class NetworkServicesApi implements BaseApiServices {
  @override
  Future<dynamic> getAPI(String url) async {
    try {
      final response = await http.get(Uri.parse(url)).timeout(
            const Duration(
              seconds: 50,
            ),
          );
      if (response.statusCode == 200) {}
    } on SocketException {
      throw NoInternetException('');
    } on TimeoutException {
      return FetchDataException('Time out, Try again!');
    }
  }

  @override
  Future<dynamic> postAPI(String url, data) {
    // TODO: implement postAPI
    throw UnimplementedError();
  }

  dynamic returnResponse(http.Response response) {
    switch (response) {
      case 200:
        dynamic jsonResponse = jsonDecode(response.body);
        return jsonResponse;
      case 400:
        dynamic jsonResponse = jsonDecode(response.body);
        return jsonResponse;
      case 401:
        throw UnAuthorizedException();
      case 500:
        throw FetchDataException(
          'Error communicating with server ${response.statusCode}',
        );
    }
  }
}
