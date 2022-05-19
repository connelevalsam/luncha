import 'package:flutter/material.dart';
import 'package:luncha/themes/luncha_theme.dart';

class OrderTile extends StatelessWidget {
  final String item;
  final String price;
  final String user;
  final String status;
  final Function handleBought;

  const OrderTile(
      {Key key,
      this.item,
      this.price,
      this.user,
      this.status,
      this.handleBought})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.orange, width: 0.2),
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'item',
                style: LunchaTheme.orangeText.headline3,
              ),
              Text(
                'price',
                style: LunchaTheme.orangeText.headline3,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                item ?? "",
                style: LunchaTheme.blackText.bodyText1,
              ),
              Text(
                price ?? "",
                style: LunchaTheme.blackText.bodyText1,
              ),
            ],
          ),
          const Divider(
            thickness: 1,
            color: Colors.black,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Who wants',
                style: LunchaTheme.orangeText.headline3,
              ),
              Text(
                'Status',
                style: LunchaTheme.orangeText.headline3,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                user ?? "",
                style: LunchaTheme.blackText.bodyText1,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.orange,
                ),
                padding: const EdgeInsets.all(10),
                child: Text(
                  status ?? "",
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: (status != "Done") ? handleBought : null,
            child: const Text('Bought'),
          )
        ],
      ),
    );
  }
}
