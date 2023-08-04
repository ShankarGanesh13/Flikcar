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
          child: ListView(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            children: [
              testimonial(
                  date: "Jan 23, 2023",
                  title:
                      "I had an amazing experience with Flikcar while selling my old car",
                  content:
                      "Flikcar made selling my car effortless. Easy listing, quick offers, smooth communication, and a swift transaction. Highly recommend for hassle-free selling!",
                  name: "Sanjay",
                  customerType: "Sold BMW 3 series",
                  rating: 4,
                  image:
                      "https://images.generated.photos/bcF05DUak404Giu07myk_1PgOBQLRlyDPHgHEI2XLwk/rs:fit:256:256/czM6Ly9pY29uczgu/Z3Bob3Rvcy1wcm9k/LnBob3Rvcy92M18w/NTc1MjcwLmpwZw.jpg"),
              testimonial(
                  date: "March 2,2023",
                  title: "Effortless Car Selling with Flikcar",
                  content:
                      "Flikcar exceeded my selling expectations. No paperwork, serious buyers, competitive offers. Sold my car hassle-free for a fair price. Flikcar is the stress-free choice!",
                  name: "Rohan",
                  rating: 5,
                  customerType: "Sold Toyota Innova",
                  image:
                      "https://images.generated.photos/XjWxx_C2HtVlAFy3glSjxQ_KbewoXQi4aXIW7I676-Y/rs:fit:256:256/czM6Ly9pY29uczgu/Z3Bob3Rvcy1wcm9k/LnBob3Rvcy92M18w/NjYwMjA1LmpwZw.jpg"),
              testimonial(
                  date: "July 13, 2023",
                  title:
                      "Selling Simplified: Flikcar Delivers Stress-Free Car Transactions",
                  rating: 5,
                  content:
                      "Flikcar made selling my old car a breeze – hassle-free listing, prompt buyer offers, and smooth communication. Swift transaction. Highly recommended for efficient selling!",
                  name: "Saranya",
                  customerType: "Sold Suzuki Swift",
                  image:
                      "https://images.generated.photos/6n-CQFmfRJhqtQa7IruHWp1gUWf_BVL2qWkU9xJqCuE/rs:fit:256:256/czM6Ly9pY29uczgu/Z3Bob3Rvcy1wcm9k/LnBob3Rvcy92M18w/NDc5NzQwLmpwZw.jpg")
            ],
          ),
        ),
      ],
    );
  }

  Widget testimonial(
      {required String date,
      required String title,
      required String content,
      required String name,
      required String customerType,
      required int rating,
      required String image}) {
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
            Row(
              children: [
                DisplayRating(
                  value: rating,
                ),
                Spacer(),
                Text(
                  date,
                  style: const TextStyle(
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
              "“$title”",
              maxLines: 2,
              style: AppFonts.w700black16,
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              content,
              style: AppFonts.w500dark214,
              maxLines: 4,
            ),
            const Spacer(),
            Row(
              children: [
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(image), fit: BoxFit.fill),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      maxLines: 1,
                      style: AppFonts.w500black14,
                    ),
                    Text(
                      customerType,
                      maxLines: 1,
                      style: const TextStyle(
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
  }
}
