import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starter/core/theme/theme_cubit.dart';

///
class HomePage extends StatelessWidget {
  ///
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.read<ThemeCubit>().toggleTheme();
          },
          child: const Text('Press me'),
        ),
      ),
    );
  }
}
