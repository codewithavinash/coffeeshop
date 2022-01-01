import 'package:coffee_shop/models/cart.dart';
import 'package:coffee_shop/widgets/themes.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Cart"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _CartList(),
            // Placeholder(),
            Divider(),
            _CartTotal(),
          ],
        ),
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _cart = CartModel();
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text("\u{20B9} ${_cart.totalPrice} "),
          //buy button
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.brown.shade900,
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0),
              ),
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Buying not supported yet!"),
                ),
              );
            },
            child: Text("Buy"),
          )
        ],
      ),
    );
  }
}

class _CartList extends StatefulWidget {
  const _CartList({Key? key}) : super(key: key);

  @override
  __CartListState createState() => __CartListState();
}

class __CartListState extends State<_CartList> {
  final _cart = CartModel(); //obj
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: _cart.items!.length,
        itemBuilder: (context, index) => ListTile(
          leading: Icon(Icons.done),
          trailing: IconButton(
            icon: Icon(Icons.remove),
            onPressed: () {},
          ),
          title: Text(
            _cart.items![index].title,
            style: TextStyle(color: Colors.black, fontSize: 25),
          ),
        ),
      ),
    );
  }
}
