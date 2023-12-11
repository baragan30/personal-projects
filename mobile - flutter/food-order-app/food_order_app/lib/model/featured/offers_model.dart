import 'package:food_order_app/model/types/priority_type.dart';

class OffersModel implements Comparable<OffersModel> {
  late String id;

  late String title;
  late PriorityType priority;

  OffersModel({required this.title, required this.priority}) {
    id = title;
  }

  @override
  int compareTo(OffersModel offer) {
    return priority.index.compareTo(offer.priority.index);
  }
}
