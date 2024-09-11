
import 'package:intl/intl.dart';
import 'package:shop_flutter_demo/models/cartItem.dart';
import 'package:shop_flutter_demo/models/orderedItems.dart';

String getCurrentTimeInIndia() {
  final now = DateTime.now().toUtc().add(const Duration(hours: 5, minutes: 30));
  final formatter = DateFormat('dd MMM, yyyy HH:mm:ss aa');
  return formatter.format(now);
}

double getTotalCartValue(List<CartItem?> value) {
  double total = 0.0;
  for (var item in value) {
    String mrp = item?.itemMrp?.split(" ")[1] ?? "0.0";
    int qty = item?.quantity ?? 0;
    double totalMrp = double.parse(mrp) *  qty;
    total += totalMrp;
  }
  return double.parse(total.toStringAsFixed(2));
}

int getNumberOfItems(List<CartItem?> value) {
  int total = 0;
  for (var item in value) {
    int qty = item?.quantity ?? 0;
    total += qty;
  }
  return total;
}

double getTotalOrderedValue(List<OrderedItems> value) {
  double total = 0.0;
  for (var item in value) {
    String mrp = item?.itemMrp?.split(" ")[1] ?? "0.0";
    int qty = item?.quantity ?? 0;
    double totalMrp = double.parse(mrp) *  qty;
    total += totalMrp;
  }
  return double.parse(total.toStringAsFixed(2));
}