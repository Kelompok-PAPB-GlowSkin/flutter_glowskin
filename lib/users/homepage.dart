import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:glowskin_project/unused/cardproduct.dart';
import 'package:glowskin_project/model/product.dart';
import 'package:glowskin_project/users/detailpage.dart';
import 'package:glowskin_project/widgets/widget_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:glowskin_project/users/profilepage.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'dart:io';

import 'package:glowskin_project/users/search.dart';

int catIndex = 0;

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int id_cat = 0;

  Future filterByCategoryProducts() async {
    try {
      var response;
      id_cat > 0
          ? response =
              await Dio().get(url + '/product/get-product-by-category/$id_cat')
          : response = await Dio().get(url + '/product/get-all-product');
      print(response.data);
      // setState(() {
      //   response.data;
      // });
      return response.data;
    } catch (e) {
      print(e);
      if (e is DioError) {
        print(e.response!.data);
      }
    }
  }

  // String url = Platform.isAndroid ? "http://192.168.1.24:3001" : 'http://localhost:3001';
  String url =
      'https://6b84-2001-448a-6000-2dd-21ad-b7a5-51c6-d7c2.ap.ngrok.io';

  Future getProducts() async {
    var response = await Dio().get(url + '/product/get-all-product');
    try {
      if (response.statusCode == 200) {
        return response.data;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future getUserID() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var dio = Dio();
    var email = prefs.getString('email');
    var response = await dio.get(url + '/user/get-user-by-email/$email');
    prefs.setString('userID', response.data['_id']);
    print(prefs.getString('userID'));
    print(response.data);
    return response.data;
  }

  Future getProductsID(id_barang) async {
    try {
      var dio = Dio();
      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers["accept"] = "application/json";
      SharedPreferences id = await SharedPreferences.getInstance();
      id.setString('id_barang', id_barang);
      var response =
          await dio.get(url + '/product/get-product-by-id/$id_barang');
      // print(response.data);
      MaterialPageRoute route =
          MaterialPageRoute(builder: (context) => DetailPage());
      Navigator.push(context, route);
    } catch (e) {
      return null;
    }
  }

  Future addFavorite(id_barang) async {
    try {
      var dio = Dio();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token')!;
      print(token);
      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers["accept"] = "application/json";
      dio.options.headers["Authorization"] = "Bearer $token";
      SharedPreferences id = await SharedPreferences.getInstance();
      var response = await dio.post(url + '/favorite/add-favorite',
          data: {"id_akun": id.getString('userID'), "id_barang": id_barang});
      print(response.data);
      AlertDialog alert = AlertDialog(
        title: Text('Success'),
        content: Text('Product berhasil ditambahkan ke favorit'),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'))
        ],
      );
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return alert;
          });
      return response.data;
    } catch (e) {
      print(e);
      if (e is DioError) {
        print(e.response!.data);
        AlertDialog alert = AlertDialog(
          title: Text('Error'),
          content: Text(e.response!.data['error']['message']),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'))
          ],
        );
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return alert;
            });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    getProducts();
    getUserID();
    return Scaffold(
      body: ListView(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Row(
              children: [
                Expanded(flex: 1, child: Column()),
                Expanded(
                  flex: 8,
                  child: FutureBuilder(
                    future: filterByCategoryProducts(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 30,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 215,
                                    child: Text(
                                      "Find your favorite skincare",
                                      style: TextStyle(
                                          fontSize: 27,
                                          fontWeight: FontWeight.w800),
                                    ),
                                  ),
                                  Container(
                                    width: 49,
                                    height: 62,
                                    child: OutlinedButton(
                                        onPressed: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) {
                                            return SearchPage();
                                          }));
                                        },
                                        child: Image.asset(
                                          "assets/icon/search.png",
                                        ),
                                        style: OutlinedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(22)),
                                        )),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 25),
                                height: 119,
                                decoration: BoxDecoration(
                                    color: Color(0xffD2EAC2),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 93,
                                      height: 60,
                                      child: Text(
                                        'New Product',
                                        style: TextStyle(
                                            fontSize: 26,
                                            fontWeight: FontWeight.w800),
                                      ),
                                    ),
                                    Image.network(
                                      'https://firebasestorage.googleapis.com/v0/b/glowskin-product.appspot.com/o/product_image%2FJeju.png?alt=media&token=6ddd86f5-c8e0-4df7-bd10-9a734fada7e5',
                                      fit: BoxFit.cover,
                                      alignment: new Alignment(-4.0, -1.0),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: 20),
                              Container(
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      Container(
                                        margin:
                                            const EdgeInsets.only(right: 16),
                                        child: OutlinedButton(
                                            onPressed: () {
                                              setState(() {
                                                id_cat = 0;
                                                filterByCategoryProducts();
                                              });
                                            },
                                            child: Text('All'),
                                            style: WidgetHelper()
                                                .btnCategoryStyle(id_cat == 0
                                                    ? true
                                                    : false)),
                                      ),
                                      Container(
                                        margin:
                                            const EdgeInsets.only(right: 16),
                                        child: OutlinedButton(
                                            onPressed: () {
                                              setState(() {
                                                id_cat = 1;
                                                filterByCategoryProducts();
                                                print(id_cat);
                                              });
                                            },
                                            child: Text('Serum'),
                                            style: WidgetHelper()
                                                .btnCategoryStyle((id_cat == 1)
                                                    ? true
                                                    : false)),
                                      ),
                                      Container(
                                        margin:
                                            const EdgeInsets.only(right: 16),
                                        child: OutlinedButton(
                                            onPressed: () {
                                              setState(() {
                                                id_cat = 2;
                                                filterByCategoryProducts();
                                                print(id_cat);
                                              });
                                            },
                                            child: Text('Toner'),
                                            style: WidgetHelper()
                                                .btnCategoryStyle((id_cat == 2)
                                                    ? true
                                                    : false)),
                                      ),
                                      Container(
                                        margin:
                                            const EdgeInsets.only(right: 16),
                                        child: OutlinedButton(
                                            onPressed: () {
                                              setState(() {
                                                id_cat = 3;
                                                filterByCategoryProducts();
                                              });
                                            },
                                            child: Text('Essence'),
                                            style: WidgetHelper()
                                                .btnCategoryStyle((id_cat == 3)
                                                    ? true
                                                    : false)),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              Container(
                                height: 360,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: snapshot.data['products'].length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      width: 208,
                                      height: 349,
                                      margin: const EdgeInsets.only(right: 20),
                                      decoration: BoxDecoration(
                                          color: Color(0xFFD9D9D9),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 240,
                                            margin: const EdgeInsets.only(
                                                top: 33,
                                                left: 10,
                                                right: 15,
                                                bottom: 18),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                RotatedBox(
                                                  quarterTurns: -45,
                                                  child: Text(
                                                    snapshot.data['products']
                                                        [index]['nama_barang'],
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Image.network(
                                                    snapshot.data['products']
                                                        [index]['foto_barang'],
                                                    fit: BoxFit.cover,
                                                    alignment:
                                                        (Alignment(-4.0, -1.0)),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                width: 129,
                                                height: 51,
                                                margin: const EdgeInsets.only(
                                                    left: 10),
                                                child: ElevatedButton(
                                                  onPressed: () {
                                                    getProductsID(snapshot
                                                            .data['products']
                                                        [index]['_id']);
                                                  },
                                                  child: Text(
                                                    'Detail',
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                  ),
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: Colors.white,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        25)),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                margin: const EdgeInsets.only(
                                                    left: 6, right: 10),
                                                height: 53,
                                                child: SizedBox.fromSize(
                                                    size: Size(53, 53),
                                                    child: ClipOval(
                                                      child: Material(
                                                        color: Colors.black,
                                                        child: InkWell(
                                                          onTap: (() {
                                                            // getProductsID(snapshot.data['products'][index]['_id']);
                                                            addFavorite(snapshot
                                                                        .data[
                                                                    'products']
                                                                [index]['_id']);
                                                          }),
                                                          child: Icon(
                                                            Icons.favorite,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                                    )),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ]);
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
