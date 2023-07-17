import 'package:favorite_button/favorite_button.dart';
import 'package:flikcar/common_widgets/primary_button.dart';
import 'package:flikcar/models/buyer_car_model.dart';
import 'package:flikcar/screens/buy_car_flow/car_detailed_view/car_detailed_view.dart';
import 'package:flikcar/screens/buy_car_flow/schedule_test_drive/schedule_test_drive.dart';
import 'package:flikcar/services/wishlist_service.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WishlistCard extends StatelessWidget {
  final BuyerCar car;
  const WishlistCard({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    List<String> features = [
      car.fuel,
      "${car.driveKms}kms",
      "${car.registrationYear}",
      car.transmission
    ];
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => CarDetailedView(car: car)));
      },
      child: Container(
        margin: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
        height: 164,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.25),
              offset: Offset(1, 1),
              blurRadius: 20,
              spreadRadius: 0,
            ),
          ],
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2.4,
                    height: 104,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.network(
                        car.carImages.isEmpty
                            ? "https://developers.google.com/static/maps/documentation/maps-static/images/error-image-generic.png"
                            : "https://admin.flikcar.com/${car.carImages[0]}",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2.5,
                              child: Text(
                                car.model,
                                maxLines: 1,
                                style: AppFonts.w700black16,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                              width: 20,
                              child: FavoriteButton(
                                valueChanged: (bool) {
                                  print(bool);
                                  Provider.of<WishlistService>(context,
                                          listen: false)
                                      .removeFromWishlist(
                                          context: context, carId: car.id);
                                },
                                iconSize: 20,
                                isFavorite: true,
                              ),
                            )
                          ],
                        ),
                        Text(
                          car.brand,
                          style: AppFonts.w500dark214,
                        ),
                        const SizedBox(height: 5),
                        Wrap(
                          spacing: 6,
                          children: List.generate(
                            4,
                            (index) => Container(
                              padding: const EdgeInsets.only(
                                  left: 0, right: 0, top: 0, bottom: 0),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Text(
                                features[index],
                                style: AppFonts.w500black10,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "₹326000 ",
                          style: AppFonts.w700black20,
                        )
                      ],
                    ),
                  )
                ]),
            Padding(
              padding: const EdgeInsets.only(
                  top: 10.0, bottom: 8, left: 20, right: 20),
              child: PrimaryButton(
                  title: "Contact Dealer",
                  function: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ScheduleTestDrive(
                            car: car,
                          ),
                        ));
                  },
                  borderColor: Colors.transparent,
                  backgroundColor: AppColors.p2,
                  textStyle: AppFonts.w500white14),
            )
          ],
        ),
      ),
    );
  }
}
