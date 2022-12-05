import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:glowskin_project/model/product.dart';
import 'package:glowskin_project/users/detailpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchPage extends StatefulWidget {
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  // String url = Platform.isAndroid ? "http://192.168.1.26:3001" : 'http://localhost:3001';
  String url = 'https://6b84-2001-448a-6000-2dd-21ad-b7a5-51c6-d7c2.ap.ngrok.io';

  TextEditingController nama = TextEditingController();

  String item = "";

  _SearchPageState() {
    nama.addListener(() {
      setState(() {
        item = nama.text;
      });
    });
  }

  Future searchProducts() async {
    try {
      var response = await Dio().get(url + '/product/search-product/$item');
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(top: 70, right: 15, bottom: 15, left: 15),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Search for a Skincare",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextField(
                onChanged: (value) => setState(() {
                  searchProducts();
                }),
                controller: nama,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                  hintText: "Search...",
                  prefixIcon: Icon(Icons.search),
                  prefixIconColor: Colors.grey,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              FutureBuilder(
                  future: searchProducts(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Expanded(
                        child: Container(
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: snapshot.data['products'].length,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, index) => Container(
                                    width: 100,
                                    alignment: Alignment.centerLeft,
                                    // margin: const EdgeInsets.only(left: 5),
                                    child: ListTile(
                                      contentPadding: const EdgeInsets.only(
                                          top: 8,
                                          left: 10,
                                          right: 10,
                                          bottom: 8),
                                      onTap: () {
                                        getProductsID(snapshot.data['products']
                                            [index]['_id']);
                                      },
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      title: Container(
                                        width: 50,
                                        padding: EdgeInsets.only(right: 10),
                                        child: Text(
                                          snapshot.data['products'][index]
                                              ['nama_barang'],
                                          overflow: TextOverflow.clip,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      // trailing: Text(
                                      //   "${display_list[index].rating}",
                                      //   style: TextStyle(color: Color(0xff51AD99)),
                                      // ),
                                      trailing: Container(
                                        width: 40,
                                        height: 40,
                                        child: Image.network(
                                          snapshot.data['products'][index]
                                              ['foto_barang'],
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  )),
                        ),
                      );
                    }
                    return Text('Temukan Produk');
                  }),
            ]),
      ),
    );
  }
}
