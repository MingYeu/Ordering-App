import 'package:flutter/material.dart';
import 'package:order/main.dart';
import 'package:order/home/components/home_screen.dart';
import 'package:order/home/components/tab_bar.dart';
import 'package:order/home/components/drawer.dart';

class AddToChartHome extends StatelessWidget {
  const AddToChartHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
      appBar: AppBar(
        title: const Text('Add To Chart'),
        backgroundColor: Colors.blue,
      ),
      body: Favourite_Body(),
    );
  }
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
            child: AddToChart(
              title: "Rice",
              price: 20,
              press: () {},
            ),
          ),
          Container(
            // margin: EdgeInsets.only(top: 30),
            padding: EdgeInsets.only(top: valuebtween),
            child: AddToChart(
              title: "Mee",
              price: 10,
              press: () {},
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: valuebtween),
            child: AddToChart(
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
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AddToChart extends StatelessWidget {
  const AddToChart({
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

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.red;
    }

    return Checkbox(
      checkColor: Colors.white,
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
    );
  }
}
