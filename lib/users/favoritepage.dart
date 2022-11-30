import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:glowskin_project/model/product.dart';
import 'package:glowskin_project/users/detailpage.dart';

enum Actions { delete }

class FavoritePage extends StatefulWidget {
  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 40, left: 25, right: 25),
        child: Column(
          children: [
            SizedBox(height: 30),
            Text(
              "Favorite",
              style: TextStyle(
                color: Colors.black,
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Container(
              child: Expanded(
                child: SlidableAutoCloseBehavior(
                  closeWhenOpened: true,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: productList.length,
                      itemBuilder: ((context, index) {
                        final Product product = productList[index];
                        return Slidable(
                          key: Key(product.name),
                          endActionPane: ActionPane(
                            motion: const StretchMotion(),
                            dismissible: DismissiblePane(
                                onDismissed: () =>
                                    _onDismissed(index, Actions.delete)),
                            children: [
                              SlidableAction(
                                backgroundColor: Colors.red,
                                icon: Icons.delete,
                                label: 'Delete',
                                onPressed: (context) =>
                                    _onDismissed(index, Actions.delete),
                              ),
                            ],
                          ),
                          child: buildProductListTile(product),
                        );
                      })),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onDismissed(int index, Actions action) {
    final Product product = productList[index];
    setState(() => productList.removeAt(index));

    switch (action) {
      case Actions.delete:
        _showSnackBar(context, '${product.name} is deleted', Colors.red);
        break;
    }
  }

  void _showSnackBar(BuildContext context, String message, Color color) {
    final snackBar = SnackBar(content: Text(message), backgroundColor: color);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Widget buildProductListTile(Product product) => Builder(builder: (context) {
        return ListTile(
          contentPadding: const EdgeInsets.all(16),
          title: Text(
            product.name,
            style: TextStyle(fontSize: 20),
          ),
          leading: Image.network(product.imageUrl),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return DetailPage(product);
            }));
            final slidable = Slidable.of(context)!;
            final isClosed =
                slidable.actionPaneType.value == ActionPaneType.none;
            if (isClosed) {
              slidable.openStartActionPane();
            }
          },
        );
      });
}
