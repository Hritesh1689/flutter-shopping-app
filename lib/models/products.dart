import 'package:shop_flutter_demo/models/cartItem.dart';

import 'normalCardInfo.dart';

class AllProductResponse {
  List<Products>? products;

  AllProductResponse({this.products});

  AllProductResponse.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  String? productCategory;
  String? productCategoryImage;
  List<ProductItems>? productItems;

  Products(
      {this.productCategory, this.productCategoryImage, this.productItems});

  Products.fromJson(Map<String, dynamic> json) {
    productCategory = json['product_category'];
    productCategoryImage = json['product_category_image'];
    if (json['product_items'] != null) {
      productItems = <ProductItems>[];
      json['product_items'].forEach((v) {
        productItems!.add(new ProductItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_category'] = this.productCategory;
    data['product_category_image'] = this.productCategoryImage;
    if (this.productItems != null) {
      data['product_items'] =
          this.productItems!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductItems {
  int? itemId;
  String? itemName;
  String? itemImage;
  String? itemMrp;
  String? itemCategory;
  bool? isFavourite = false;

  ProductItems(
      {this.itemId, this.itemName, this.itemImage, this.itemMrp, this.itemCategory, this.isFavourite});

  ProductItems.fromJson(Map<String, dynamic> json) {
    itemId = json['itemId'];
    itemName = json['itemName'];
    itemImage = json['itemImage'];
    itemMrp = json['itemMrp'];
    itemCategory = json['itemCategory'];
    isFavourite = json['favourite'] ?? false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itemId'] = this.itemId;
    data['itemName'] = this.itemName;
    data['itemImage'] = this.itemImage;
    data['itemMrp'] = this.itemMrp;
    data['itemCategory'] = this.itemCategory;
    data['favourite'] = this.isFavourite ?? false;
    return data;
  }

  CartItem toCartItem({
    required int quantity,
    required String dateTime,
  }
  ) {
    return CartItem(
      itemName: itemName,
      itemImage: itemImage,
      itemMrp: itemMrp,
      itemCategory: itemCategory,
      dateTime: dateTime,
      quantity: quantity,
    );
  }

  NormalCardInfo toNormalCardInfo(){
      return NormalCardInfo(imgUrl: itemImage?? "", info: [itemName??"", itemMrp??"", itemCategory?? "" ], isFavourite: isFavourite?? false);
  }
}
