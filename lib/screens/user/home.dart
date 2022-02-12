import 'package:flutter/material.dart';
import 'package:luncha/themes/luncha_theme.dart';
import 'package:luncha/widgets/add_orders.dart';
import 'package:luncha/widgets/drawer.dart';

class UserHomePage extends StatefulWidget {
  const UserHomePage({Key key}) : super(key: key);

  @override
  _UserHomePageState createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  List orders = [];
  List prices = [];

  var txtOrderController = TextEditingController();
  var txtPriceController = TextEditingController();

  void _handleCancel() {
    txtOrderController.text = "";
    txtPriceController.text = "";
    Navigator.of(context).pop();
  }

  void _handleAdd() {
    String order = txtOrderController.text;
    double price = double.parse(txtPriceController.text);
    print("Here: $order - $price");
    setState(() {
      orders.add(order);
      prices.add(price);
    });
    txtOrderController.text = "";
    txtPriceController.text = "";
    Navigator.of(context).pop();
  }

  void _handleAddOrders() {
    addOrders(
      context,
      txtOrderController,
      txtPriceController,
      _handleAdd,
      _handleCancel,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(context),
      appBar: AppBar(
        title: Text(
          'Luncha',
          style: LunchaTheme.orangeText.headline1,
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Stack(
              children: [
                Container(
                  height: 400,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage("assets/images/bg.jpg"),
                    fit: BoxFit.cover,
                  )),
                ),
                Container(
                  height: 400,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.black, Colors.transparent],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                ),
              ],
            ),
            flex: 1,
          ),
          Text(
            'Place your orders',
            style: Theme.of(context).textTheme.headline1,
          ),
          Expanded(
            child: orders.isEmpty
                ? const Center(
                    child: Icon(
                      Icons.no_meals,
                      size: 100,
                    ),
                  )
                : Column(
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        itemBuilder: (ctx, index) => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                orders[index],
                                style: Theme.of(context).textTheme.headline3,
                              ),
                            ),
                            Text(
                              "N ${prices[index]}",
                              style: Theme.of(context).textTheme.headline3,
                            ),
                          ],
                        ),
                        itemCount: orders.length,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('text'),
                      )
                    ],
                  ),
            flex: 2,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _handleAddOrders,
        tooltip: "Add a order",
        child: const Icon(Icons.add),
      ),
    );
  }
}
