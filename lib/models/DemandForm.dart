import 'package:flutter/foundation.dart';

class DemandForm {
  final String id;
  final String title;
  final String description;
  final double price;
  final String url;
  int fields;
  bool isFavorite;

  DemandForm(
      {@required this.id,
      @required this.title,
      @required this.description,
      this.price,
      this.url,
      this.isFavorite});
}
