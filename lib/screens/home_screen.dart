import 'package:coffee_shop/models/cart.dart';
import 'package:coffee_shop/models/catalog.dart';
import 'package:coffee_shop/screens/product_detail.dart';
import 'package:coffee_shop/widgets/bottom_appbar.dart';
import 'package:coffee_shop/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; //rootbundle (loading json file)
import 'dart:convert';

// import 'package:google_fonts/google_fonts.dart'; //json decoding

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    print(catalogJson);
    final decodedData = jsonDecode(catalogJson);
    var productData = decodedData["products"];
    print("fine");
    CatalogModel.items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    print(CatalogModel.items);
    print("ggreeen signl");
    // call build again
    setState(() {
      print("build called again!");
    });
  }

  @override
  Widget build(BuildContext context) {
    // final dummyList = List.generate(11, (index) => CatalogModel.items[0]);
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: (CatalogModel.items != null && CatalogModel.items!.isNotEmpty)
            ?
            // ? ListView.builder(
            //     itemCount: CatalogModel.items.length,
            //     itemBuilder: (context, index) {
            //       return ItemWidget(
            //         item: CatalogModel.items[index],
            //       );
            //     },
            //   )
            SafeArea(
                top: true,
                bottom: false,
                child: ItemsGridView(),
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
      drawer: MyDrawer(),
      bottomNavigationBar: DemoBottomAppBar(),
    );
  }
}

class ItemsGridView extends StatelessWidget {
  const ItemsGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 11,
        mainAxisExtent: 241,
      ),
      itemCount: CatalogModel.items!.length,
      itemBuilder: (context, index) {
        // final item = CatalogModel.items![index];
        final item = CatalogModel.items![index];

        Item? catalog;
        return InkWell(
          onTap: () {},
          splashColor: Colors.teal,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailScreen(item: item),
                  ),
                );
              },
              splashColor: Colors.teal,
              child: GridTile(
                child: Container(
                  padding: EdgeInsets.fromLTRB(2, 2, 2, 51),
                  margin: EdgeInsets.fromLTRB(5, 2, 5, 25),
                  child: Hero(
                    tag: item.id.toString(),
                    child: Image.network(
                      item.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                footer: Container(
                  padding: EdgeInsets.fromLTRB(7, 0, 0, 0),
                  width: 200,
                  height: 92,
                  decoration: BoxDecoration(
                    color: Colors.teal.shade50,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          item.title,
                          style: TextStyle(
                            color: Colors.brown.shade700,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Stack(
                        children: [
                          // title
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 2, 0),
                            child: Text(
                              "${item.desc.substring(0, 34)}..",
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: "assets/fonts/Lato-Regular.ttf",
                                color: Colors.black54,
                              ),
                            ),
                          ),
                          //Rs. symbol
                          Positioned(
                            top: 30,
                            left: 0,
                            child: Container(
                              child: Text(
                                "\u{20B9}",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: "assets/fonts/Lato-Regular.ttf",
                                  color: Colors.brown.shade700,
                                ),
                              ),
                            ),
                          ),
                          //price text

                          Positioned(
                            top: 30,
                            left: 12,
                            child: Container(
                              child: Text(
                                "${item.price.toString()}",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.brown.shade700,
                                ),
                              ),
                            ),
                          ),
                          //catalog != final
                          _AddToCart(catalog: catalog),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _AddToCart extends StatelessWidget {
  final Item? catalog;
  const _AddToCart({Key? key, this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final _catalog = CatalogModel();
    final _cart = CartModel();

    // bool isAdded = _cart.items!.contains(catalog) ?? false;
    bool isAdded = false;
    return Align(
      //Icon Button
      heightFactor: 1.2,
      alignment: AlignmentDirectional(1.3, 1.7),
      child: MaterialButton(
        elevation: 0,
        onPressed: () {
          if (!isAdded) {
            //not in cart then add it in cart
            HapticFeedback.lightImpact();
            isAdded = true;
            final _catalog = CatalogModel();
            final _cart = CartModel();
            _cart.add(catalog!);
            _cart.catalog = _catalog;
          }
        },
        // color: Color.fromRGBO(0, 112, 74, 1),
        color: Colors.teal.shade800,
        textColor: Colors.white,
        child: isAdded
            ? Icon(Icons.done)
            : Icon(
                Icons.add,
                size: 27,
              ),
        padding: EdgeInsets.all(7),
        shape: CircleBorder(),
      ),
    );
  }
}
