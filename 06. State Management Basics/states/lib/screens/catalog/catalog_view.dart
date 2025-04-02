// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:states/models/catalog_item.dart';
import 'package:states/screens/catalog/catalog_page.dart';
import 'package:states/widgets/catalog_item_widget.dart';

class CatalogView extends StatelessWidget {
  final CatalogPageState state;
  const CatalogView(this.state, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Catalog"),
        ),
        body: ListView.builder(
            itemCount: state.items == null ? 1 : state.items!.length,
            itemBuilder: (context, index) {
              if (state.items != null) {
                CatalogItem item = state.items![index];
                return CatalogItemWidget(
                  item: item,
                  onToggle: () => state.onToggle(item),
                );
              } else {
                return Center(
                  child: Text("Empty"),
                );
              }
            }));
  }
}
