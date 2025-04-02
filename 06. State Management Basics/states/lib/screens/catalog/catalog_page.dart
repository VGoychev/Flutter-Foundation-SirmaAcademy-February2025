import 'package:flutter/material.dart';
import 'package:states/models/catalog_item.dart';
import 'package:states/screens/catalog/catalog_view.dart';

class CatalogPage extends StatefulWidget{
  const CatalogPage({super.key});
  @override
  CatalogPageState createState() => CatalogPageState();
}

class CatalogPageState extends State<CatalogPage>{
  List<CatalogItem>? items;

  @override
  void initState() {
    setCatalogItems();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return CatalogView(this);
  }

  void setCatalogItems(){
    items = [
    CatalogItem(id: 0, name: "Red", materialColor: Colors.red),
    CatalogItem(id: 1, name: "Blue", materialColor: Colors.blue),
    CatalogItem(id: 2, name: "Green", materialColor: Colors.green),
    CatalogItem(id: 3, name: "Unknown")
  ];
  }

  void onToggle(CatalogItem item){
    setState(() {
    item.cartAction();
    });
  }

}