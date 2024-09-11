
import 'package:shop_flutter_demo/models/normalCardInfo.dart';
import 'package:shop_flutter_demo/models/products.dart';

abstract class ProductLoadState {}

class ProductDataLoading extends ProductLoadState{

}

class ProductCategoriesLoading extends ProductLoadState{}

// class SportShopItemInParticularCategoriesLoading extends SportShopState{}
//
// class SportShopSuccess extends SportShopState{
//   SportsShopResponse? response;
//
//   SportShopSuccess({required this.response});
// }
//
class ProductCategoriesSuccess extends ProductLoadState{
  List<ProductItems> result;

  ProductCategoriesSuccess({required this.result});
}
class ProductViaSearchSuccess extends ProductLoadState{
  List<ProductItems> result;

  ProductViaSearchSuccess({required this.result});
}


class ProductInfoWithUrlSuccess extends ProductLoadState{
  List<NormalCardInfo> result;

  ProductInfoWithUrlSuccess({required this.result});
}

class ProductInfoWithUrlViaSearchSuccess extends ProductLoadState{
  List<NormalCardInfo> result;

  ProductInfoWithUrlViaSearchSuccess({required this.result});
}
//
// class SportItemsInCategoriesSuccess extends SportShopState{
//   List<SportsItems> result;
//
//   SportItemsInCategoriesSuccess({required this.result});
// }
//
class ProductLoadError extends ProductLoadState {
  String errorMessage;
  ProductLoadError({required this.errorMessage});
}

class ProductCategoriesUrlsSuccess extends ProductLoadState{
  List<String> result;

  ProductCategoriesUrlsSuccess({required this.result});
}

