import 'package:flutter/cupertino.dart';

abstract class ProductLoadEvent{}

class ProductFetching extends ProductLoadEvent{
  BuildContext context;

  ProductFetching({required this.context});
}

class ProductCategoryLoad extends ProductLoadEvent{
  BuildContext context;
  String productCategoryLoad;

  ProductCategoryLoad({required this.context, required this.productCategoryLoad});
}