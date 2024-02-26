import 'package:flutter/material.dart';
import 'package:full_store_app/data/models/items_model/item.dart';
import 'package:full_store_app/views/home_views/widgets/product_item2.dart';

class SpecialOffersGrid extends StatelessWidget {
  const SpecialOffersGrid({super.key, required this.items});
  final List<ItemModel> items;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 0.7,
        ),
        itemBuilder: (context, index) {
          return ProductItem2(
            item: items[index],
          );
        },
        itemCount: items.length);
  }
}
