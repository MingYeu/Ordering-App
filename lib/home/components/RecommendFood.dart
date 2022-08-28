import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RecommendsFoods extends StatelessWidget {
  // const RecommendsFoods({
  //   Key? key,
  // }) : super(key: key);

  List<String> dataImage = [
    'assets/images/food/rice.png',
    'assets/images/food/milk.png',
    'assets/images/food/onion.png',
    'assets/images/food/bread.png',
    'assets/images/food/rice.png',
    'assets/images/food/milk.png',
    'assets/images/food/onion.png',
    'assets/images/food/bread.png',
    'assets/images/food/rice.png'
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          RecomendPlantCard(
            image: "assets/images/food/rice.png",
            title: "Rice",
            country: "Russia",
            price: 440,
            press: () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) => DetailsScreen(),
              //     ));
            },
          ),
          RecomendPlantCard(
            image: "assets/images/food/bread.png",
            title: "Bread",
            country: "Russia",
            price: 440,
            press: () {},
          ),
          RecomendPlantCard(
            image: "assets/images/food/milk.png",
            title: "Milk",
            country: "Russia",
            price: 440,
            press: () {},
          ),
          RecomendPlantCard(
            image: "assets/images/food/onion.png",
            title: "Onion",
            country: "Amerika",
            price: 440,
            press: () {},
          ),
        ],
      ),
    );
  }
}

class RecomendPlantCard extends StatelessWidget {
  const RecomendPlantCard({
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
        left: 20.0,
        top: 20.0 / 2,
        bottom: 20.0 * 2.5,
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
