import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:glowskin_project/model/product.dart';
import 'package:glowskin_project/users/landingpage2.dart';

class DetailPage extends StatelessWidget {
  final Product product;

  DetailPage(this.product);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //     title: Text(
      //   'Detail',
      // )),
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Row(
            children: [
              Expanded(flex: 1, child: Column()),
              Expanded(
                flex: 8,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: 340,
                      height: 50,
                      margin: const EdgeInsets.only(bottom: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                      borderRadius: BorderRadius.circular(30)),
                                  side: BorderSide(
                                      color: Color(0xFFEDEEF3), width: 2)),
                            ),
                          ),
                          Text(
                            'Detail',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          Container(
                            width: 50,
                            height: 50,
                            child: OutlinedButton(
                              onPressed: () {},
                              child: Icon(
                                Icons.favorite_outline,
                                color: Colors.black,
                                size: 23,
                              ),
                              style: OutlinedButton.styleFrom(
                                  padding: EdgeInsets.all(1),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                  side: BorderSide(
                                      color: Color(0xFFEDEEF3), width: 2)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                        width: 340,
                        height: 380,
                        child: Image.network(product.imageUrl)),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            product.name,
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w700),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Color(0xff51AD99),
                              ),
                              Text(
                                product.rating.toString(),
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.w700),
                              ),
                              Text(
                                '(120 Reviews)',
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.w700),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Text(
                        product.description,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.only(top: 25),
                        alignment: Alignment.topLeft,
                        child: Column(
                          children: [
                            Text(
                              'Kandungan :',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              product.ingredients,
                              textAlign: TextAlign.start,
                            ),
                          ],
                        )),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 25),
                      child: Divider(
                        color: Colors.black,
                        height: 1,
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  Text(product.rating.toString()),
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
                                          child: LinearProgressIndicator(
                                            backgroundColor: Colors.grey[400],
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                                    Color(0xff51AD99)),
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
                                          child: LinearProgressIndicator(
                                            backgroundColor: Colors.grey[400],
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                                    Color(0xff51AD99)),
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
                                          child: LinearProgressIndicator(
                                            backgroundColor: Colors.grey[400],
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                                    Color(0xff51AD99)),
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
                                          child: LinearProgressIndicator(
                                            backgroundColor: Colors.grey[400],
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                                    Color(0xff51AD99)),
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
                                          child: LinearProgressIndicator(
                                            backgroundColor: Colors.grey[400],
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                                    Color(0xff51AD99)),
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
                      margin: const EdgeInsets.only(top: 30, bottom: 17),
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Review',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w700),
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            child: Column(children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Susi',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Color(0xff51AD99),
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Color(0xff51AD99),
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Color(0xff51AD99),
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Color(0xff51AD99),
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Colors.grey,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 13),
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Bagus serumnya cocok untuk muka saya',
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ]),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 32, bottom: 22),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 85,
                              height: 57,
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Icon(Icons.message),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xff51AD99),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 198,
                              height: 57,
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Text(
                                  'Add To Favorite',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xff51AD99),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                ),
                              ),
                            ),
                          ]),
                    )
                  ],
                ),
              ),
              Expanded(flex: 1, child: Column()),
            ],
          ),
        ),
      ),
    );
  }
}
