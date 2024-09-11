class CartItem {
  String? itemName;
  String? itemImage;
  String? itemMrp;
  String? itemCategory;
  String? dateTime;
  int? quantity;

  CartItem({this.itemName, this.itemImage, this.itemMrp, this.itemCategory, this.dateTime, this.quantity});

  CartItem.fromJson(Map<String, dynamic> json) {
    itemName = json['itemName'];
    itemImage = json['itemImage'];
    itemMrp = json['itemMrp'];
    itemCategory = json['itemCategory'];
    dateTime = json['dateTime'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itemName'] = this.itemName;
    data['itemImage'] = this.itemImage;
    data['itemMrp'] = this.itemMrp;
    data['itemCategory'] = this.itemCategory;
    data['dateTime'] = this.dateTime;
    data['quantity'] = this.quantity;
    return data;
  }

  CartItem withCopy({
    String? itemName,
    String? itemImage,
    String? itemMrp,
    String? itemCategory,
    String? dateTime,
    int? quantity,
  }) {
    return CartItem(
      itemName: itemName ?? this.itemName,
      itemImage: itemImage ?? this.itemImage,
      itemMrp: itemMrp ?? this.itemMrp,
      itemCategory: itemCategory ?? this.itemCategory,
      dateTime: dateTime ?? this.dateTime,
      quantity: quantity ?? this.quantity,
    );
  }
}