class CatalogModel {
  //singleton class
  static final catModel = CatalogModel._internal();
  CatalogModel._internal();
  factory CatalogModel() => catModel;

  static List<Item>? items;

  //   Item(
  //     id: 0,
  //     title: "Americano",
  //     desc:
  //         "Caffè Americano is a type of coffee drink prepared by diluting an espresso with hot water, giving it a similar strength to, but different flavor from, traditionally brewed coffee.",
  //     price: 170,
  //     size: "regular",
  //     image:
  //         "https://images.unsplash.com/photo-1580661869408-55ab23f2ca6e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=435&q=80",
  //   )
  // ];

  //Get Item by ID
  Item getById(int id) =>
      items!.firstWhere((element) => element.id == id, orElse: null);

  //Get Item by Position
  Item getByPosition(int pos) => items![pos];
}

class Item {
  final int id;
  final String title;
  final String desc;
  final num price;
  final String size;
  final String image;

  Item({
    this.id = 0,
    this.title = "default title",
    this.desc = "default description",
    this.price = 120,
    this.size = "Default Regular",
    this.image =
        "https://images.unsplash.com/photo-1580661869408-55ab23f2ca6e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=435&q=80",
  });

  //mapping json data with the help of named constructor
  //constructor para(frontend) <- map (backend)
  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map["id"],
      title: map["title"],
      desc: map["desc"],
      price: map["price"],
      size: map["size"],
      image: map["image"],
    );
  }

  //encode
  // class to map (frontend -> backend)
  toMap() => {
        "id": id,
        "title": title,
        "desc": desc,
        "price": price,
        "size": size,
        "image": image,
      };
}
