import 'dart:io';

import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flikcar/screens/buy_car_flow/provider/buy_car_provider.dart';
import 'package:flikcar/screens/home_screen/provider/check_internet_provider.dart';
import 'package:flikcar/screens/onbording_screens/dealer_onboarding/upload_documents/upload_dealer_documents.dart';
import 'package:flikcar/screens/onbording_screens/phone_number/phone_number.dart';
import 'package:flikcar/screens/sell_car_flow/selling_process/provider/evaluation_provider.dart';
import 'package:flikcar/screens/sell_car_flow/selling_process/provider/selling_process_provider.dart';
import 'package:flikcar/screens/start_screen/start_screen.dart';
import 'package:flikcar/services/dealer_upload_car.dart';
import 'package:flikcar/services/facebook_events.dart';
import 'package:flikcar/services/firebase_auction_service/firebase_auction_service.dart';
import 'package:flikcar/services/firebase_auth_service/firebase_auth_service.dart';
import 'package:flikcar/services/get_car_details.dart';
import 'package:flikcar/services/get_dealer_uploaded_car.dart';
import 'package:flikcar/services/upload_dealer_documents_provider.dart';
import 'package:flikcar/services/search_service.dart';
import 'package:flikcar/services/wishlist_service.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:upgrader/upgrader.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  // FacebookAppEvents();
  //FirebaseAuthService().startListeningToStatus();
  await FirebaseAppCheck.instance.activate(
      androidProvider: AndroidProvider.playIntegrity,
      appleProvider: AppleProvider.debug);
  FirebaseAuth firebase = FirebaseAuth.instance;

  await Hive.initFlutter();

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


//keytool -genkey -v -keystore %userprofile%\upload-keystore.jks -storetype JKS -keyalg RSA -keysize 2048 -validity 10000 -alias upload
// Your Android App Bundle is signed with the wrong key. Ensure that your App Bundle is signed with the correct signing key and try again. Your app bundle is expected to be signed with the certificate with fingerprint:
// but the certificate used to sign the app bundle that you uploaded has fingerprint:
// Variant: debug
// Config: debug
// Store: C:\Users\M123\.android\debug.keystore
// Alias: AndroidDebugKey
// MD5: 1B:99:94:29:12:E7:41:2E:84:CA:D9:FF:F1:20:50:73
// SHA1: 5C:E7:F2:4A:B3:16:27:7B:84:B5:9F:B5:99:BC:E8:00:90:77:23:71
// SHA-256: 69:F6:41:BA:58:5F:54:19:8D:E4:7C:67:9F:AF:D9:09:79:D2:24:D1:F1:6E:A1:CF:1E:AB:19:54:BC:AF:FA:CC
// Valid until: Wednesday, May 7, 2053
// ----------
// Variant: release
// Config: release
// Store: C:\Users\M123\Projects\Flikcar\android\app\upload-keystore.jks
// Alias: upload
// MD5: EC:7B:25:25:E3:A9:59:F9:71:FD:23:35:C7:D1:86:AD
// SHA1: 18:80:B7:7C:C0:C4:5A:59:E2:E1:AB:45:E0:50:23:C0:D7:B6:0D:BD
// SHA-256: B5:0C:EB:34:4D:92:D8:FC:45:E9:67:39:DE:8A:50:66:E2:65:72:D4:D3:0B:9B:06:ED:BC:EA:CD:61:0A:CA:07
// Valid until: Friday, December 16, 2050