import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:starter/core/constants/app_route.dart';
import 'package:starter/core/utils/gap.dart';
import 'package:starter/core/utils/snackbar.dart';
import 'package:starter/core/widgets/custom_elevated_button.dart';
import 'package:starter/core/widgets/custom_textfield.dart';
import 'package:starter/features/auth/presentation/cubit/auth_cubit.dart';

/// Login Screen
class LoginScreen extends StatefulWidget {
  /// Constructor
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _username = '';
  String _password = '';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(
                hintText: 'username',
                onChanged: (value) {
                  _username = value;
                },
              ),
              VerticalGap.xxl,
              CustomTextField(
                hintText: 'password',
                onChanged: (value) {
                  _password = value;
                },
              ),
              VerticalGap.xxl,
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is AuthSuccessState) {
                    showSnackBar(context, ' Signin Successfully ');
                    context.goNamed(AppRoute.homeRoute);
                  }
                  if (state is AuthFaliureState) {
                    showSnackBar(context, state.message);
                  }
                },
                builder: (context, state) {
                  log(state.toString());
                  return CustomElevatedButton(
                    onButtonPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        await context.read<AuthCubit>().login(
                          {'username': _username, 'password': _password},
                        );
                      }
                    },
                    buttonText: 'login',
                    isLoading: state is AuthenticatingState,
                    // isLoading: state is AuthenticatingState ? true : false,
                  );
                },
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'register',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
