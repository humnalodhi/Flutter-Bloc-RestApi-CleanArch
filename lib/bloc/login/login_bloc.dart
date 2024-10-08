import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:bloc_rest_api_clean_arch/repository/auth/login_repository.dart';
import 'package:bloc_rest_api_clean_arch/services/session_manager/session_controller.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginRepository loginRepository;

  LoginBloc({
    required this.loginRepository,
  }) : super(const LoginState()) {
    on<EmailChanged>(onEmailChanged);
    on<PasswordChanged>(onPasswordChanged);
    on<LoginAPI>(loginAPI);
  }

  void onEmailChanged(EmailChanged event, Emitter<LoginState> emit) {
    emit(
      state.copyWith(
        email: event.email,
      ),
    );
  }

  void onPasswordChanged(PasswordChanged event, Emitter<LoginState> emit) {
    emit(
      state.copyWith(
        password: event.password,
      ),
    );
  }

  Future<void> loginAPI(LoginAPI event, Emitter<LoginState> emit) async {
    Map data = {
      'email': state.email,
      'password': state.password,
    };
    emit(
      state.copyWith(
        loginStatus: LoginStatus.loading,
      ),
    );
    await loginRepository.loginAPI(data).then(
      (value) async {
        if (value.error.isNotEmpty) {
          emit(
            state.copyWith(
              message: value.error.toString(),
              loginStatus: LoginStatus.success,
            ),
          );
        } else {
          await SessionController().saveUserInPreference(value);
          await SessionController().getUserFromPreference();
          emit(
            state.copyWith(
              message: 'Login Successfully',
              loginStatus: LoginStatus.error,
            ),
          );
        }
      },
    ).onError(
      (error, stackTrace) {
        emit(
          state.copyWith(
            message: error.toString(),
            loginStatus: LoginStatus.error,
          ),
        );
      },
    );
  }
}
