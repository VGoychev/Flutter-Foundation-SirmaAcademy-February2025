
import 'package:flutter/material.dart';

class CatalogItem {
    final int id;
    final String name;
    final MaterialColor materialColor;
    bool isAddedToCart = false;
    CatalogItem({required this.id,required this.name, this.materialColor = Colors.grey});

    void cartAction(){
      isAddedToCart = !isAddedToCart;
    }
}