import 'dart:math';

import 'package:flutter/material.dart';
import 'package:order/main.dart';
import 'package:order/home/components/home_screen.dart';
import 'package:order/home/components/tab_bar.dart';
import 'package:order/home/components/drawer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:order/food/components/foodData.dart';

String orderCode = RandomDigits.getInteger(6).toString();
String total = TotalBill.getTotal(foodBillPrice).toString();

class Bill_Check extends StatelessWidget {
  const Bill_Check({super.key});

  // @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bill Number: $orderCode'),
        backgroundColor: Colors.blue,
      ),
      drawer: NavigationDrawer(),
      body: Favourite_Body(),
    );
  }
}

// class Favourite_Body extends StatefulWidget {
//   const Favourite_Body({super.key});

//   @override
//   State<Favourite_Body> createState() => _Favourite_Body();
// }

class Favourite_Body extends StatelessWidget {
  var valuebtween = 20.0;

  @override
  Widget build(BuildContext context) {
    if (foodBillName.length != 0) {
      return Container(
        margin: EdgeInsets.only(top: 30, left: 20, right: 20),
        child: ListView.builder(
          itemCount: foodBillName.length,
          itemBuilder: (context, index) {
            return ListTile(
              contentPadding: EdgeInsets.all(16),
              leading: CircleAvatar(
                radius: 32,
                backgroundImage: AssetImage(foodBillImage[index]),
              ),
              title: Text(foodBillName[index]),
              trailing: Container(
                width: 70,
                child: Row(children: [
                  Expanded(
                    child: Text('RM: ' + foodBillPrice[index].toString()),
                  ),
                ]),
              ),
            );
          },
        ),
      );
    } else {
      return Scaffold();
    }
  }
}

class TotalBill {
  static int getTotal(List<int> price) {
    int s = 0;
    for (var i = 0; i < price.length; i++) {
      s = s + price[i];
    }

    return s;
  }
}

class RandomDigits {
  static const MaxNumericDigits = 17;
  static final _random = Random();

  static int getInteger(int digitCount) {
    if (digitCount > MaxNumericDigits || digitCount < 1)
      throw new RangeError.range(0, 1, MaxNumericDigits, "Digit Count");
    var digit = _random.nextInt(9) + 1;
    int n = digit;

    for (var i = 0; i < digitCount - 1; i++) {
      digit = _random.nextInt(10);
      n *= 10;
      n += digit;
    }
    return n;
  }

  static String getString(int digitCount) {
    String s = "";
    for (var i = 0; i < digitCount; i++) {
      s += _random.nextInt(10).toString();
    }
    return s;
  }
}

class BilDetails extends StatelessWidget {
  const BilDetails({
    Key? key,
    required this.title,
    required this.price,
    required this.press,
  }) : super(key: key);

  final String title;
  final int price;
  final Function press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      // child: Text(
      //   '\$$price',
      //   style: TextStyle(color: Colors.white),
      // ),
      // decoration: BoxDecoration(
      //   color: const Color(0xff7c94b6),
      //   border: Border.all(
      //     color: Colors.blue,
      //     // width: 8,
      //   ),
      //   borderRadius: BorderRadius.circular(12),
      // ),
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
                  text: "$title".toUpperCase(),
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
    );
  }
}
