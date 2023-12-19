import 'package:flikcar/common_widgets/custom_appbar.dart';
import 'package:flikcar/common_widgets/loading_widget.dart';
import 'package:flikcar/firebase_models/firebase_buyer_car.dart';
import 'package:flikcar/screens/buy_car_flow/car_detailed_view/car_detailed_view.dart';
import 'package:flikcar/screens/buy_car_flow/filter_applied/widget/filter_applied_card.dart';
import 'package:flikcar/screens/buy_car_flow/filter_applied/widget/sort_pop_up.dart';
import 'package:flikcar/screens/buy_car_flow/filter_screen/filter_screen.dart';
import 'package:flikcar/screens/home_screen/home_screen.dart';
import 'package:flikcar/services/get_car_details.dart';
import 'package:flikcar/services/search_service.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ViewAllBuyerCarsScreen extends StatefulWidget {
  const ViewAllBuyerCarsScreen({super.key});

  @override
  State<ViewAllBuyerCarsScreen> createState() => _ViewAllBuyerCarsScreenState();
}

class _ViewAllBuyerCarsScreenState extends State<ViewAllBuyerCarsScreen> {
  @override
  void initState() {
    //   Provider.of<SearchService>(context, listen: false).showFilterResult();
    //   Provider.of<SearchService>(context, listen: false).getFuelTypes();
    //   Provider.of<SearchService>(context, listen: false).getBodyTypes();
    //   Provider.of<SearchService>(context, listen: false).getOwnerTypes();
    //   Provider.of<SearchService>(context, listen: false).getBrandAndModels();
    Provider.of<SearchService>(context, listen: false).getBrandModelVarient();
    Provider.of<SearchService>(context, listen: false).filterCars();

    loading();
    super.initState();
  }

  bool _isLoading = true;

  loading() {
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> filterApplied =
        context.watch<SearchService>().allSelectedFilters;
    List<FirebaseBuyerCar> allCars =
        context.watch<SearchService>().filteredCars;

    return Scaffold(
        appBar: CustomAppBar.getAppBarWithSearch(
            function2: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeScreen(
                    index: 0,
                  ),
                ),
                (route) => false,
              );
            },
            context: context,
            back: true,
            onchange: (value) {
              Provider.of<SearchService>(context, listen: false)
                  .searchFunction(value);
            },
            function: () {
              Provider.of<SearchService>(context, listen: false)
                  .clearAllFilter();
            }),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => const FilterScreen(),
                        //     ));
                      },
                      child: menu(
                          image: "assets/car_details_icon/filter.png",
                          title: "Filters",
                          color: const Color(0xff161F31),
                          style: AppFonts.w700s116),
                    ),
                    Container(
                      width: 2,
                      height: 20,
                      color: const Color(0xffE0E0E0),
                    ),
                    GestureDetector(
                      onTap: () {
                        print("pressed");
                        // showDialog<String>(
                        //   context: context,
                        //   builder: (BuildContext context) => AlertDialog(
                        //     title: const Text('Sort By'),
                        //     content: const SortPopUp(),
                        //     actions: <Widget>[
                        //       TextButton(
                        //         onPressed: () =>
                        //             Navigator.pop(context, 'Cancel'),
                        //         child: Text(
                        //           'Close',
                        //           style: AppFonts.w500p215,
                        //         ),
                        //       ),
                        //       TextButton(
                        //         onPressed: () {
                        //           Provider.of<SearchService>(context,
                        //                   listen: false)
                        //               .sortList();
                        //           Navigator.pop(context);
                        //         },
                        //         child: Text(
                        //           'OK',
                        //           style: AppFonts.w500p215,
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // );
                      },
                      child: menu(
                          image: "assets/car_details_icon/sort.png",
                          title: "Sort",
                          color: const Color(0xff161F31),
                          style: AppFonts.w700s116),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              filterApplied.isNotEmpty
                  ? Container(
                      margin: const EdgeInsets.only(left: 15, bottom: 15),
                      width: MediaQuery.of(context).size.width,
                      height: 30,
                      child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        children: [
                          Center(
                            child: GestureDetector(
                              onTap: () {
                                Provider.of<SearchService>(context,
                                        listen: false)
                                    .clearAllFilter();
                              },
                              child: Text(
                                "Clear All",
                                style: AppFonts.w700green16,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          Row(
                            children: List.generate(
                                filterApplied.length,
                                (index) => filterButton(
                                    title: filterApplied[index], index: index)),
                          )
                        ],
                      ),
                    )
                  : const SizedBox(),
              // Row(
              //   children: [
              //     const SizedBox(
              //       width: 15,
              //     ),
              //     Text(
              //       "${allCars.length} ",
              //       style: AppFonts.w700black16,
              //     ),
              //     Text(
              //       "Flikcar Certified Cars Found",
              //       style: AppFonts.w500black14,
              //     ),
              //   ],
              // ),
              const SizedBox(
                height: 10,
              ),
              allCars.isNotEmpty
                  ? ListView.builder(
                      itemCount: allCars.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      CarDetailedView(car: allCars[index]),
                                ));
                          },
                          child: FilterAppliedCard(
                            car: allCars[index],
                          ),
                        );
                      })
                  : Padding(
                      padding: const EdgeInsets.only(top: 120),
                      child: SizedBox(
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
                height: 35,
              ),
            ],
          ),
        ));
  }

  Widget menu(
      {required String image,
      required String title,
      required Color color,
      required TextStyle style}) {
    return Row(
      children: [
        SizedBox(
            height: 15, width: 20, child: Image.asset(image, color: color)),
        const SizedBox(width: 8),
        Text(title, style: style),
      ],
    );
  }

  Widget filterButton({required String title, required int index}) {
    return Container(
      height: 28,
      margin: const EdgeInsets.only(right: 6),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.only(top: 5, bottom: 5, left: 8, right: 8),
          side: const BorderSide(
            color: Color(0xff45C08D),
          ),
          backgroundColor: const Color(0xffE9F9F2),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        onPressed: () {},
        child: Row(
          children: [
            Text(
              title,
              style: AppFonts.w500dark212,
            ),
            const SizedBox(
              width: 4,
            ),
            GestureDetector(
              onTap: () {},
              child: const Icon(
                Icons.close,
                color: Colors.black,
                size: 20,
              ),
            )
          ],
        ),
      ),
    );
  }
}
