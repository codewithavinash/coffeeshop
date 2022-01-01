import 'package:coffee_shop/models/catalog.dart';
import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({Key? key, required this.item}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {},
        leading: Image.network(item.image),
        title: Text(item.title),
        subtitle: Text(item.desc),
        trailing: Text(
          "\u{20B9}${item.price.toString()}",
          style: TextStyle(
              // fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }
}
