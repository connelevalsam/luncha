import 'package:flutter/material.dart';

class OrderTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
          Text(
            'text',
            style: Theme.of(context).textTheme.headline3,
          ),
          Divider(
            thickness: 1,
            color: Colors.black,
          )
        ],
      ),
    );
  }
}
