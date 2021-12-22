class CatalogModel {
  static final items = [
    Item(
      id: 1,
      title: "Americano",
      desc:
          "Caffè Americano is a type of coffee drink prepared by diluting an espresso with hot water, giving it a similar strength to, but different flavor from, traditionally brewed coffee.",
      price: 170,
      size: "regular",
      image:
          "https://images.unsplash.com/photo-1580661869408-55ab23f2ca6e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=435&q=80",
    )
  ];
}

class Item {
  final int id;
  final String title;
  final String desc;
  final num price;
  final String size;
  final String image;

  Item({
    this.id = 1,
    this.title = "Americano",
    this.desc = "Amaricano Desc",
    this.price = 120,
    this.size = "Regular",
    this.image =
        "https://images.unsplash.com/photo-1580661869408-55ab23f2ca6e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=435&q=80",
  });
}
