import 'package:czmtr_mobile_app/navigation/FancyNavBar.dart';
import 'package:czmtr_mobile_app/navigation/bloc/navigation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/theme/app_theme.dart';
import 'package:czmtr_mobile_app/pages/onboardingScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NavigationBloc>(
      create: (_) => NavigationBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'CzmTR',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
        home: const OnboardingScreen(),
      ),
    );
  }
}





