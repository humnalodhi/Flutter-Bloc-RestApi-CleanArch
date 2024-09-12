import 'package:bloc_rest_api_clean_arch/utils/enums.dart';

class ApiResponse<T> {
  Status? status;
  T? data;
  String? message;

  ApiResponse(
    this.status,
    this.message,
    this.data,
  );

  ApiResponse.loading() : status = Status.loading;

  ApiResponse.completed(this.data) : status = Status.completed;

  ApiResponse.error(this.message) : status = Status.error;

  @override
  String toString() {
    return "Status: $status \n Message: $message \n Data: $data";
  }
}

ApiResponse<int> response = ApiResponse.error('error');
