import 'package:flutter/material.dart';
import 'package:order/main.dart';
import 'package:order/home/components/home_screen.dart';
import 'package:order/home/components/tab_bar.dart';
import 'package:order/home/components/drawer.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Bill extends StatelessWidget {
  const Bill({super.key});

  Future<bool?> showWarning(BuildContext context) async => showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Sure to cancel the bill?"),
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.pop(context, false),
              child: Text('No'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pop(context, true),
              child: Text('Yes'),
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) => WillPopScope(
        onWillPop: () async {
          final shouldPop = await showWarning(context);
          return shouldPop ?? false;
        },
        child: Scaffold(
          // drawer: NavigationDrawer(),
          appBar: AppBar(
            title: const Text('Bill'),
            backgroundColor: Colors.blue,
          ),
          body: Favourite_Body(),
        ),
      );
}

class Favourite_Body extends StatelessWidget {
  var valuebtween = 20.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.only(top: 30),
      margin: EdgeInsets.only(top: 30, left: 20, right: 20),
      child: Column(
        children: <Widget>[
          Container(
            // margin: EdgeInsets.only(top: 30, left: 20),
            padding: EdgeInsets.only(top: valuebtween),
            child: BilDetails(
              title: "Rice",
              price: 20,
              press: () {},
            ),
          ),
          Container(
            // margin: EdgeInsets.only(top: 30),
            padding: EdgeInsets.only(top: valuebtween),
            child: BilDetails(
              title: "Mee",
              price: 10,
              press: () {},
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: valuebtween),
            child: BilDetails(
              title: "Smantha",
              price: 440,
              press: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ));
              },
            ),
          ),
          const Divider(color: Colors.black45),
          Container(
            padding: EdgeInsets.only(top: 20),
            child: Row(
              children: <Widget>[
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Total",
                        style: Theme.of(context).textTheme.button,
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Text(
                  '\$100',
                  style: Theme.of(context)
                      .textTheme
                      .button
                      ?.copyWith(color: Colors.green),
                ),
                IconButton(
                    icon: SvgPicture.asset("assets/icons/more.svg"),
                    // tooltip: 'Increase volume by 10',
                    onPressed: () {}),
              ],
            ),
          ),
        ],
      ),
    );
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
