import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_flutter_demo/database/dao.dart';
import 'package:shop_flutter_demo/events/productLoadEvent.dart';
import 'package:shop_flutter_demo/models/normalCardInfo.dart';
import 'package:shop_flutter_demo/models/products.dart';
import 'package:shop_flutter_demo/repositories/ProductRepositories.dart';
import 'package:shop_flutter_demo/state/productLoadState.dart';

class ProductServiceBloc extends Bloc<ProductLoadEvent, ProductLoadState> {
  ProductServiceBloc(super.initialState) {
    on<ProductFetching>(_onProductFetchApiEvent);
  //  on<ProductCategoryLoad>(_onProductItemsInParticularCategories);
  }

  _onProductFetchApiEvent(ProductFetching event, Emitter<ProductLoadState> emit) async {
    emit(ProductDataLoading());
    BuildContext context = event.context;

    var response = await ProductRepository.callGetProductApi(context);

    try {
      response.when(
          idle: () {

          },
          networkFault: (value) {
            emit(ProductLoadError(
                errorMessage: value["occurredErrorDescriptionMsg"]));
          },
          responseSuccess: (value) {
            AllProductResponse successResponse = value as AllProductResponse;
         //   SharedPrefUtils.setUserStringValue(SharedPrefUtils.sportShopResponse, jsonEncode(successResponse));
            context.read<ProductCategoriesCubit>().loadProductsCategory(successResponse, context);
          },
          responseFailure: (value) {
            emit(ProductLoadError(errorMessage: "error msg"));
          },
          failure: (value) {
            emit(ProductLoadError(errorMessage: value["occurredErrorDescriptionMsg"]));
          }
          );
    } catch (e) {
      print("error=========> $e");
    }
  }

  // _onProductItemsInParticularCategories(SportItemsInParticularCategories event, Emitter<SportShopState> emit) {
  //   emit(SportShopItemInParticularCategoriesLoading());
  //   final savedResponse = SharedPrefUtils.getUserStringValue(SharedPrefUtils.sportShopResponse);
  //   var respObj = SportsShopResponse.fromJson(jsonDecode(savedResponse));
  //   if(savedResponse.isNotEmpty) {
  //
  //   } else {
  //
  //   }
  // }
}

class ProductCategoriesCubit extends Cubit<ProductLoadState> {
  ProductCategoriesCubit() : super(ProductCategoriesLoading());

  void loadProductsCategory(AllProductResponse productResponse, BuildContext context) async {
   // final savedResponse = SharedPrefUtils.getUserStringValue(SharedPrefUtils.sportShopResponse);
   // var respObj = AllProductResponse.fromJson(jsonDecode(savedResponse));
    DatabaseDao dbDao = DatabaseDao();

    if (productResponse.products?.isNotEmpty == true) {
      List<ProductItems> list = [];
      List<NormalCardInfo> normalCardInfoList = [];
      productResponse.products?.forEach((productItem) {
        if(productItem.productCategory != null) {
          normalCardInfoList.add(NormalCardInfo(
            imgUrl: productItem.productCategoryImage ?? "",
            info: [productItem.productCategory ?? ""],
            isFavourite: false
          ));

          list.addAll(productItem.productItems?? []);
        }
      });
      context.read<ProductCategoriesOnlyUrlCubit>().loadProductsCategoryUrls(list, context);

        dbDao.getAllMasterProductsByKey("").then((value) async {
          if(value.isEmpty)
            await dbDao.saveAllMasterProduct(list);
        });
      //emit(ProductCategoriesSuccess(result: list));
      emit(ProductInfoWithUrlSuccess(result: normalCardInfoList));
    }
    }
}

class ProductsViaSearchCubit extends Cubit<ProductLoadState> {
  ProductsViaSearchCubit() : super(ProductCategoriesLoading());

  void loadProductsCategory(AllProductResponse productResponse, BuildContext context) async {
    // final savedResponse = SharedPrefUtils.getUserStringValue(SharedPrefUtils.sportShopResponse);
    // var respObj = AllProductResponse.fromJson(jsonDecode(savedResponse));

    if (productResponse.products?.isNotEmpty == true) {
      List<ProductItems> list = [];
      List<NormalCardInfo> normalCardInfoList = [];
      productResponse.products?.forEach((productItem) {
        if(productItem.productCategory != null) {
          normalCardInfoList.add(NormalCardInfo(
              imgUrl: productItem.productCategoryImage ?? "",
              info: [productItem.productCategory ?? ""],
              isFavourite: false
          ));

          list.add(ProductItems(
              itemName: productItem.productCategory ?? "",
              itemImage: productItem.productCategoryImage ?? ""
          ));
        }
      });
      context.read<ProductCategoriesOnlyUrlCubit>().loadProductsCategoryUrls(list, context);

      //emit(ProductCategoriesSuccess(result: list));
      emit(ProductInfoWithUrlViaSearchSuccess(result: normalCardInfoList));
    }
  }
}

class ProductCategoriesOnlyUrlCubit extends Cubit<ProductLoadState> {
  ProductCategoriesOnlyUrlCubit() : super(ProductCategoriesLoading());

  void loadProductsCategoryUrls(List<ProductItems> productResponse, BuildContext context) async {
    // final savedResponse = SharedPrefUtils.getUserStringValue(SharedPrefUtils.sportShopResponse);
    // var respObj = AllProductResponse.fromJson(jsonDecode(savedResponse));
    final productUrls = productResponse
        .map((categoryWise) => categoryWise.itemImage)
        .where((image) => image != null)
        .cast<String>()
        .toList();

    if(productUrls.isNotEmpty) {
      emit(ProductCategoriesUrlsSuccess(result: productUrls));
    }
  }
}


// class SportShopItemInParticularCategoriesCubit extends Cubit<SportShopState> {
//   SportShopItemInParticularCategoriesCubit() : super(SportShopCategoriesLoading());
//
//   void loadItemsInCategory(String category) async {
//     final savedResponse = SharedPrefUtils.getUserStringValue(SharedPrefUtils.sportShopResponse);
//     if(savedResponse.isNotEmpty) {
//       var respObj = SportsShopResponse.fromJson(jsonDecode(savedResponse));
//       if (respObj.sportsShop?.isNotEmpty == true) {
//         List<SportsShop>? itemList = respObj.sportsShop?.where((sportsShop) => sportsShop.sportsCategory == category).toList();
//         if(itemList!=null && itemList.isNotEmpty) {
//           emit(SportItemsInCategoriesSuccess(result: itemList[0].sportsItems ?? []));
//         }
//       }
//     }
//   }
// }