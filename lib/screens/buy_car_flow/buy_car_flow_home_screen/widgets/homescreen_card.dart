import 'package:flikcar/common_widgets/heading1.dart';
import 'package:flikcar/common_widgets/loading_widget.dart';
import 'package:flikcar/common_widgets/primary_button.dart';
import 'package:flikcar/common_widgets/snackbar.dart';
import 'package:flikcar/models/buyer_car_display.dart';
import 'package:flikcar/models/buyer_car_model.dart';
import 'package:flikcar/screens/buy_car_flow/car_detailed_view/car_detailed_view.dart';
import 'package:flikcar/services/facebook_events.dart';
import 'package:flikcar/services/firebase_events.dart';
import 'package:flikcar/services/get_car_details.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreenCard extends StatefulWidget {
  final String title;
  final bool filterButton;
  final String filter;
  final List<String> filters;
  final List<BuyerCarDisplay> cars;
  final int selectedindex;

  const HomeScreenCard({
    super.key,
    required this.title,
    required this.filters,
    required this.cars,
    required this.selectedindex,
    required this.filter,
    required this.filterButton,
  });

  @override
  State<HomeScreenCard> createState() => _HomeScreenCardState();
}

class _HomeScreenCardState extends State<HomeScreenCard> {
  @override
  void initState() {
    loading();
    // TODO: implement initState
    super.initState();
  }

  bool _isLoading = true;

  loading() {
    Future.delayed(const Duration(seconds: 5), () {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 15,
          ),
          child: Heading1(title1: widget.title, title2: ''),
        ),
        const SizedBox(height: 12),
        widget.filterButton == true
            ? SizedBox(
                height: 30,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.filters.length,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      Provider.of<GetCarDetails>(context, listen: false)
                          .filterCars(
                              filterType: widget.filter,
                              filter: widget.filters[index],
                              index: index);
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => const FilterApplied()));
                      //  print(filters[index]);
                    },
                    child: Container(
                      margin: const EdgeInsets.only(left: 15),
                      padding: const EdgeInsets.only(
                          top: 5, bottom: 5, left: 10, right: 10),
                      decoration: BoxDecoration(
                          color: widget.selectedindex == index
                              ? AppColors.s1
                              : AppColors.p2,
                          borderRadius: BorderRadius.circular(4)),
                      child: Text(
                        widget.filters[index],
                        style: AppFonts.w500white14,
                      ),
                    ),
                  ),
                ),
              )
            : const SizedBox(),
        SizedBox(height: widget.filterButton == true ? 12 : 0),
        const SizedBox(
          height: 5,
        ),
        Container(
          padding: const EdgeInsets.only(bottom: 15),
          height: 350,
          child: widget.cars.isNotEmpty
              ? ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.cars.length > 8 ? 8 : widget.cars.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    List<String> features = [
                      widget.cars[index].fuelType,
                      "${widget.cars[index].driveKms} kms",
                      "${widget.cars[index].registerationYear}",
                      widget.cars[index].transmission,
                    ];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CarDetailedView(
                                car: Provider.of<GetCarDetails>(context,
                                        listen: false)
                                    .getCarById(
                                        id: widget.cars[index].id.toString()),
                              ),
                            ));
                      },
                      child: Container(
                        height: 361,
                        width: 268,
                        margin: const EdgeInsets.only(
                            right: 15, bottom: 20, top: 10, left: 15),
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.25),
                              offset: Offset(1, 1),
                              blurRadius: 12,
                              spreadRadius: 0,
                            ),
                          ],
                          color: const Color(0xffF2F2F2),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 170,
                              width: MediaQuery.of(context).size.width,
                              child: ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15),
                                  ),
                                  child: Image.network(
                                    widget.cars[index].images.isNotEmpty
                                        ? "https://webservice.flikcar.com/public/${widget.cars[index].images[0]}"
                                        : "https://developers.google.com/static/maps/documentation/maps-static/images/error-image-generic.png",
                                    fit: BoxFit.fill,
                                    loadingBuilder:
                                        (context, child, loadingProgress) {
                                      if (loadingProgress == null) {
                                        return child;
                                      } else {
                                        return const LoadingWidget();
                                      }
                                    },
                                  )),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10.0, right: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 160,
                                        child: Text(widget.cars[index].brand,
                                            maxLines: 1,
                                            style: AppFonts.w500dark214),
                                      ),
                                      const Spacer(),
                                      Text(
                                        "₹ ${widget.cars[index].price}",
                                        style: AppFonts.w700s140,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 170,
                                        child: Text(
                                            "${widget.cars[index].model} ${widget.cars[index].variant}",
                                            maxLines: 1,
                                            style: AppFonts.w700s140),
                                      ),
                                      const Spacer(),
                                    ],
                                  ),
                                  const SizedBox(height: 4),
                                  Wrap(
                                    spacing: 6,
                                    children: List.generate(
                                      4,
                                      (index) => Container(
                                        width: index == 0 ? 45 : null,
                                        padding: const EdgeInsets.only(
                                            left: 0,
                                            right: 5,
                                            top: 5,
                                            bottom: 0),
                                        decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: Text(
                                          features[index],
                                          style: AppFonts.w500black12,
                                          maxLines: 1,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10.0, right: 10),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 160,
                                    height: 35,
                                    child: PrimaryButton(
                                      title: "Contact Dealer",
                                      function: () async {
                                        FirebaseEvents().customerCallDealer(
                                            customerPhone: "customer",
                                            dealerPhone: widget
                                                .cars[index].dealer.phone!);
                                        FacebookEvents().customerCallDealer(
                                            customerPhone: "customer",
                                            dealerPhone: widget
                                                .cars[index].dealer.phone!);

                                        Uri phoneno = Uri(
                                          scheme: 'tel',
                                          path:
                                              '+91${widget.cars[index].dealer.phone}',
                                        );
                                        if (await launchUrl(phoneno)) {
                                        } else {
                                          if (context.mounted) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                                    MySnackbar.showSnackBar(
                                                        context,
                                                        "Unable to open dailer"));
                                          }
                                        }
                                      },
                                      borderColor: AppColors.s1,
                                      textStyle: AppFonts.w500s114,
                                      backgroundColor: Colors.white,
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    widget.cars[index].saleStatus,
                                    style: (widget.cars[index].saleStatus)
                                                .toLowerCase() ==
                                            "available"
                                        ? AppFonts.w500green12
                                        : AppFonts.w500red12,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  })
              : SizedBox(
                  height: 300,
                  child: Center(
                    child: _isLoading
                        ? const LoadingWidget()
                        : Text(
                            "No cars found",
                            style: AppFonts.w700black16,
                          ),
                  )),
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
