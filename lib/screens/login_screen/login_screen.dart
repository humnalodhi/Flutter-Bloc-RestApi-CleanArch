import 'package:bloc_rest_api_clean_arch/bloc/login/login_bloc.dart';
import 'package:bloc_rest_api_clean_arch/config/routes/routes_names.dart';
import 'package:bloc_rest_api_clean_arch/main.dart';
import 'package:bloc_rest_api_clean_arch/utils/flush_bar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  final formKey = GlobalKey<FormState>();

  late LoginBloc loginBloc;

  @override
  void initState() {
    loginBloc = LoginBloc(
      loginRepository: getIt(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: BlocProvider(
        create: (_) => loginBloc,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocBuilder<LoginBloc, LoginState>(
                  buildWhen: (current, previous) =>
                      current.email != previous.email,
                  builder: (context, state) {
                    return TextFormField(
                      focusNode: emailFocusNode,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        hintText: 'Email',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        context.read<LoginBloc>().add(
                              EmailChanged(
                                email: value,
                              ),
                            );
                      },
                      validator: (value) {
                        bool emailValid = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                        ).hasMatch(value!);
                        if (value.isEmpty) {
                          return 'Enter email';
                        } else if (!emailValid) {
                          return 'Email is not correct';
                        }
                        return null;
                      },
                      onFieldSubmitted: (value) {},
                    );
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                BlocBuilder<LoginBloc, LoginState>(
                  buildWhen: (current, previous) =>
                      current.password != previous.password,
                  builder: (context, state) {
                    return TextFormField(
                      focusNode: passwordFocusNode,
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: 'Password',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        context.read<LoginBloc>().add(
                              PasswordChanged(
                                password: value,
                              ),
                            );
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter Password';
                        } else if (value.length < 6) {
                          return 'Please enter password greater than 6 characters.';
                        }
                        return null;
                      },
                      onFieldSubmitted: (value) {},
                    );
                  },
                ),
                const SizedBox(
                  height: 50,
                ),
                BlocListener<LoginBloc, LoginState>(
                  listenWhen: (current, previous) =>
                      current.loginStatus != previous.loginStatus,
                  listener: (context, state) {
                    if (state.loginStatus == LoginStatus.error) {
                      FlushBarHelper.flushBarErrorMessage(
                        state.message.toString(),
                        context,
                      );
                    }

                    if (state.loginStatus == LoginStatus.success) {
                      Navigator.pushNamed(
                        context,
                        RoutesNames.homeScreen,
                      );
                      // FlushBarHelper.flushBarSuccessMessage(
                      //   'Login Successfully',
                      //   context,
                      // );
                    }
                  },
                  child: BlocBuilder<LoginBloc, LoginState>(
                    buildWhen: (current, previous) =>
                        current.loginStatus != previous.loginStatus,
                    builder: (context, state) {
                      return ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            context.read<LoginBloc>().add(LoginAPI());
                          }
                        },
                        child: state.loginStatus == LoginStatus.loading
                            ? const CircularProgressIndicator()
                            : const Text('Login'),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
