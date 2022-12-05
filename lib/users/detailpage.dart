import 'dart:ui';
import 'package:dio/dio.dart';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:glowskin_project/model/product.dart';
import 'package:glowskin_project/users/landingpage2.dart';

class DetailPage extends StatefulWidget {
  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  TextEditingController _controller = TextEditingController();
  bool _validate = false;

  String reviewtext = "";

  _DetailPageState() {
    _controller.addListener(() {
      setState(() {
        reviewtext = _controller.text;
      });
    });
  }

  // String url = Platform.isAndroid ? "http://192.168.1.26:3001" : 'http://localhost:3001';
  String url =
      'https://6b84-2001-448a-6000-2dd-21ad-b7a5-51c6-d7c2.ap.ngrok.io';

  Future getDetailbyID() async {
    try {
      SharedPreferences id = await SharedPreferences.getInstance();
      String id_barang = id.getString('id_barang')!;
      var dio = Dio();
      var response =
          await dio.get(url + '/product/get-product-by-id/$id_barang');
      return response.data;
    } catch (e) {
      print(e);
      if (e is DioError) {
        print(e.response!.data);
        print(e.response!.statusCode);
      }
    }
  }

  Future createReview(review) async {
    try {
      SharedPreferences akun = await SharedPreferences.getInstance();
      String id_akun = akun.getString('id_akun')!;
      String nama = akun.getString('nama')!;
      SharedPreferences id = await SharedPreferences.getInstance();
      String id_barang = id.getString('id_barang')!;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString('token')!;
      var dio = Dio();
      dio.options.headers["Authorization"] = "Bearer $token";
      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers["accept"] = "application/json";
      var response = await dio.post(url + '/review/add-review', data: {
        "id_akun": id_akun,
        "id_barang": id_barang,
        "nama_akun": nama,
        "review": review
      });
      return response.data;
    } catch (e) {
      print(e);
      if (e is DioError) {
        print(e.response!.data);
        print(e.response!.statusCode);
      }
    }
  }

  Future getReviewByProduct() async {
    try {
      SharedPreferences id = await SharedPreferences.getInstance();
      String id_barang = id.getString('id_barang')!;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString('token')!;
      var dio = Dio();
      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers["accept"] = "application/json";
      dio.options.headers["Authorization"] = "Bearer $token";
      var response =
          await dio.get(url + '/review/get-review-by-product-id/$id_barang');
      print(response.data);
      return response.data;
    } catch (e) {
      print(e);
      if (e is DioError) {
        print(e.response!.data);
        print(e.response!.statusCode);
      }
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
    getReviewByProduct();
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: FutureBuilder(
                    future: getDetailbyID(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Container(
                            child: Row(children: [
                          Expanded(flex: 1, child: Column()),
                          Expanded(
                              flex: 8,
                              child: Column(children: [
                                SizedBox(
                                  height: 30,
                                ),
                                Container(
                                  width: 340,
                                  height: 50,
                                  margin: const EdgeInsets.only(bottom: 15),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: 50,
                                        height: 50,
                                        child: OutlinedButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Icon(
                                            Icons.arrow_back,
                                            color: Colors.black,
                                            size: 24,
                                          ),
                                          style: OutlinedButton.styleFrom(
                                              padding: EdgeInsets.all(1),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30)),
                                              side: BorderSide(
                                                  color: Color(0xFFEDEEF3),
                                                  width: 2)),
                                        ),
                                      ),
                                      Text(
                                        'Detail',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Container(
                                        width: 50,
                                        height: 50,
                                        child: OutlinedButton(
                                          onPressed: () {
                                            addFavorite(snapshot
                                                .data['products']['_id']);
                                          },
                                          child: Icon(
                                            Icons.favorite_outline,
                                            color: Colors.black,
                                            size: 23,
                                          ),
                                          style: OutlinedButton.styleFrom(
                                              padding: EdgeInsets.all(1),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30)),
                                              side: BorderSide(
                                                  color: Color(0xFFEDEEF3),
                                                  width: 2)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                    width: 340,
                                    height: 380,
                                    child: Column(children: [
                                      Container(
                                        height: 300,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage(
                                                snapshot.data['products']
                                                    ['foto_barang']),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ])),
                                Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 15),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          snapshot.data['products']
                                              ['nama_barang'],
                                          style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Color(0xff51AD99),
                                          ),
                                          // Text(
                                          //   product.rating.toString(),
                                          //   style: TextStyle(
                                          //       fontSize: 13, fontWeight: FontWeight.w700),
                                          // ),
                                          Text(
                                            '(120 Reviews)',
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w700),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    snapshot.data['products']
                                        ['deskripsi_barang'],
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                // Container(
                                //     margin: const EdgeInsets.only(top: 25),
                                //     alignment: Alignment.topLeft,
                                //     child: Column(
                                //       children: [
                                //         Text(
                                //           'Kandungan :',
                                //           style: TextStyle(
                                //               fontSize: 16,
                                //               fontWeight: FontWeight.w600),
                                //         ),
                                //         // Text(
                                //         //   product.ingredients,
                                //         //   textAlign: TextAlign.start,
                                //         // ),
                                //       ],
                                //     )),
                                Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 25),
                                  child: Divider(
                                    color: Colors.black,
                                    height: 1,
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                          flex: 4,
                                          child: Column(
                                            children: [
                                              Icon(
                                                Icons.star,
                                                size: 80,
                                                color: Color(0xff51AD99),
                                              ),
                                              // Text(product.rating.toString()),
                                              Text('(120 Review)'),
                                            ],
                                          )),
                                      Expanded(
                                          flex: 7,
                                          child: Column(
                                            children: [
                                              Container(
                                                child: Row(
                                                  children: [
                                                    Icon(
                                                      Icons.star,
                                                      color: Color(0xff51AD99),
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text('5'),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    SizedBox(
                                                      width: 115,
                                                      height: 10,
                                                      child:
                                                          LinearProgressIndicator(
                                                        backgroundColor:
                                                            Colors.grey[400],
                                                        valueColor:
                                                            AlwaysStoppedAnimation<
                                                                    Color>(
                                                                Color(
                                                                    0xff51AD99)),
                                                        value: 110 / 120,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text('110')
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                child: Row(
                                                  children: [
                                                    Icon(
                                                      Icons.star,
                                                      color: Color(0xff51AD99),
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text('4'),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    SizedBox(
                                                      width: 115,
                                                      height: 10,
                                                      child:
                                                          LinearProgressIndicator(
                                                        backgroundColor:
                                                            Colors.grey[400],
                                                        valueColor:
                                                            AlwaysStoppedAnimation<
                                                                    Color>(
                                                                Color(
                                                                    0xff51AD99)),
                                                        value: 10 / 120,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text('10')
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                child: Row(
                                                  children: [
                                                    Icon(
                                                      Icons.star,
                                                      color: Color(0xff51AD99),
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text('3'),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    SizedBox(
                                                      width: 115,
                                                      height: 10,
                                                      child:
                                                          LinearProgressIndicator(
                                                        backgroundColor:
                                                            Colors.grey[400],
                                                        valueColor:
                                                            AlwaysStoppedAnimation<
                                                                    Color>(
                                                                Color(
                                                                    0xff51AD99)),
                                                        value: 0 / 120,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text('0')
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                child: Row(
                                                  children: [
                                                    Icon(
                                                      Icons.star,
                                                      color: Color(0xff51AD99),
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text('2'),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    SizedBox(
                                                      width: 115,
                                                      height: 10,
                                                      child:
                                                          LinearProgressIndicator(
                                                        backgroundColor:
                                                            Colors.grey[400],
                                                        valueColor:
                                                            AlwaysStoppedAnimation<
                                                                    Color>(
                                                                Color(
                                                                    0xff51AD99)),
                                                        value: 0 / 120,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text('0')
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                child: Row(
                                                  children: [
                                                    Icon(
                                                      Icons.star,
                                                      color: Color(0xff51AD99),
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text('1'),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    SizedBox(
                                                      width: 115,
                                                      height: 10,
                                                      child:
                                                          LinearProgressIndicator(
                                                        backgroundColor:
                                                            Colors.grey[400],
                                                        valueColor:
                                                            AlwaysStoppedAnimation<
                                                                    Color>(
                                                                Color(
                                                                    0xff51AD99)),
                                                        value: 0 / 120,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text('0')
                                                  ],
                                                ),
                                              ),
                                            ],
                                          )),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(
                                      top: 30, bottom: 17),
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Review',
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                                Container(
                                  height: 100,
                                  child: FutureBuilder(
                                    future: getReviewByProduct(),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        return ListView.builder(
                                          scrollDirection: Axis.vertical,
                                          itemCount:
                                              snapshot.data['reviews'].length,
                                          itemBuilder: (context, index) {
                                            return Container(
                                              child: Column(
                                                children: [
                                                  Container(
                                                    height: 80,
                                                    child: Column(children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            snapshot.data[
                                                                        'reviews']
                                                                    [index]
                                                                ['nama_akun'],
                                                            style: TextStyle(
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                          ),
                                                          Container(
                                                            child: Row(
                                                              children: [
                                                                Icon(
                                                                  Icons.star,
                                                                  color: Color(
                                                                      0xff51AD99),
                                                                ),
                                                                Icon(
                                                                  Icons.star,
                                                                  color: Color(
                                                                      0xff51AD99),
                                                                ),
                                                                Icon(
                                                                  Icons.star,
                                                                  color: Color(
                                                                      0xff51AD99),
                                                                ),
                                                                Icon(
                                                                  Icons.star,
                                                                  color: Color(
                                                                      0xff51AD99),
                                                                ),
                                                                Icon(
                                                                  Icons.star,
                                                                  color: Colors
                                                                      .grey,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Container(
                                                        margin: const EdgeInsets
                                                            .only(top: 13),
                                                        alignment:
                                                            Alignment.topLeft,
                                                        child: Text(
                                                          snapshot.data[
                                                                  'reviews']
                                                              [index]['review'],
                                                          style: TextStyle(
                                                              fontSize: 13,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                        ),
                                                      ),
                                                    ]),
                                                  )
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                      } else {
                                        return Container(
                                          child: Text('No Review'),
                                        );
                                      }
                                    },
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(
                                      top: 32, bottom: 22),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: 85,
                                          height: 57,
                                          child: ElevatedButton(
                                            onPressed: () =>
                                                _dialogBuilder(context),
                                            child: Icon(Icons.message),
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  Color(0xff51AD99),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(24),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: 198,
                                          height: 57,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              addFavorite(snapshot
                                                  .data['products']['_id']);
                                            },
                                            child: Text(
                                              'Add To Favorite',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.white),
                                            ),
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  Color(0xff51AD99),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(24),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]),
                                ),
                              ])),
                          Expanded(flex: 1, child: Column()),
                        ]));
                      }
                      return Center(child: CircularProgressIndicator());
                    }))));
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Review'),
          content: TextField(
            controller: _controller,
            autofocus: true,
            decoration: InputDecoration(
              hintText: 'Tulis ulasan',
            ),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Submit'),
              onPressed: () {
                createReview(_controller.text);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
