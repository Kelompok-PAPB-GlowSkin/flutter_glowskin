import 'package:flutter/material.dart';
import 'package:glowskin_project/model/product.dart';

class ProfilPage extends StatefulWidget {
  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: ListView.builder(
                itemCount: productList.length,
                itemBuilder: (context, index) {
                  Product product = productList[index];
                  return Container(
                      child: ListTile(
                    title: Text(product.name),
                    leading: Image.network(product.imageUrl),
                  ));
                })));
  }
}
