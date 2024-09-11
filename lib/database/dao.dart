
import 'package:sembast/sembast.dart';
import 'package:shop_flutter_demo/models/cartItem.dart';
import 'package:shop_flutter_demo/models/orderedItems.dart';
import 'package:shop_flutter_demo/models/products.dart';
import 'package:velocity_x/velocity_x.dart';

import 'db.dart';

class DatabaseDao {
  // Private constructor
  DatabaseDao._internal();

  // Static instance of the class
  static final DatabaseDao _instance = DatabaseDao._internal();

  // Factory constructor to return the singleton instance
  factory DatabaseDao() {
    return _instance;
  }

  Future<void> saveAllMasterProduct(List<ProductItems> productItems) async {
    final db = await ShopDb().db;
    final store = intMapStoreFactory.store('master_product_items');

    await db.transaction((txn) async {
      for (ProductItems item in productItems) {
      //  await store.add(txn, item.toJson());
        await store.record(item.itemId!).put(txn, item.toJson());
      }
    });
  }

  Future<List<ProductItems>> getAllMasterProductsByKey(String key) async {
    final db = await ShopDb().db;
    final store = intMapStoreFactory.store('master_product_items');

    final finder = Finder(
      filter: Filter.custom((record) {
        final itemName = record['itemCategory'] as String;
        return itemName.toLowerCase().contains(key.toLowerCase());
      }),
    );

    final records = await store.find(db, finder: finder);

    return records.map((record) {
      return ProductItems.fromJson(record.value);
    }).toList();
  }

  Future<List<ProductItems>> getAllFavouriteProducts() async {
    final db = await ShopDb().db;
    final store = intMapStoreFactory.store('master_product_items');

    // final finder = Finder(filter: Filter.equals('isFavourite', true));

    final records = await store.find(db);

    return records.map((record) {
      return ProductItems.fromJson(record.value);
    }).filter((item){ return item.isFavourite ?? false; }).toList();
  }

  Future<void> saveProductIntoCart(CartItem cartItem) async {
    final db = await ShopDb().db;
    final store = intMapStoreFactory.store('cart_items');
    await store.add(db, cartItem.toJson());
  }

  Future<List<CartItem>> getCartProductsByCategory(String category) async {
    final db = await ShopDb().db;
    final store = intMapStoreFactory.store('cart_items');
    
    final finder = Finder(
      filter: Filter.equals('itemCategory', category),
    );

    final records = await store.find(db, finder: finder);

    return records.map((record) {
      return CartItem.fromJson(record.value);
    }).toList();
  }



  // Delete operation
  Future<int> deleteCartProduct(String productName) async {
    final db = await ShopDb().db;
    final store = intMapStoreFactory.store('cart_items');

    final finder = Finder(
      filter: Filter.equals('itemName', productName),
    );

    return await store.delete(db, finder: finder);
  }

  Future<int> deleteAllCartProducts() async {
    final db = await ShopDb().db;
    final store = intMapStoreFactory.store('cart_items');

    // Delete all records in the store
    return await store.delete(db);
  }

  Future<List<CartItem>> getAlCartProducts() async {
    final db = await ShopDb().db;
    final store = intMapStoreFactory.store('cart_items');

    final records = await store.find(db);

    return records.map((record) {
      return CartItem.fromJson(record.value);
    }).toList();
  }

  Future<void> savePurchasedItems(OrderedItems productItem) async {
    final db = await ShopDb().db;
    final store = intMapStoreFactory.store('ordered_items');
    await store.add(db, productItem.toJson());
  }

  // Update operation
  /*Future<int> updateSportItemQuantity(SportsItems sportItem) async {
    final db = await SportsDb().db;
    final store = intMapStoreFactory.store('sport_items');

    final finder = Finder(
      filter: Filter.equals('sportItemName', sportItem),
    );

    return await store.update(db, sportItem.toJson(), finder: finder);
  }*/

  Future<void> markItemFavourite(String itemName, bool favourite) async {
    final db = await ShopDb().db;
    final store = intMapStoreFactory.store('master_product_items');

    final finder = Finder(
      filter: Filter.equals('itemName', itemName),
      limit: 1
    );

    final records = await store.find(db, finder: finder);

     var list = records.map((record) {
      return ProductItems.fromJson(record.value);
     }).toList();

     list[0].isFavourite = favourite;
     await store.update(db, list[0].toJson(), finder: finder);
  }

  Future<List<OrderedItems>> getPurchasedItemsByOrderNo(String orderNumber) async {
    final db = await ShopDb().db;
    final store = intMapStoreFactory.store('ordered_items');

    final finder = Finder(
      filter: Filter.equals('orderNumber', orderNumber),
    );

    final records = await store.find(db, finder: finder);

    return records.map((record) {
      return OrderedItems.fromJson(record.value);
    }).toList();
  }

  Future<void> saveAllOrderedItems(List<OrderedItems> orderedItems) async {
    final db = await ShopDb().db;
    final store = intMapStoreFactory.store('ordered_items');

    // Using batch operation to save all items at once
    await db.transaction((txn) async {
      for (OrderedItems item in orderedItems) {
        await store.add(txn, item.toJson());
      }
    });
  }

  Future<List<OrderedItems>> getAllOrderedItems() async {
    final db = await ShopDb().db;
    final store = intMapStoreFactory.store('ordered_items');

    final records = await store.find(db);

    return records.map((record) {
      return OrderedItems.fromJson(record.value);
    }).toList();
  }

  Future<int> deleteAllPurchaseItems() async {
    final db = await ShopDb().db;
    final store = intMapStoreFactory.store('ordered_items');
    return await store.delete(db);
  }

}