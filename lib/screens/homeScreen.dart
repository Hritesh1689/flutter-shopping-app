import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_flutter_demo/app_routes/navigateObserver.dart';
import 'package:shop_flutter_demo/state/productLoadState.dart';
import 'package:shop_flutter_demo/widgetUtils/autoSliding.dart';
import 'package:shop_flutter_demo/widgetUtils/largeCards.dart';
import 'package:shop_flutter_demo/widgetUtils/search_bar.dart';
import 'package:velocity_x/velocity_x.dart';

import '../blocs/ProductsBloc.dart';
import '../events/productLoadEvent.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title, required this.myNavigatorObserver});
  final String title;
  final MyNavigatorObserver myNavigatorObserver;

  @override
  State<HomePage> createState() => _MyProductPageState();
}

class _MyProductPageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ProductServiceBloc>(context)
        .add(ProductFetching(context: context));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchAppBar(toShowFav: true, toShowSearchOption: true, label: "Cotton Jeans...", myNavigatorObserver: widget.myNavigatorObserver, filterIconClick: (){},),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocBuilder<ProductCategoriesOnlyUrlCubit, ProductLoadState>(
              builder: (context, state) {
                if(state is ProductCategoriesUrlsSuccess) {
                  return AutoSlidingBanner(imageList: state.result);
                }
                return Container();
              }),
              const Text( "Top Categories",
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize:28)
              ).pOnly(left: 16, top: 16, bottom: 8),
              Expanded(
                child: SizedBox(
                      child: BlocBuilder<ProductCategoriesCubit, ProductLoadState>(
                          builder: (c, state) {
                        if (state is ProductInfoWithUrlSuccess) {
                          return ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: state.result.length,
                              itemBuilder:
                                  (BuildContext buildContext, int itemIndex) {
                                return GestureDetector(
                                  onTap: (){
                                    Navigator.of(context).pushNamed('/productOrder', arguments: {
                                      "searchKey": state.result[itemIndex].info[0]
                                    });
                                  },
                                  child: LargeCard(
                                  normalCardInfo: state.result[itemIndex],
                                  toShowFav: false,
                                  toShowOrderBotton: false,
                                  controller: null,
                                  addCallback: () {},
                                  removeCallback: () {},
                                ).p(8));
                              });
                        }
                        return Container();
                      })),
              ),

            ],
          ),
        ),
      ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag),
              label: 'Orders',
            ),
          ],
          currentIndex: 0,
          backgroundColor: Colors.black,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          onTap: (index){
            if (index == 0) {
              if (widget.myNavigatorObserver.currentRoute != "/products") {
                Navigator.of(context).popAndPushNamed('/products');
              }
            } else if (index == 1) {
              Navigator.of(context).pushNamed("/productCart");
            } else {
              Navigator.of(context).pushNamed(
                  "/orderHistory");
            }
          },

        )
    );
  }
}