import 'package:flutter/foundation.dart';
import 'report_model.dart';

class ReportListModel extends ChangeNotifier {
  
  final List<ReportModel> _items = [];
  /// List of items in the cart.
  List<ReportModel> get items => _items;

  /// Adds [item] to cart. This is the only way to modify the cart from outside.
  void add(ReportModel item) {
    _items.add(item);
    // This line tells [Model] that it should rebuild the widgets that
    // depend on it.
    notifyListeners();
  }
}
