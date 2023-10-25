// import 'package:firebase_analytics/firebase_analytics.dart';

// class FirebaseEvents {
//   final FirebaseAnalytics analytics = FirebaseAnalytics.instance;
//   customerPortalEvent() {
//     analytics.logEvent(
//       name: 'customer_portal',
//       parameters: {'start_screen': 'customer'},
//     );
//   }

//   dealerPortalEvent() {
//     analytics.logEvent(
//       name: 'dealer_portal',
//       parameters: {'start_screen': 'dealer'},
//     );
//   }

//   customerCallDealer(
//       {required String customerPhone, required String dealerPhone}) {
//     analytics.logEvent(
//       name: 'customer_call_dealer',
//       parameters: {
//         'customer_phone_number': customerPhone,
//         'dealer_phone_number': dealerPhone,
//       },
//     );
//   }

//   dealerCallCustomer(
//       {required String customerPhone, required String dealerPhone}) {
//     analytics.logEvent(
//       name: 'dealer_call_dealer',
//       parameters: {
//         'customer_phone_number': customerPhone,
//         'dealer_phone_number': dealerPhone,
//       },
//     );
//   }

//   contactSupport({required String customerPhone}) {
//     analytics.logEvent(
//       name: 'contact_support',
//       parameters: {
//         'phone_number': customerPhone,
//       },
//     );
//   }

//   customerConfirmTestdrive({required String customerPhone}) {
//     analytics.logEvent(
//       name: 'customer_confirm_testdrive',
//       parameters: {
//         'customer_phone_number': customerPhone,
//       },
//     );
//   }

//   dealerUploadCar({required String dealerNumber}) {
//     analytics.logEvent(
//       name: 'dealer_car_upload_comfirmation',
//       parameters: {
//         'dealer_phone_number': dealerNumber,
//       },
//     );
//   }

//   customerCarSellRequest({required String customerNumber}) {
//     analytics.logEvent(
//       name: 'customer_sell_request_confirmation',
//       parameters: {
//         'customer_phone_number': customerNumber,
//       },
//     );
//     print("ddddddd");
//   }

//   addToWishlistEvent({required String customerNumber, required String carId}) {
//     analytics.logEvent(
//       name: 'customer_add_to_wishlist',
//       parameters: {
//         'customer_phone_number': customerNumber,
//         'car_id': carId,
//       },
//     );
//   }
// }
