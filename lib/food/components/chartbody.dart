import 'package:flutter/material.dart';
import 'package:order/home/components/drawer.dart';
import 'package:order/food/components/addToChart.dart';

class ChartBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Order Chart',
          style: TextStyle(fontSize: 22.0),
        ),
      ),
      drawer: NavigationDrawer(),
      body: AddToChartFood(),
    );
  }
}
