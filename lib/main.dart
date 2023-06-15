import 'package:flikcar/screens/account/test_drive/test_drive.dart';
import 'package:flikcar/screens/buy_car_flow/compare_screen/compare_screen.dart';
import 'package:flikcar/screens/buy_car_flow/filter_applied/filter_applied.dart';
import 'package:flikcar/screens/buy_car_flow/filter_screen/filter_screen.dart';
import 'package:flikcar/screens/buy_car_flow/provider/buy_car_provider.dart';
import 'package:flikcar/screens/dealers_flow/dealer_home_screen/dealer_home_screen.dart';
import 'package:flikcar/screens/home_screen/home_screen.dart';
import 'package:flikcar/screens/home_screen/provider/check_internet_provider.dart';
import 'package:flikcar/screens/onbording_screens/dealer_onboarding/dealer_details.dart';
import 'package:flikcar/screens/onbording_screens/dealer_onboarding/upload_documents/upload_dealer_documents.dart';
import 'package:flikcar/screens/onbording_screens/phone_number/phone_number.dart';
import 'package:flikcar/screens/sell_car_flow/selling_process/provider/evaluation_provider.dart';
import 'package:flikcar/screens/sell_car_flow/selling_process/provider/selling_process_provider.dart';
import 'package:flikcar/screens/start_screen/start_screen.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SellingProcessProvider()),
        ChangeNotifierProvider(create: (context) => EvaluationProvider()),
        ChangeNotifierProvider(create: (context) => BuyCarProvider()),
        ChangeNotifierProvider(create: (context) => CheckInternetProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.s1),
          useMaterial3: true,
        ),
        home: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    print("app is running build context");
    return FutureBuilder<bool>(
        future: isLoggedIn(context),
        builder: (context, snapshot) {
          if (snapshot.data == true) {
            return const StartScreen();
          } else {
            return PhoneNumber();
          }
        });
  }

  Future<bool> isLoggedIn(context) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final bool? loggedIn = sp.getBool('isLoggedIn');
    Provider.of<CheckInternetProvider>(context, listen: false)
        .startStreaming(context);

    if (loggedIn == true) {
      return true;
    } else {
      return false;
    }
  }
}
