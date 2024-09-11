import 'package:flutter/cupertino.dart';
import '../network/api_call.dart';
import '../network/api_urls.dart';
import '../network/enums.dart';

class ProductServices{
  static dynamic getAllProducts(BuildContext context, Map<String, dynamic> requestBody) async => await CallApi.callApi(base_url, MethodType.post, "/postData", requestBody: requestBody);
}