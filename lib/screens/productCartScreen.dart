import 'dart:math';

import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shop_flutter_demo/models/cartItem.dart';
import 'package:shop_flutter_demo/models/orderedItems.dart';
import 'package:velocity_x/velocity_x.dart';

import '../database/dao.dart';
import '../utils.dart';

class ProductCartPage extends StatefulWidget {
  const ProductCartPage({super.key});

  @override
  State<ProductCartPage> createState() => _ProductCartPageState();
}

class _ProductCartPageState extends State<ProductCartPage> {
  final dbDao = DatabaseDao();
  final ValueNotifier<List<CartItem>> cartedListOfItems = ValueNotifier<List<CartItem>>([]);

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    dbDao.getAlCartProducts().then((value) {
      var groupedByItemName = groupBy(
        value,
            (CartItem item) => '${item.itemName}',
      );
      cartedListOfItems.value = groupedByItemName.values.toList().map((e) => CartItem(itemName: e[0].itemName, itemImage: e[0].itemImage, itemMrp: e[0].itemMrp, itemCategory: e[0].itemCategory, dateTime: e[0].dateTime, quantity: e.sumBy((p0) => p0.quantity?? 0), )).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title:  const Text('Product cart', style: TextStyle(color: Colors.white, fontStyle: FontStyle.normal)),
        elevation: 0,
        backgroundColor: Colors.black,
          iconTheme: const IconThemeData(
            color: Colors.white, // Change this to your desired color
          )
      ),
      body: ValueListenableBuilder(
        valueListenable: cartedListOfItems,
        builder: (context, v, child) {
          print("hritesh builder called");
          return SafeArea(
            child: SizedBox(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              height: MediaQuery
                  .of(context)
                  .size
                  .height,
              child: cartedListOfItems.value.isNotEmpty
                  ? Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Align(
                alignment: Alignment.topLeft,
                child: RichText(
                  maxLines: 1,
                  text: TextSpan(
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                    children: [
                      const TextSpan(text: "You have picked "),
                      TextSpan(
                        text: "${cartedListOfItems.value.length}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.amber,
                        ),
                      ),
                      const TextSpan(text: " products . . "),
                    ],
                  ),
                ).pSymmetric(h: 4, v: 4),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: cartedListOfItems.value.length,
                    itemBuilder: (BuildContext context, int index) {
                      print("hritesh ${index}");
                      return Card(
                        color: Colors.green[50],
                        elevation: 2,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 160,
                              height: 140,
                              child: ClipRRect(
                                borderRadius:
                                BorderRadius
                                    .circular(10),
                                child: Image.network(
                                  fit: BoxFit.cover,
                                  "${cartedListOfItems.value[index].itemImage}",
                                  loadingBuilder: (context, child, progress) {
                                    if (progress == null) {
                                      return child;
                                    } else {
                                      final percentage = (progress
                                          .cumulativeBytesLoaded /
                                          (progress.expectedTotalBytes ?? 1)) *
                                          100;
                                      return Center(
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            CircularProgressIndicator(
                                              color: Colors.green,
                                              value: progress
                                                  .expectedTotalBytes != null
                                                  ? progress
                                                  .cumulativeBytesLoaded /
                                                  (progress
                                                      .expectedTotalBytes ?? 1)
                                                  : null,
                                            ),
                                            Text(
                                              '${percentage.toStringAsFixed(
                                                  0)}%',
                                              style: const TextStyle(
                                                color: Colors.green,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 8,
                                              ),
                                            ),
                                          ],
                                        ).p(8),
                                      );
                                    }
                                  },
                                ).p(2),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("${cartedListOfItems.value[index]
                                      .itemName}", style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                                  Row(
                                    children: [
                                      Text("${cartedListOfItems.value[index]
                                          .itemMrp}", style: const TextStyle(
                                          color: Colors.black, fontSize: 15)),
                                      const SizedBox(width: 8,),
                                      Container(
                                          decoration: BoxDecoration(
                                              color: Colors.green.withOpacity(
                                                  0.1),
                                              borderRadius: BorderRadius
                                                  .circular(8)
                                          ), child: Row(
                                        children: [
                                          Text(
                                              "${cartedListOfItems.value[index]
                                                  .quantity} piece",
                                              style: const TextStyle(
                                                  color: Colors.green,
                                                  fontSize: 15)).p(8),
                                        ],
                                      ))
                                    ],
                                  )
                                ],
                              ).pSymmetric(h: 16),
                            ),
                            Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                     dbDao.deleteCartProduct(cartedListOfItems.value[index].itemName??"");
                                     cartedListOfItems.value.removeAt(index);
                                     cartedListOfItems.notifyListeners();
                                  },
                                  borderRadius: BorderRadius.circular(8),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.red.withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(8)
                                    ),
                                    child: const Icon(Icons.delete, size: 14,
                                        color: Colors.red).p(8),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ).p(8),
                      ).pSymmetric(h: 4, v: 4);
                    }),
              ),
              Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                height: 1,
                color: Colors.black,
              ).pSymmetric(v: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Total", style: TextStyle(color: Colors.black,
                      fontWeight: FontWeight.bold, fontSize: 16)),
                  Text("Rs. ${getTotalCartValue(cartedListOfItems.value)}",
                      style: const TextStyle(color: Colors.black,
                          fontWeight: FontWeight.bold, fontSize: 16)),
                ],
              ).p(10),
              Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.black,
                  child: Center(
                      child: Visibility(
                        visible: true,
                        child: TextButton(
                          onPressed: () {
                            Future.delayed(const Duration(
                                seconds: 3), () async {
                              List<OrderedItems> purchaseItemList = [];
                              int orderNo = generateOrderNumber();
                              for (var item in cartedListOfItems.value) {
                                purchaseItemList.add(
                                    OrderedItems(
                                        orderNumber: "#$orderNo",
                                        itemName: item.itemName,
                                        itemCategory: item.itemCategory,
                                        itemMrp: item.itemMrp,
                                        itemImage: item.itemImage,
                                        quantity: item.quantity,
                                        dateTime: getCurrentTimeInIndia()
                                    )
                                );
                              }
                              if (purchaseItemList.isNotEmpty) {
                                await dbDao.saveAllOrderedItems(
                                    purchaseItemList);
                                await dbDao.deleteAllCartProducts();
                              }
                              Navigator.of(context).popAndPushNamed(
                                  "/orderHistory");
                            });
                          },
                          child: const Text(
                            "Place Order",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )))
              ],
            )
                  : Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.add_shopping_cart, size: 200, color: Colors.black,),
              const Text("Your cart is empty", style: TextStyle(color: Colors.black,
                  fontWeight: FontWeight.bold, fontSize: 22)),
              const SizedBox(height: 50,),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).popAndPushNamed('/productOrder', arguments: {
                      "searchKey": ""
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                    minimumSize: const Size(200, 60), // Set width and height here
                    padding: const EdgeInsets.symmetric(vertical: 20),) ,
                  child: const Text("Start Shopping",
                      style: TextStyle(color: Colors.white, fontSize: 20)))
            ],
          )
          ).p(8),
          );
          },
      ),
    );
  }


  int generateOrderNumber() {
    Random random = Random();
    // Generates a random number between 100000 and 999999
    int orderNumber = 100000 + random.nextInt(900000);
    return orderNumber;
  }
}
