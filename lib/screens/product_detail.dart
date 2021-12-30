import 'package:coffee_shop/models/catalog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class ProductDetailScreen extends StatelessWidget {
  final Item item;
  const ProductDetailScreen({Key? key, required this.item})
      : assert(item != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Hero(
            tag: item.id.toString(),
            child: Center(
              child: Container(
                height: 220,
                // color: Colors.teal,
                child: Image.network(item.image),
              ),
            ),
          ),
          Expanded(
            child: ClipPath(
              clipper: WaveClipperTwo(reverse: true),
              child: Container(
                width: double.infinity,
                color: Colors.teal,
                child: Column(
                  children: [
                    SizedBox(
                      height: 70,
                    ),
                    Text(
                      item.title,
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.brown.shade900,
                      ),
                    ),
                    Text(
                      item.desc,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.blue.shade50,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                      child: Divider(
                        thickness: 2,
                        color: Colors.teal.shade100,
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.brown.shade900,
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                      ),
                      onPressed: () {},
                      child: Text("Add to cart"),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
