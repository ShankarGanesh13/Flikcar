import 'package:flikcar/firebase_models/firebase_car_owner.dart';
import 'package:flikcar/firebase_models/firebase_car_properties.dart';
import 'package:flikcar/models/image_model.dart';

class FirebaseOcbCar {
  String id;
  FirebaseAuctionCarProperties properties;
  List<FirebaseImageModel> imageModel;
  String status; //AVAILABLE||SOLD_OUT
  FirebaseCarOwner? dealer;
  int carPrice;

  FirebaseOcbCar({
    required this.carPrice,
    required this.dealer,
    required this.id,
    required this.imageModel,
    required this.properties,
    required this.status,
  });
}
