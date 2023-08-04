import 'package:flikcar/common_widgets/display_rating.dart';
import 'package:flikcar/common_widgets/heading1.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class BuyerTestimonials extends StatelessWidget {
  BuyerTestimonials({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
            padding: EdgeInsets.only(left: 15.0, top: 0, bottom: 15),
            child: Heading1(
              title1: "Buyer testimonials",
              title2: "",
            )),
        SizedBox(
          height: 255,
          child: ListView(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            children: [
              testimonial(
                  date: "23 Apr, 2023",
                  title:
                      "I had an amazing experience with Flikcar while selling my old car",
                  content:
                      "Flikcar redefined how I buy used cars. Intuitive interface, customized options, in-depth details, and a transaction that was as smooth as can be. An impeccable choice!.",
                  name: "Ruchi",
                  rating: 5,
                  customerType: "Bought Volkswagen Polo",
                  image:
                      "https://imgs.search.brave.com/iAhF1j5fDJbjzCXSWjK5V22hHdWAuIfIc-EWtc6KWOM/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9pbWFn/ZXMudW5zcGxhc2gu/Y29tL3Bob3RvLTE0/OTQ3OTAxMDgzNzct/YmU5YzI5YjI5MzMw/P2l4bGliPXJiLTQu/MC4zJml4aWQ9TTN3/eE1qQTNmREI4TUh4/elpXRnlZMmg4TVRS/OGZHbHVaR2xoYmlV/eU1IZHZiV1Z1ZkdW/dWZEQjhmREI4Zkh3/dyZ3PTEwMDAmcT04/MA.jpeg"),
              testimonial(
                  date: "18 Jan, 2023",
                  title:
                      "Flikcar ensured a secure transaction, and I am now a happy owner of a reliable used car",
                  rating: 4,
                  content:
                      "Flikcar transformed my used car buying experience. User-friendly interface, tailored options, detailed descriptions, and seamless purchasing. Perfect choice!",
                  name: "Pavan",
                  customerType: "Bought Audi Q3",
                  image:
                      "https://imgs.search.brave.com/bfyQUmLaqolNd35K40lOkmqfl7cZ73HbmvHVEEQf78U/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5nZXR0eWltYWdl/cy5jb20vaWQvMTE3/MTY4OTc0Ny9waG90/by93ZWxsLWRyZXNz/ZWQtYnVzaW5lc3Nt/YW4tYWdhaW5zdC13/aGl0ZS1iYWNrZ3Jv/dW5kLmpwZz9zPTYx/Mng2MTImdz0wJms9/MjAmYz1tT0tTaVhD/U1FFUXRzRkRVVzM0/NElGSXFyY0I3cTBf/R3doN2U4R2pnTG00/PQ"),
              testimonial(
                  date: "12 Feb, 2023",
                  rating: 5,
                  title:
                      "Flikcar: Redefining Used Car Buying - Seamless, Tailored, Perfect!",
                  content:
                      "Flikcar revolutionized my approach to purchasing a used car. Intuitive interface, personalized choices, comprehensive details, and effortless transaction. A flawless decision!",
                  name: "Hemanth",
                  customerType: "Brought Skoda Superb",
                  image:
                      "https://imgs.search.brave.com/wBudsfG--TZ7aIXBuT3UW_x3hj5ca4dDpUEmtkXqxlY/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9pbWcu/ZnJlZXBpay5jb20v/ZnJlZS1waG90by9w/b3J0cmFpdC15b3Vu/Zy1pbmRpYW4tdG9w/LW1hbmFnZXItdC1z/aGlydC10aWUtY3Jv/c3NlZC1hcm1zLXNt/aWxpbmctd2hpdGUt/aXNvbGF0ZWQtd2Fs/bF80OTYxNjktMTUx/My5qcGc_c2l6ZT02/MjYmZXh0PWpwZw"),
              testimonial(
                  date: "3 June, 2023",
                  rating: 5,
                  title:
                      "Flikcar was a lifeline for a first-time car buyer like me.",
                  content:
                      "Extensive selection, user-friendly filters, and excellent support. Found my dream car hassle-free and at a great price. Grateful to Flikcar!",
                  name: "Rahul",
                  customerType: "Bought Hyundai Creta",
                  image:
                      "https://images.generated.photos/mX4Ks4EMpwLjPY4R_bDxpmJ9oVETCZHalv14bqLJwAY/rs:fit:256:256/czM6Ly9pY29uczgu/Z3Bob3Rvcy1wcm9k/LnBob3Rvcy92M18w/MjAzMzAyLmpwZw.jpg")
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
      required int rating,
      required String customerType,
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
                const Spacer(),
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
                        image: NetworkImage(image), fit: BoxFit.cover),
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
