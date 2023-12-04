import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flikcar/screens/buy_car_flow/provider/buy_car_provider.dart';
import 'package:flikcar/screens/dealers_flow/auction_screens/firebase_auction_car_detail_screen/widgets/dealer_car_image_viewer/widgets/dealer_image_list.dart';
import 'package:flikcar/screens/dealers_flow/dealer_sell_car_screen/dealer_listing_screen/dealer_listing_screen.dart';
import 'package:flikcar/screens/dealers_flow/dealer_sell_car_screen/dealer_listing_screen/listing_car_images/listing_car_images.dart';
import 'package:flikcar/screens/dealers_flow/dealer_sell_car_screen/dealer_sell_car_screen.dart';
import 'package:flikcar/screens/home_screen/provider/check_internet_provider.dart';
import 'package:flikcar/screens/onbording_screens/dealer_onboarding/upload_documents/upload_dealer_documents.dart';
import 'package:flikcar/screens/onbording_screens/phone_number/phone_number.dart';
import 'package:flikcar/screens/sell_car_flow/selling_process/provider/evaluation_provider.dart';
import 'package:flikcar/screens/sell_car_flow/selling_process/provider/selling_process_provider.dart';
import 'package:flikcar/screens/start_screen/start_screen.dart';
import 'package:flikcar/services/auction_services.dart';
import 'package:flikcar/services/auth_service.dart';
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
import 'package:upgrader/upgrader.dart';

import 'screens/onbording_screens/dealer_onboarding/dealer_details.dart';
import 'services/firebase_auth_service/firebase_auth_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  // FacebookAppEvents();
  FirebaseAuth firebase = FirebaseAuth.instance;

//  FacebookEvents();
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
        //  ChangeNotifierProvider(create: (context) => AuctionService()),
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
          child: firebase.currentUser != null ? StartScreen() : PhoneNumber(),
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

//keytool -genkey -v -keystore %userprofile%\upload-keystore.jks -storetype JKS -keyalg RSA -keysize 2048 -validity 10000 -alias upload
// Your Android App Bundle is signed with the wrong key. Ensure that your App Bundle is signed with the correct signing key and try again. Your app bundle is expected to be signed with the certificate with fingerprint:
// SHA1: 18:80:B7:7C:C0:C4:5A:59:E2:E1:AB:45:E0:50:23:C0:D7:B6:0D:BD
// but the certificate used to sign the app bundle that you uploaded has fingerprint:
// SHA1: 9B:A6:90:C1:5F:3B:5B:A0:86:BD:FA:14:FD:24:23:2C:68:AF:EF:DE