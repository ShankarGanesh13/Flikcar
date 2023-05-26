import 'package:flikcar/screens/home_screen/home_screen.dart';
import 'package:flikcar/screens/onbording_screens/phone_number/phone_number.dart';
import 'package:flikcar/screens/sell_car_flow/sell_home_screen/sell_car_home_screen.dart';
import 'package:flikcar/screens/sell_car_flow/selling_process/book_evaluation/book_evaluation.dart';
import 'package:flikcar/screens/sell_car_flow/selling_process/cancel_reason/cancel_reason.dart';
import 'package:flikcar/screens/sell_car_flow/selling_process/cancelled_screen/cancelled_screen.dart';
import 'package:flikcar/screens/sell_car_flow/selling_process/inspection_scheduled/inspection_scheduled.dart';
import 'package:flikcar/screens/sell_car_flow/selling_process/provider/evaluation_provider.dart';
import 'package:flikcar/screens/sell_car_flow/selling_process/provider/selling_process_provider.dart';
import 'package:flikcar/screens/sell_car_flow/selling_process/selling_process.dart';
import 'package:flikcar/screens/sell_car_flow/selling_process/splash_screen.dart/splash_screen.dart';
import 'package:flikcar/screens/start_screen/start_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SellingProcessProvider()),
        ChangeNotifierProvider(create: (context) => EvaluationProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print("app is running build context");
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}
