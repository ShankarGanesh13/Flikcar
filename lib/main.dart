import 'package:flikcar/screens/buy_car_flow/provider/buy_car_provider.dart';

import 'package:flikcar/screens/home_screen/provider/check_internet_provider.dart';

import 'package:flikcar/screens/sell_car_flow/selling_process/provider/evaluation_provider.dart';
import 'package:flikcar/screens/sell_car_flow/selling_process/provider/selling_process_provider.dart';
import 'package:flikcar/screens/start_screen/start_screen.dart';
import 'package:flikcar/services/auction_services.dart';
import 'package:flikcar/services/dealer_upload_car.dart';
import 'package:flikcar/services/facebook_events.dart';
import 'package:flikcar/services/get_car_details.dart';
import 'package:flikcar/services/get_dealer_uploaded_car.dart';
import 'package:flikcar/services/upload_dealer_documents_provider.dart';
import 'package:flikcar/services/search_service.dart';
import 'package:flikcar/services/wishlist_service.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:facebook_app_events/facebook_app_events.dart';
import 'package:upgrader/upgrader.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FacebookAppEvents();

  await Firebase.initializeApp();
  FacebookEvents();
  GetCarDetails();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SellingProcessProvider()),
        ChangeNotifierProvider(create: (context) => DealerUploadCar()),
        ChangeNotifierProvider(create: (context) => EvaluationProvider()),
        ChangeNotifierProvider(create: (context) => BuyCarProvider()),
        ChangeNotifierProvider(create: (context) => CheckInternetProvider()),
        ChangeNotifierProvider(create: (context) => WishlistService()),
        ChangeNotifierProvider(create: (context) => GetCarDetails()),
        ChangeNotifierProvider(create: (context) => SearchService()),
        ChangeNotifierProvider(create: (context) => AuctionService()),
        ChangeNotifierProvider(create: (context) => GetDealerUploadCars()),
        ChangeNotifierProvider(
            create: (context) => UploadDealerDocumentsProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.s1),
          useMaterial3: true,
        ),
        home: UpgradeAlert(
          upgrader: Upgrader(dialogStyle: UpgradeDialogStyle.material),
          child: StartScreen(),
        ),
      ),
    ),
  );
  await Future.delayed((const Duration(seconds: 2)));
  FlutterNativeSplash.remove();
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }

  // Future<bool> isLoggedIn(context) async {
  //   final SharedPreferences sp = await SharedPreferences.getInstance();
  //   final bool? loggedIn = sp.getBool('isLoggedIn');
  //   Provider.of<CheckInternetProvider>(context, listen: false)
  //       .startStreaming(context);

  //   if (loggedIn == true) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }
}
//keytool -genkey -v -keystore %userprofile%\upload-keystore.jks -storetype JKS -keyalg RSA -keysize 2048 -validity 10000 -alias upload