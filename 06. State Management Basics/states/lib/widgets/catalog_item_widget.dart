import 'package:flutter/material.dart';
import 'package:states/models/catalog_item.dart';

class CatalogItemWidget extends StatelessWidget {
  final CatalogItem item;
  final Function()? onToggle;
  const CatalogItemWidget({required this.item, this.onToggle, super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(item.name),
      leading: Container(height: 50, width: 50, color: item.materialColor),
      trailing: IconButton(
          onPressed: onToggle ?? () {},
          icon: Icon(item.isAddedToCart ? Icons.check : Icons.add,
          color: item.isAddedToCart ? Colors.green : Colors.blue,)),
    );
  }
}
