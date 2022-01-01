import 'package:coffee_shop/models/catalog.dart';
import 'package:coffee_shop/utils/page_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class ProductDetailScreen extends StatelessWidget {
  final Item item;
  const ProductDetailScreen({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
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
                Container(
                  margin: EdgeInsets.fromLTRB(300, 10, 0, 0),
                  child: FloatingActionButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(PageRoutes.cartScreen);
                    },
                    backgroundColor: Colors.teal,
                    child: Icon(Icons.shopping_cart),
                  ),
                ),
                GestureDetector(
                  child: Positioned(
                    child: IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(Icons.arrow_back)),
                    left: 10,
                    top: 10,
                  ),
                ),
              ],
            ),
            Expanded(
              child: ClipPath(
                clipper: WaveClipperTwo(reverse: true),
                child: Container(
                  width: double.infinity,
                  color: Colors.teal,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 60,
                        ),
                        Text(
                          item.title,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.brown.shade900,
                          ),
                        ),
                        SizedBox(
                          height: 10,
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
            ),
          ],
        ),
      ),
    );
  }
}
