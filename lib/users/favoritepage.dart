import 'dart:ui';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:glowskin_project/model/product.dart';
import 'package:glowskin_project/users/detailpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum Actions { delete }

class FavoritePage extends StatefulWidget {
  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  String url =
      'https://6b84-2001-448a-6000-2dd-21ad-b7a5-51c6-d7c2.ap.ngrok.io';

  Future getFavoriteByUser() async {
    try {
      var dio = Dio();
      final prefs = await SharedPreferences.getInstance();
      var userID = prefs.getString('userID')!;
      var token = prefs.getString('token')!;
      // print(token);
      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers["accept"] = "application/json";
      dio.options.headers["Authorization"] = "Bearer $token";
      var response = await dio.get(
        url + '/favorite/get-favorite-by-user/$userID',
      );
      // print(response.data['favorites']);
      return response.data;
    } catch (e) {
      print(e);
      if (e is DioError) {
        print(e.response!.data);
        print(e.response!.statusCode);
      }
    }
  }

  Future getProductsByID() async {
    try {
      var dio = Dio();
      final prefs = await SharedPreferences.getInstance();
      var data = getFavoriteByUser().toString();
      var token = prefs.getString('token')!;
      print(data);
      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers["accept"] = "application/json";
      dio.options.headers["Authorization"] = 'Bearer $token';
      var response = await dio.get(
        url + '/product/get-product-by-id/$data',
      );
      print(response.data['products']);
      return response.data;
    } catch (e) {
      print(e);
      if (e is DioError) {
        print(e.response!.data);
        print(e.response!.statusCode);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // getFavoriteByUser();
    getProductsByID();
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
              child: FutureBuilder(
                future: getProductsByID(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Expanded(
                      child: Container(
                        child: SlidableAutoCloseBehavior(
                          closeWhenOpened: true,
                          child: snapshot.data['favorites'] == null
                              ? Container(
                                  child: Center(
                                    child: Text(
                                        "Kamu Belum Memiliki Produk Favorite"),
                                  ),
                                )
                              : ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: snapshot.data['favorites'].length,
                                  itemBuilder: ((context, index) {
                                    // final product =
                                    //     snapshot.data['favorites'][index];
                                    return Slidable(
                                      key: Key(snapshot.data['favorites'][index]
                                          ['nama_barang']),
                                      endActionPane: ActionPane(
                                        motion: const StretchMotion(),
                                        // dismissible: DismissiblePane(
                                        //     onDismissed: () => _onDismissed(
                                        //         index, Actions.delete)),
                                        children: [
                                          SlidableAction(
                                              backgroundColor: Colors.red,
                                              icon: Icons.delete,
                                              label: 'Delete',
                                              onPressed: (context) {}
                                              // _onDismissed(index, Actions.delete),
                                              ),
                                        ],
                                      ),
                                      child: ListTile(
                                        contentPadding:
                                            const EdgeInsets.all(16),
                                        title: Text(
                                          snapshot.data['favorites'][index]
                                              ['nama_barang'],
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        // leading: Image.network(
                                        //     snapshot.data['favorites'][index]
                                        //         ['foto_barang']),
                                        onTap: () {
                                          // Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                                          //   return DetailPage(produc);
                                          // }));
                                          final slidable =
                                              Slidable.of(context)!;
                                          final isClosed =
                                              slidable.actionPaneType.value ==
                                                  ActionPaneType.none;
                                          if (isClosed) {
                                            slidable.openStartActionPane();
                                          }
                                        },
                                      ),
                                    );
                                  })),
                        ),
                      ),
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // void _onDismissed(int index, Actions action) {
  //   final Product product = snapshot.data['products'][index];
  //   setState(() => productList.removeAt(index));

  //   switch (action) {
  //     case Actions.delete:
  //       _showSnackBar(context, '${product.name} is deleted', Colors.red);
  //       break;
  //   }
  // }

  void _showSnackBar(BuildContext context, String message, Color color) {
    final snackBar = SnackBar(content: Text(message), backgroundColor: color);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  // Widget buildProductListTile(Product product) => Builder(builder: (context) {
  //       return
  //     });
}
