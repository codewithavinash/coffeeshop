import 'package:coffee_shop/models/catalog.dart';

class CartModel {
  //catalog field
  CatalogModel? _catalog;

  //collection of IDs of each item
  final List<int> _itemsIds = [];

//getter makes copy of real _catalog
  CatalogModel? get catalog => _catalog;

  //setter
  set catalog(CatalogModel? newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  //mapping items with ids
  List<Item>? get items =>
      _itemsIds.map((id) => _catalog!.getById(id)).toList();

  //get total price
  num get totalPrice =>
      items!.fold(0, (total, current) => total + current.price);

  // Add Item
  void add(Item item) {
    _itemsIds.add(item.id);
  }

  //Remove Item
  void remove(Item item) {
    _itemsIds.remove(item.id);
  }
}
