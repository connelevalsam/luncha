import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:luncha/widgets/order_tile.dart';

import '../../../themes/luncha_theme.dart';
// import '../../../provider/orders_provider.dart';

class Orders extends StatelessWidget {
  DateTime todaysDate = DateTime.now();
  final CollectionReference orders =
      FirebaseFirestore.instance.collection("orders");
  @override
  Widget build(BuildContext context) {
    // var allOrders = Provider.of<OrdersProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Orders',
          style: LunchaTheme.orangeText.headline1,
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: orders.snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text("Loading");
            }

            return Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/bg.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.7),
                    ),
                  ),
                  ListView(
                    children:
                        snapshot.data.docs.map((DocumentSnapshot document) {
                      Map<String, dynamic> data =
                          document.data() as Map<String, dynamic>;
                      print(data.values.first.toString());
                      print(data["item_price"]);
                      return OrderTile(
                        item: data["item"],
                        price: data["item_price"].toString(),
                        user: data["user_id"],
                        status: data["status"],
                        handleBought: () {
                          orders.doc(document.id).update({"status": "Done"});
                          print("==== r is - ${document.id}");
                        },
                      );
                    }).toList(),
                  ),
                ],
              ),
            );
            // return Container(
            //   decoration: const BoxDecoration(
            //     image: DecorationImage(
            //       image: AssetImage("assets/images/bg.jpg"),
            //       fit: BoxFit.cover,
            //     ),
            //   ),
            //   child: Stack(
            //     children: <Widget>[
            //       Container(
            //         decoration: BoxDecoration(
            //           color: Colors.black.withOpacity(0.7),
            //         ),
            //       ),
            //       Column(
            //         children: <Widget>[
            //           Padding(
            //             padding: const EdgeInsets.symmetric(
            //               horizontal: 10,
            //               vertical: 5,
            //             ),
            //             child: Center(
            //               child: Text(
            //                 ' $todaysDate ',
            //                 style: Theme.of(context).textTheme.headline3,
            //               ),
            //             ),
            //           ),
            //           OrderTile(),
            //         ],
            //       ),
            //     ],
            //   ),
            // );
          }),
    );
  }
}
