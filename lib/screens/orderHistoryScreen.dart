import 'dart:ui';

import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_flutter_demo/models/orderedItems.dart';
import 'package:shop_flutter_demo/utils.dart';
import 'package:velocity_x/velocity_x.dart';

import '../database/dao.dart';

class OrderHistory extends StatefulWidget {
  const OrderHistory({super.key});

  @override
  State<OrderHistory> createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  final ValueNotifier<List<List<OrderedItems>>> _purchasedSportItem = ValueNotifier<List<List<OrderedItems>>>([]);

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final dbDao = DatabaseDao();
    dbDao.getAllOrderedItems().then((value) {
      // Step 1: Group items by a composite key of category and date
      /*var groupedByCategoryAndDate = groupBy(
        value,
            (PurchasedItems item) => '${item.itemCategory}_${item.dateTime}',
      );*/
      var groupedByCategoryAndDate = groupBy(
        value,
            (OrderedItems item) => '${item.dateTime}',
      );

      // Step 2: Convert the grouped map values to a list of lists
      List<List<OrderedItems>> categorizedList = groupedByCategoryAndDate.values.toList();

      // Step 3: Assign the categorized list to _purchasedSportItem
      _purchasedSportItem.value = categorizedList;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text(
          'Past Orders',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        elevation: 4,
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(
          color: Colors.white, // Change this to your desired color
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
          child: ValueListenableBuilder<List<List<OrderedItems>>>(
            valueListenable: _purchasedSportItem,
            builder: (context, purchasedItems, child) {
              if (purchasedItems.isEmpty) {
                return const Center(
                  child: Text(
                    'No purchase history available.',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                );
              }

              return ListView.builder(
                itemCount: purchasedItems.length,
                itemBuilder: (context, index) {
                  final particularPurchasedList = purchasedItems[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 10.0),
                    elevation: 6,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Purchase Order",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                "${particularPurchasedList[0].dateTime}",
                                style: const TextStyle(
                                  fontSize: 10,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ).pSymmetric(h: 16, v: 8),
                          ExpansionTile(
                            title: Text(
                              "Order No: ${particularPurchasedList[0].orderNumber}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.green[900],
                              ),
                            ),
                            children: [
                              Column(
                                children: List.generate(particularPurchasedList.length, (itemIndex) {
                                  return Card(
                                    color: Colors.green[50],
                                    elevation: 2,
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 80,
                                          height: 80,
                                          child: ClipRRect(
                                            borderRadius:
                                            BorderRadius
                                                .circular(10),
                                            child: Image.network(
                                              fit: BoxFit.cover,
                                              "${particularPurchasedList[itemIndex].itemImage}",
                                              loadingBuilder: (context, child, progress) {
                                                if (progress == null) {
                                                  return child;
                                                } else {
                                                  final percentage = (progress.cumulativeBytesLoaded / (progress.expectedTotalBytes ?? 1)) * 100;
                                                  return Center(
                                                    child: Stack(
                                                      alignment: Alignment.center,
                                                      children: [
                                                        CircularProgressIndicator(
                                                          color: Colors.green,
                                                          value: progress.expectedTotalBytes != null
                                                              ? progress.cumulativeBytesLoaded / (progress.expectedTotalBytes ?? 1)
                                                              : null,
                                                        ),
                                                        Text(
                                                          '${percentage.toStringAsFixed(0)}%',
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
                                              Text("${particularPurchasedList[itemIndex].itemName}", style: const TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold)),
                                              Text("${particularPurchasedList[itemIndex].itemMrp}", style: const TextStyle(color: Colors.black, fontSize: 12)),
                                            ],
                                          ).pSymmetric(h: 16),
                                        ),
                                        Container(
                                            decoration: BoxDecoration(
                                                color: Colors.green.withOpacity(0.1),
                                                borderRadius: BorderRadius.circular(8)
                                            ), child: Text(
                                            "${particularPurchasedList[itemIndex].quantity} piece",
                                            style: TextStyle(
                                                color: Colors.green[900],
                                                fontSize: 10)).p(8)),
                                      ],
                                    ).p(8),
                                  ).pSymmetric(h: 2, v: 4);
                                }),
                              ).pSymmetric(h: 4),
                              Text("Order Total : Rs ${getTotalOrderedValue(particularPurchasedList)}", style: const TextStyle(color: Colors.grey,
                                  fontWeight: FontWeight.bold, fontSize: 16)).p(16),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}