import 'package:coffee_shop/models/catalog.dart';
import 'package:coffee_shop/widgets/drawer.dart';
import 'package:coffee_shop/widgets/item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; //rootbundle (loading json file)
import 'dart:convert'; //json decoding

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
      appBar: AppBar(
        title: Text(
          "coffee shop",
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
            ?
            // ? ListView.builder(
            //     itemCount: CatalogModel.items.length,
            //     itemBuilder: (context, index) {
            //       return ItemWidget(
            //         item: CatalogModel.items[index],
            //       );
            //     },
            //   )
            GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                ),
                itemCount: CatalogModel.items.length,
                itemBuilder: (context, index) {
                  final item = CatalogModel.items[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: GridTile(
                      header: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(color: Colors.deepPurple),
                        child: Text(
                          item.title,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      child: Image.network(item.image),
                      footer: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(color: Colors.deepPurple),
                        child: Text(
                          item.price.toString(),
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  );
                },
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
      drawer: MyDrawer(),
    );
  }
}
