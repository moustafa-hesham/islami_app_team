import 'package:flutter/material.dart';
import 'package:islami_sun_c9/ui/screens/details_screen/details_screen.dart';
import 'package:islami_sun_c9/ui/screens/home/home_screen.dart';
import 'package:islami_sun_c9/ui/utils/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      routes: {
        HomeScreen.routeName:(_) => HomeScreen(),
        DetailsScreen.routeName: (_)=> DetailsScreen(),
      },
      initialRoute: HomeScreen.routeName,
    );
  }
}