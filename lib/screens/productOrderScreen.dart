

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:shop_flutter_demo/widgetUtils/largeCards.dart';
import 'package:shop_flutter_demo/widgetUtils/search_bar.dart';
import 'package:velocity_x/velocity_x.dart';

import '../app_routes/navigateObserver.dart';
import '../database/dao.dart';
import '../models/cartItem.dart';
import '../models/normalCardInfo.dart';
import '../models/products.dart';
import '../utils.dart';

class ProductsOrderPage extends StatefulWidget {
  const ProductsOrderPage({super.key, required this.toShowFavourite, required this.myNavigatorObserver});
  final MyNavigatorObserver myNavigatorObserver;
  final bool toShowFavourite;

  @override
  State<ProductsOrderPage> createState() => _MyProductOrderPageState();
}

class _MyProductOrderPageState extends State<ProductsOrderPage> {

  final dbDao = DatabaseDao();
  Map searchKey = {};
  final ValueNotifier<List<NormalCardInfo>> listOfProducts = ValueNotifier<List<NormalCardInfo>>([]);
  late List<ProductItems> originalListOfProducts = [];
  late List<ProductItems> originalListOfProductsForFilter = [];
  late List<NormalCardInfo> listOfProductForFilter = [];
  late List<String> listOfCategories = [];
  List<String> priceRangeList = ["0-500", "500-1000", "1000-1500", "1500-2000", "2000-2500", "2500-3000", "3000-3500", "3500-4000"];
  late ValueNotifier<String> selectedFilterOption = ValueNotifier<String>("");
  final ValueNotifier<List<CartItem?>> _cartedItem = ValueNotifier<List<CartItem?>>([]);
  final ValueNotifier<List<String>> selectedItems = ValueNotifier<List<String>>([]);
  List<TextEditingController> _controllers = [];



  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    if(selectedItems.value.isEmpty){
      if (widget.toShowFavourite) {
        dbDao.getAllFavouriteProducts().then((value) {
          listOfProducts.value =
              value.map((item) => item.toNormalCardInfo()).toList();

          print("hritesh Prodduct image url list is ${value.map((e) => e.isFavourite)}");
        });
      } else {
        searchKey = ModalRoute.of(context)!.settings.arguments as Map;
        dbDao.getAllMasterProductsByKey(searchKey["searchKey"]).then((value) {
          listOfProducts.value =
              value.map((item) => item.toNormalCardInfo()).toList();
          originalListOfProducts = value;
          originalListOfProductsForFilter = value;
          listOfProductForFilter = listOfProducts.value;
          listOfCategories = value.map((e) => e.itemCategory ?? "").toSet().toList();
        });
      }
    }

    return Scaffold(
      appBar: SearchAppBar(toShowFav : !widget.toShowFavourite, toShowSearchOption: !widget.toShowFavourite, label: widget.toShowFavourite?"My Favourites":"Cotton Jeans...", myNavigatorObserver: widget.myNavigatorObserver, filterIconClick: (){
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Filter Products', style: TextStyle(fontWeight: FontWeight.bold),),
              content: SizedBox(
                width: MediaQuery.of(context).size.width * .8,
                height: MediaQuery.of(context).size.height * .6,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .2,
                      child: Column(
                        children: [
                          TextButton(onPressed: (){ selectedFilterOption.value = "category";  }, child: const Text("Category")),
                          TextButton(onPressed: (){ selectedFilterOption.value = "price"; }, child: const Text("Price Range")),
                        ],
                      ),
                    ),
                    Container(
                      width: 1.0,
                      color: Colors.grey,
                    ),
                    ValueListenableBuilder(
                    valueListenable: selectedFilterOption, builder: (context, v, child) {
                      return Expanded(
                        child: SingleChildScrollView(
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * .75,
                            height: MediaQuery.of(context).size.height,
                            child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                                itemCount: selectedFilterOption.value=="price" ? priceRangeList.length : listOfCategories.length,
                                itemBuilder: (BuildContext ctx, int index) {
                              final item = selectedFilterOption.value=="price" ? priceRangeList[index] :listOfCategories[index];
                              return  ValueListenableBuilder(
            valueListenable: selectedItems, builder: (context, v, child) {
                                return CheckboxListTile(
                                  title: Text(item),
                                  value: selectedItems.value.contains(item),
                                  onChanged: (bool? isChecked) {
                                    setState(() {
                                      if (isChecked == true) {
                                        selectedItems.value.add(item);
                                        selectedItems.notifyListeners();
                                      } else {
                                        selectedItems.value.remove(item);
                                        selectedItems.notifyListeners();
                                      }
                                    });
                                  },
                                ); }
                              );
                            }),
                          ),
                        ),
                      );
                    })
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Cancel'),
                  onPressed: () {
                    selectedItems.value.clear();
                     Navigator.of(context).pop();  // Close the dialog
                  },
                ),
                TextButton(
                  child: const Text('Apply'),
                  onPressed: () {
                    Navigator.of(context).pop();  // Close the dialog
                    listOfProducts.value =
                        listOfProductForFilter.filter((element) =>
                            selectedItems.value.contains(element.info[2])
                        ).toList();
                    listOfProducts.notifyListeners();
                    originalListOfProducts =  originalListOfProductsForFilter.filter((element) =>
                        selectedItems.value.contains(element.itemCategory)
                    ).toList();
                  },
                ),
              ],
            );
          },
        );
      },),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                color: Colors.white,
                child: ValueListenableBuilder(
                    valueListenable: listOfProducts,
                    builder: (context, v, child) {
                      if(listOfProducts.value.isEmpty){
                        return Center(
                          child: Text(
                            widget.toShowFavourite? 'No Item is marked as Favourite!' : 'No Item Found!',
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        );
                      }else {
                        _controllers =
                            List.generate(listOfProducts.value.length,
                                    (index) =>
                                    TextEditingController(text: "0"));
                        return SingleChildScrollView(
                          child: GridView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              // Number of columns in the grid
                              crossAxisSpacing: 8.0,
                              // Spacing between columns
                              mainAxisSpacing: 0.0,
                              // Spacing between rows
                              childAspectRatio: 0.95, // Aspect ratio of each grid item (width/height)
                            ),
                            itemCount: listOfProducts.value.length,
                            itemBuilder: (BuildContext buildContext,
                                int itemIndex) {
                              return LargeCard(
                                normalCardInfo: listOfProducts.value[itemIndex],
                                controller: _controllers[itemIndex],
                                toShowFav: true,
                                toShowOrderBotton: !widget.toShowFavourite,
                                addCallback: () async {
                                  List<CartItem?> currentList = List.from(
                                      _cartedItem.value);
                                  CartItem? itemInCart = currentList
                                      .firstWhere((i) =>
                                  i?.itemName ==
                                      listOfProducts.value[itemIndex].info[0],
                                      orElse: () => null);

                                  if (itemInCart != null) {
                                    if (itemInCart.quantity != null) {
                                      itemInCart.quantity =
                                          itemInCart.quantity! + 1;
                                      currentList.remove(itemInCart);
                                      currentList.add(itemInCart.withCopy(
                                          quantity: itemInCart.quantity));
                                      _cartedItem.value = currentList;
                                      _controllers[itemIndex].text =
                                          itemInCart.quantity.toString();
                                      if (itemInCart.itemName != null) {
                                        await dbDao.deleteCartProduct(
                                            itemInCart.itemName ?? "");
                                        await dbDao.saveProductIntoCart(
                                            itemInCart.withCopy(
                                                dateTime: getCurrentTimeInIndia()));
                                      }
                                    }
                                  } else {
                                    // originalListOfProducts[itemIndex].quantity = 1; // Add quantity property if not present
                                    var newCartItem = originalListOfProducts[itemIndex]
                                        .toCartItem(quantity: 1,
                                        dateTime: getCurrentTimeInIndia());
                                    currentList.add(newCartItem);
                                    _cartedItem.value = currentList;
                                    _controllers[itemIndex].text = '1';
                                    await dbDao.saveProductIntoCart(
                                        newCartItem);
                                  }
                                },
                                removeCallback: () async {
                                  List<CartItem?> currentList = List.from(
                                      _cartedItem.value);
                                  CartItem? itemInCart = currentList
                                      .firstWhere((i) =>
                                  i?.itemName ==
                                      listOfProducts.value[itemIndex].info[0],
                                      orElse: () => null);

                                  if (itemInCart != null) {
                                    if (itemInCart.quantity != null &&
                                        itemInCart.quantity! > 1) {
                                      itemInCart.quantity =
                                          itemInCart.quantity! - 1;
                                      currentList[currentList.indexOf(
                                          itemInCart)] = itemInCart.withCopy(
                                          quantity: itemInCart.quantity);
                                      _cartedItem.value = currentList;
                                      _controllers[itemIndex].text =
                                          itemInCart.quantity.toString();
                                      await dbDao.saveProductIntoCart(
                                          currentList[currentList.indexOf(
                                              itemInCart)]!.withCopy(
                                              dateTime: getCurrentTimeInIndia()));
                                    } else {
                                      currentList.remove(itemInCart);
                                      _cartedItem.value = currentList;
                                      _controllers[itemIndex].text = '0';
                                      await dbDao.deleteCartProduct(itemInCart
                                          .itemName!); // Remove item from database
                                    }
                                  }
                                },
                              ).pSymmetric(h: 2, v: 4);
                            },
                          ),
                        );
                      }
                    }),
              ),
            ),
            ValueListenableBuilder(
                valueListenable: _cartedItem, builder: (context, v, child) {
              return Visibility(
                  visible: _cartedItem.value.isNotEmpty,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pushReplacementNamed("/productCart");
                      },
                      child: Container(
                          decoration: BoxDecoration(color: Colors.black),
                          child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 50.0,
                              child:  Center(
                                child: Text(
                                  "GO TO CART (${getNumberOfItems(_cartedItem.value)} items) - Rs.${getTotalCartValue(_cartedItem.value)}",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                ),
                              ))),
                    ).p(16),
                  )
              );
            })
          ],
        ),
      ),
    );
  }

  onFilterIconClick(BuildContext context) {

  }
}