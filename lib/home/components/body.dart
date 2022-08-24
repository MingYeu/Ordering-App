import 'package:flutter/material.dart';
import 'package:order/home/components/searchbox.dart';
import 'package:order/home/components/tab_bar.dart';
import 'package:order/home/components/drawer.dart';
import 'package:order/home/components/RecommendFood.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //It will provide us total height and width of our screen
    Size size = MediaQuery.of(context).size;
    //It enable scrolling on small device
    return gridview();
    // return SingleChildScrollView(
    //   child: Column(
    //     children: <Widget>[
    //       SearchBox(),
    //       Container(
    //         child: gridview(),
    //       )
    //       // gridview(),
    //     ],
    //   ),
    // );
  }
}

class gridview extends StatelessWidget {
  // const gridview({
  //   Key? key,
  // }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        primary: false,
        childAspectRatio: MediaQuery.of(context).size.width /
            (MediaQuery.of(context).size.height / 1.25),
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: <Widget>[
          Container(
            child: RecomendFoodCard(
              image: "assets/images/image_3.png",
              title: "Smantha",
              country: "Russia",
              price: 440,
              press: () {},
            ),
          ),
          Container(
            child: RecomendFoodCard(
              image: "assets/images/image_2.png",
              title: "Angelia",
              country: "Russia",
              price: 440,
              press: () {},
            ),
          ),
          Container(
            child: RecomendFoodCard(
              image: "assets/images/image_1.png",
              title: "Smantha",
              country: "Russia",
              price: 440,
              press: () {},
            ),
          ),
        ],
      ),
    );
  }
}

class RecomendFoodCard extends StatelessWidget {
  const RecomendFoodCard({
    Key? key,
    required this.image,
    required this.title,
    required this.country,
    required this.price,
    required this.press,
  }) : super(key: key);

  final String image, title, country;
  final int price;
  final Function press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(
        left: 10.0,
        top: 10.0 / 2,
        bottom: 10.0 * 2.5,
      ),
      //It will cover 40% of our total width
      width: size.width * 0.4,
      child: Column(
        children: <Widget>[
          // Image.asset('assets/images/img.png'),
          Image.asset(image),
          GestureDetector(
            onTap: press(),
            child: Container(
              padding: EdgeInsets.all(20.0 / 2),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: Colors.green.withOpacity(0.23),
                  ),
                ],
              ),
              child: Row(
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "$title\n".toUpperCase(),
                          style: Theme.of(context).textTheme.button,
                        ),
                        TextSpan(
                          text: "$country".toUpperCase(),
                          style: TextStyle(
                            color: Colors.green.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Text(
                    '\$$price',
                    style: Theme.of(context)
                        .textTheme
                        .button
                        ?.copyWith(color: Colors.green),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
