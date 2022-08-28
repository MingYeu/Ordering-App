import 'package:flutter/material.dart';
import 'package:order/food/components/bill.dart';

// import '../../home/components/drawer.dart';
import 'package:order/food/components/foodData.dart';

class AddToChartFood extends StatefulWidget {
  const AddToChartFood({super.key});

  @override
  State<AddToChartFood> createState() => _AddToChartFoodState();
}

class _AddToChartFoodState extends State<AddToChartFood> {
  String text = '';
  @override
  Widget build(BuildContext context) {
    if (foodSelectName.length != 0) {
      return Scaffold(
        body: ListView.builder(
          itemCount: foodSelectName.length,
          itemBuilder: (context, index) {
            return Card(
              color: Colors.white,
              elevation: 5,
              margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 16.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                    contentPadding: EdgeInsets.all(16),
                    leading: CircleAvatar(
                      radius: 32,
                      backgroundImage: AssetImage(foodSelectImage[index]),
                    ),
                    title: Text(foodSelectName[index]),
                    subtitle: Text(foodSelectPrice[index].toString()),
                    trailing: Container(
                      width: 70,
                      child: Row(children: [
                        // Expanded(
                        //   child: IconButton(
                        //     onPressed: () {
                        //       showDialog(
                        //         context: context,
                        //         builder: (context) => SimpleDialog(
                        //           children: [
                        //             TextField(
                        //               onChanged: (value) {
                        //                 setState(() {
                        //                   text = value;
                        //                 });
                        //               },
                        //             ),
                        //             ElevatedButton(
                        //               onPressed: () {
                        //                 setState(() {
                        //                   data[index] = text;
                        //                 });
                        //                 Navigator.pop(context);
                        //               },
                        //               child: Text('update'),
                        //             ),
                        //           ],
                        //         ),
                        //       );
                        //     },
                        //     icon: Icon(Icons.edit),
                        //   ),
                        // ),
                        Expanded(
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                // foodBillName.add(foodName[index]);
                                // foodBillPrice.add(foodPrice[index]);
                                // foodBillImage.add(foodImage[index]);

                                foodSelectName.removeAt(index);
                                foodSelectPrice.removeAt(index);
                                foodSelectImage.removeAt(index);
                              });
                            },
                            icon: Icon(Icons.delete),
                          ),
                        ),
                      ]),
                    )),
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) =>
                  // SimpleDialog(
                  //   child: Row(
                  //     children: [
                  //     ElevatedButton(
                  //       onPressed: () {
                  //         Navigator.pop(context);
                  //       },
                  //       child: Text('Confirm'),
                  //     ),
                  //     ElevatedButton(
                  //       onPressed: () {
                  //         Navigator.pop(context);
                  //       },
                  //       child: Text('Cancel'),
                  //     ),
                  //     ],
                  //   ),
                  // ),
                  AlertDialog(
                title: Text("Confirm to Order?"),
                // content: Text("You have raised a Alert Dialog Box"),
                actions: <Widget>[
                  FlatButton(
                    onPressed: () {
                      // for (var i = 0; i < foodName.length; i++) {
                      //   if (foodName[i] == foodSelectName[i]) {
                      //     foodBillName.add(foodName[i]);
                      //     foodBillPrice.add(foodPrice[i]);
                      //     foodBillImage.add(foodImage[i]);
                      //   }
                      // }

                      // foodBillName.addAll(foodSelectName);
                      // foodBillPrice.addAll(foodSelectPrice);
                      // foodBillImage.addAll(foodSelectImage);

                      // foodBillName = [...foodSelectName];
                      // foodBillPrice = [...foodSelectPrice];
                      // foodBillImage = [...foodSelectImage];

                      // foodSelectName.clear();
                      // foodSelectPrice.clear();
                      // foodSelectImage.clear();

                      // Navigator.of(context).pop();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return Bill();
                          },
                        ),
                      );
                      // Navigator.pop(context);
                    },
                    child: Text("Yes"),
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("No"),
                  ),
                ],
              ),
            );
          },
          backgroundColor: Colors.green,
          child: const Icon(Icons.add),
        ),
      );
    } else {
      return Scaffold();
    }
  }
}
