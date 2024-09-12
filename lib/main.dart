import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_flutter_demo/screens/mainScreen.dart';
import 'package:shop_flutter_demo/screens/orderHistoryScreen.dart';
import 'package:shop_flutter_demo/screens/productCartScreen.dart';
import 'package:shop_flutter_demo/screens/productOrderScreen.dart';
import 'package:shop_flutter_demo/screens/homeScreen.dart';
import 'package:shop_flutter_demo/state/productLoadState.dart';

import 'app_routes/navigateObserver.dart';
import 'blocs/ProductsBloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final MyNavigatorObserver myObserver = MyNavigatorObserver();
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      navigatorObservers: [myObserver],
      routes: {
            '/' : (context) => const MainScreen(),
            '/products' : (context) => MultiBlocProvider(
                  providers: [
                    BlocProvider<ProductServiceBloc>(
                      create: (BuildContext context) => ProductServiceBloc(ProductDataLoading())
                    ),
                    BlocProvider<ProductCategoriesCubit>(
                        create: (BuildContext context) => ProductCategoriesCubit()
                    ),
                    BlocProvider<ProductCategoriesOnlyUrlCubit>(
                        create: (BuildContext context) => ProductCategoriesOnlyUrlCubit()
                    ),
                  ],
                  child: HomePage(title: 'Products', myNavigatorObserver: myObserver,)
                ),
        '/productOrder' : (context) =>  ProductsOrderPage(toShowFavourite: false, myNavigatorObserver: myObserver,),
        '/productFavourite' : (context) =>  ProductsOrderPage(toShowFavourite: true, myNavigatorObserver: myObserver,),
        '/productCart' : (context) => const ProductCartPage(),
        '/orderHistory' : (context) => const OrderHistory()
    },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      color: Colors.white,
      initialRoute: '/products',
    );
  }
}


