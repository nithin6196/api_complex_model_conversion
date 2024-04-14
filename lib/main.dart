import 'package:api_complex_model_conversion/controller/home_screen_controller.dart';
import 'package:api_complex_model_conversion/view/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeScreenController(),
      child: MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
