import 'package:flutter/material.dart';
import 'package:order/food/components/check.dart';
import 'package:order/home/components/home_screen.dart';
import 'package:order/home/components/login.dart';
import 'package:order/food/components/chartBody.dart';
import 'package:order/food/components/foodData.dart';

import '../../food/components/bill.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Drawer(
          child: SingleChildScrollView(
              child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          buildHeader(context),
          buildMenuItems(context),
        ],
      )));

  Widget buildHeader(BuildContext context) => Container(
      color: Colors.blue,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top * 2,
        bottom: 24,
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 52,
            // child: Image.asset('assets/images/img.png'),
            backgroundImage: AssetImage('assets/images/img.png'),
          ),
          // Image.asset('assets/images/img.png'),
          SizedBox(height: 12),
          Text('Lim Ming Yeu',
              style: TextStyle(fontSize: 28, color: Colors.white)),
          Text('Lim Ming Yeu',
              style: TextStyle(fontSize: 16, color: Colors.white)),
          SizedBox(height: 15),
        ],
      ));

  Widget buildMenuItems(BuildContext context) => Container(
        padding: const EdgeInsets.all(24),
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.home_outlined),
              title: const Text('Menu'),
              onTap: () =>
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => HomeScreen(),
              )),
            ),
            ListTile(
              leading: const Icon(Icons.favorite_border),
              title: const Text('Add To Chart'),
              onTap: () {
                // Navigator.pop(context);
                // Navigator.of(context).push(MaterialPageRoute(
                //   builder: (context) => AddToChartHome(),
                // ));
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ChartBody();
                    },
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.paid),
              title: const Text('Bill'),
              onTap: () {
                // Navigator.pop(context);

                // Navigator.of(context).push(MaterialPageRoute(
                //   builder: (context) => AddToChartHome(),
                // ));

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Bill();
                    },
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.paid),
              title: const Text('Bill Check'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Bill_Check();
                    },
                  ),
                );
              },
            ),
            const Divider(color: Colors.black45),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Log Out'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Login();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      );
}
