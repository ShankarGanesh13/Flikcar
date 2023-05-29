import 'package:flikcar/common_widgets/display_rating.dart';
import 'package:flikcar/common_widgets/heading1.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class SellerTestimonials extends StatelessWidget {
  SellerTestimonials({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
            padding: EdgeInsets.only(left: 15.0, top: 30, bottom: 15),
            child: Heading1(
              title1: "Seller testimonials",
              title2: "",
            )),
        SizedBox(
          height: 255,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            shrinkWrap: true,
            itemBuilder: ((context, index) {
              return Container(
                  margin: const EdgeInsets.only(left: 20, bottom: 15, top: 10),
                  height: 235,
                  width: 239,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(2.0, 2.0),
                        blurRadius: 6.0,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      const Row(
                        children: [
                          DisplayRating(
                            value: 4,
                          ),
                          Spacer(),
                          Text(
                            "23 Apr, 2023",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 10,
                                color: Color(0xff606060)),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        "“Flikcar gave me the best  price”",
                        maxLines: 2,
                        style: AppFonts.w700black16,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        "Curabitur vel tristique libero. Vivamus malesuada sollicitudin odio id malesuada. Nam dignissim tortor ut urna sollicitudin,",
                        style: AppFonts.w500dark214,
                        maxLines: 4,
                      ),
                      Spacer(),
                      Row(
                        children: [
                          Container(
                            width: 30,
                            height: 30,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?cs=srgb&dl=pexels-pixabay-220453.jpg&fm=jpg'),
                                  fit: BoxFit.fill),
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "John Doe",
                                maxLines: 1,
                                style: AppFonts.w500black14,
                              ),
                              const Text(
                                "Sold Mercedez Benz",
                                maxLines: 1,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10,
                                    color: Color(0xff606060)),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ));
            }),
          ),
        ),
      ],
    );
  }
}
