import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:shop_flutter_demo/dummy_data.dart';
import 'package:shop_flutter_demo/models/products.dart';
import 'package:shop_flutter_demo/services/product_services.dart';

import '../result.dart';


class ProductRepository{

   static Future<Result<dynamic>> callGetProductApi(BuildContext context) async {

      dynamic jsonMap = await ProductServices.getAllProducts(context, jsonDecode(allProduct));
  //   dynamic jsonMap = jsonDecode(allProduct);

     try {
       var respObj = AllProductResponse.fromJson(jsonMap);
       return Result.responseSuccess(data: respObj);
     } catch (e) {
       if (jsonMap["occurredErrorDescriptionMsg"] == "No connection") {
         return Result.networkFault(data: jsonMap);
       } else {
         return Result.failure(
             data: jsonMap["occurredErrorDescriptionMsg"] != null ? jsonMap : {
               "occurredErrorDescriptionMsg": e
             });
       }
     }
   }
}

