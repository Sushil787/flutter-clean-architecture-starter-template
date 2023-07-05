import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:traffic/core/dio/dio_client.dart';
import 'package:traffic/core/theme/theme_cubit.dart';
import 'package:traffic/core/utils/snackbar.dart';
import 'package:traffic/di/di_setup.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
