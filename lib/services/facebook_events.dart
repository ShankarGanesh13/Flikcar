import 'package:facebook_app_events/facebook_app_events.dart';

class FacebookEvents {
  final FacebookAppEvents facebookAppEvents = FacebookAppEvents();

  customerPortalEvent() {
    facebookAppEvents.logEvent(
      name: 'customer_portal',
      parameters: {'start_screen': 'customer'},
    );
  }

  dealerPortalEvent() {
    facebookAppEvents.logEvent(
      name: 'dealer_portal',
      parameters: {'start_screen': 'dealer'},
    );
    print("mmbu");
  }

  customerCallDealer(
      {required String customerPhone, required String dealerPhone}) {
    facebookAppEvents.logEvent(
      name: 'customer_call_dealer',
      parameters: {
        'customer_phone_number': customerPhone,
        'dealer_phone_number': dealerPhone,
      },
    );
  }

  dealerCallCustomer(
      {required String customerPhone, required String dealerPhone}) {
    facebookAppEvents.logEvent(
      name: 'dealer_call_dealer',
      parameters: {
        'customer_phone_number': customerPhone,
        'dealer_phone_number': dealerPhone,
      },
    );
  }

  contactSupport({required String customerPhone}) {
    facebookAppEvents.logEvent(
      name: 'contact_support',
      parameters: {
        'phone_number': customerPhone,
      },
    );
  }

  customerConfirmTestdrive({required String customerPhone}) {
    facebookAppEvents.logEvent(
      name: 'customer_confirm_testdrive',
      parameters: {
        'customer_phone_number': customerPhone,
      },
    );
  }

  dealerUploadCar({required String dealerNumber}) {
    facebookAppEvents.logEvent(
      name: 'dealer_car_upload_comfirmation',
      parameters: {
        'dealer_phone_number': dealerNumber,
      },
    );
  }

  customerCarSellRequest({required String customerNumber}) {
    facebookAppEvents.logEvent(
      name: 'customer_sell_request_confirmation',
      parameters: {
        'customer_phone_number': customerNumber,
      },
    );
    print("ddddddd");
  }
}
