import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flikcar/models/buyer_car_model.dart';
import 'package:flikcar/screens/account/account_screen.dart';
import 'package:flikcar/screens/account/test_drive/test_drive.dart';
import 'package:flikcar/screens/buy_car_flow/car_detailed_view/car_specifications/car_specifications.dart';
import 'package:flikcar/screens/buy_car_flow/car_detailed_view/widgets/specifications.dart';
import 'package:flikcar/screens/buy_car_flow/compare_screen/compare_screen.dart';
import 'package:flikcar/screens/buy_car_flow/filter_applied/filter_applied.dart';
import 'package:flikcar/screens/buy_car_flow/filter_screen/filter_screen.dart';
import 'package:flikcar/screens/buy_car_flow/provider/buy_car_provider.dart';
import 'package:flikcar/screens/dealers_flow/auction_screens/dealer_car_detail_screen/detail_car_detail_screen.dart';
import 'package:flikcar/screens/dealers_flow/auction_screens/dealer_car_list_screen/dealer_car_list_screen.dart';
import 'package:flikcar/screens/dealers_flow/dealer_flow.dart';
import 'package:flikcar/screens/dealers_flow/auction_screens/dealer_auction_home_screen/dealer_auction_home_screen.dart';
import 'package:flikcar/screens/dealers_flow/dealer_sell_car_screen/dealer_listing_screen/dealer_listing_screen.dart';
import 'package:flikcar/screens/dealers_flow/dealer_sell_car_screen/dealer_listing_screen/listing_car_specification/listing_car_specification.dart';
import 'package:flikcar/screens/dealers_flow/dealer_sell_car_screen/dealer_listing_screen/widgets/brand_model_varient.dart';
import 'package:flikcar/screens/dealers_flow/dealer_sell_car_screen/dealer_sell_car_screen.dart';
import 'package:flikcar/screens/dealers_flow/my_schedule_screen/cancel_schedule/cancel_schedule.dart';
import 'package:flikcar/screens/dealers_flow/my_schedule_screen/reschedule_screen/reschedule_screen.dart';
import 'package:flikcar/screens/dealers_flow/provider/dealer_provider.dart';
import 'package:flikcar/screens/home_screen/home_screen.dart';
import 'package:flikcar/screens/home_screen/provider/check_internet_provider.dart';
import 'package:flikcar/screens/onbording_screens/dealer_onboarding/dealer_details.dart';
import 'package:flikcar/screens/onbording_screens/dealer_onboarding/upload_documents/upload_dealer_documents.dart';
import 'package:flikcar/screens/onbording_screens/otp_screen/otp_screen.dart';
import 'package:flikcar/screens/onbording_screens/phone_number/phone_number.dart';
import 'package:flikcar/screens/sell_car_flow/selling_process/provider/evaluation_provider.dart';
import 'package:flikcar/screens/sell_car_flow/selling_process/provider/selling_process_provider.dart';
import 'package:flikcar/screens/start_screen/start_screen.dart';
import 'package:flikcar/services/get_car_details.dart';
import 'package:flikcar/services/upload_dealer_documents_provider.dart';
import 'package:flikcar/services/search_service.dart';
import 'package:flikcar/services/wishlist_service.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';
import 'screens/dealers_flow/dealer_sell_car_screen/dealer_listing_screen/listing_car_features/listing_car_features.dart';
import 'screens/onbording_screens/dealer_onboarding/dealer_phone_number.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GetCarDetails();
  await FastCachedImageConfig.init(clearCacheAfter: const Duration(days: 15));

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SellingProcessProvider()),
        ChangeNotifierProvider(create: (context) => EvaluationProvider()),
        ChangeNotifierProvider(create: (context) => BuyCarProvider()),
        ChangeNotifierProvider(create: (context) => DealerProvider()),
        ChangeNotifierProvider(create: (context) => CheckInternetProvider()),
        ChangeNotifierProvider(create: (context) => WishlistService()),
        ChangeNotifierProvider(create: (context) => SearchService()),
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
        home: BrandModelVarientDropDown(),
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    GetCarDetails.saveCarDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("app is running build context");
    return const SizedBox();
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
//  Navigator.pushAndRemoveUntil(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => const CommonHomeScreen(),
//                     ),
//                     (route) => false,
//                   );



// FutureBuilder<bool>(
//         future: isLoggedIn(context),
//         builder: (context, snapshot) {
//           if (snapshot.data == true) {
//             return const StartScreen();
//           } else {
//             return PhoneNumber();
//           }
//         });