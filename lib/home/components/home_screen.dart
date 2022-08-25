import 'package:flutter/material.dart';
import 'package:order/home/components/searchbox.dart';
import 'package:order/home/components/tab_bar.dart';
import 'package:order/home/components/drawer.dart';
import 'package:order/home/components/body.dart';
import 'package:order/home/components/addToChart.dart';

class HomeScreen extends StatelessWidget {
  Future<bool?> showWarning(BuildContext context) async => showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Do you want to exit app?"),
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
          appBar: builderAppBar(),
          drawer: NavigationDrawer(),
          body: Body(),
          // bottomNavigationBar: MyBottomNavBar(),
        ),
      );

  AppBar builderAppBar() {
    // return AppBar(
    //   elevation: 0,
    //   leading: IconButton(
    //     icon: SvgPicture.asset("assets/icons/menu.svg"),
    //     onPressed: () {},
    //   ),
    return AppBar(
      centerTitle: true,
      title: Text(
        'Home',
        style: TextStyle(fontSize: 22.0),
      ),
      // actions: [
      //   IconButton(
      //     icon: Icons.search,
      //     onPressed: () {
      //       Navigator.push(
      //             context,
      //             MaterialPageRoute(
      //               builder: (context) {
      //                 return AddToChartHome();
      //               },
      //             ),
      //           );
      //     },
      //   ),
      // ],
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   @override
//   State<MyHomePage> createState() => HomeScreen();
// }

// class HomeScreen extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     HeaderWithSearchBox(size: size);
//     return Scaffold(
//       // appBar: AppBar(
//       //   title: Text('Home'),
//       //   backgroundColor: Colors.blue.shade700,
//       // ),
//       // drawer: NavigationDrawer(),
//       body: MyApp(),
//     );
//   }
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: DefaultTabController(
//         length: 6,
//         child: Scaffold(
//           appBar: AppBar(
//             centerTitle: true,
//             title: Text(
//               'Home',
//               style: TextStyle(fontSize: 22.0),
//             ),
//             backgroundColor: Colors.blue.shade700,
//             bottom: TabBar(
//               isScrollable: true,
//               unselectedLabelColor: Colors.white.withOpacity(0.3),
//               indicatorColor: Colors.white,
//               tabs: [
//                 Tab(text: 'FIRST'),
//                 Tab(text: 'SECOND'),
//                 Tab(text: 'THIRD'),
//                 Tab(text: 'FOURTH'),
//                 Tab(text: 'FIFTH'),
//                 Tab(text: 'SIXTH'),
//               ],
//             ),
//             //   preferredSize: Size.fromHeight(70.0),
//             //   child: new Container(
//             //     color: Colors.blue.shade700,
//             //     child: new SafeArea(
//             //       child: Column(
//             //         children: <Widget>[
//             //           new Expanded(child: new Container()),
//             //           new TabBar(
//             //             // isScrollable: true,
//             //             unselectedLabelColor: Colors.white.withOpacity(0.3),
//             //             indicatorColor: Colors.white,
//             //             tabs: [
//             //               Tab(text: 'FIRST'),
//             //               Tab(text: 'SECOND'),
//             //               Tab(text: 'THIRD'),
//             //               Tab(text: 'FOURTH'),
//             //               Tab(text: 'FIFTH'),
//             //               Tab(text: 'SIXTH'),
//             //             ],
//             //           ),
//             //         ],
//             //       ),
//             //     ),
//             //   ),
//             // ),
//             // title: Text('TABS TITLE TEXT'),
//           ),
//           drawer: NavigationDrawer(),
//           body: TabBarView(
//             children: [
//               FirstScreen(),
//               SecondScreen(),
//               ThirdScreen(),
//               FirstScreen(),
//               SecondScreen(),
//               ThirdScreen()
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class FirstScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home: Scaffold(
//             body: Center(
//                 child: Text(
//           'First Activity Screen',
//           style: TextStyle(fontSize: 21),
//         ))));
//   }
// }

// class SecondScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home: Scaffold(
//             body: Center(
//                 child: Text(
//           'Second Activity Screen',
//           style: TextStyle(fontSize: 21),
//         ))));
//   }
// }

// class ThirdScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home: Scaffold(
//             body: Center(
//                 child: Text(
//           'Third Activity Screen',
//           style: TextStyle(fontSize: 21),
//         ))));
//   }
// }
