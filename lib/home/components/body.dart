import 'dart:async';

import 'package:flutter/material.dart';
import 'package:order/food/components/foodData.dart';
import 'package:order/home/components/home_screen.dart';

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
              image: foodImage[0],
              title: foodName[0],
              price: foodPrice[0],
              press: () {
                //Automatic add in

                // foodSelectImage.add(foodImage[0]);
                // foodSelectName.add(foodName[0]);
                // foodSelectPrice.add(foodPrice[0]);

                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) {
                //       return HomeScreen();
                //     },
                //   ),
                // );
              },
            ),
          ),
          Container(
            child: RecomendFoodCard(
              image: foodImage[1],
              title: foodName[1],
              price: foodPrice[1],
              press: () {
                // foodSelectImage.add(foodImage[1]);
                // foodSelectName.add(foodName[1]);
                // foodSelectPrice.add(foodPrice[1]);
              },
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
    required this.price,
    required this.press,
  }) : super(key: key);

  final String image, title;
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
                          text: "$title\n",
                          style: Theme.of(context).textTheme.button,
                        ),
                        // TextSpan(
                        //   text: "$country".toUpperCase(),
                        //   style: TextStyle(
                        //     color: Colors.green.withOpacity(0.5),
                        //   ),
                        // ),
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
                  ),
                  IconButton(
                    onPressed: () {
                      foodSelectImage.add(image);
                      foodSelectName.add(title);
                      foodSelectPrice.add(price);

                      final snackBar = SnackBar(
                        duration: const Duration(seconds: 1),
                        content: Text('$title Added'),
                        // action: SnackBarAction(
                        //   label: 'Undo',
                        //   onPressed: () {
                        //     // Some code to undo the change.
                        //   },
                        // ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);

                      // _check(context);
                      // Timer(Duration(seconds: 1), () => Navigator.pop(context));
                    },
                    icon: Icon(Icons.add),
                  ),
                  // _check();
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void _check(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text("Added"),
                ]),
          );
        });
  }
}
