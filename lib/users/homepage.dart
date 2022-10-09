import 'package:flutter/material.dart';
import 'package:glowskin_project/model/cardproduct.dart';
import 'package:glowskin_project/model/product.dart';
import 'package:glowskin_project/users/detailpage.dart';
import 'package:glowskin_project/users/profilepage.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 215,
                            child: Text(
                              "Find your favorite skincare",
                              style: TextStyle(
                                  fontSize: 27, fontWeight: FontWeight.w800),
                            ),
                          ),
                          Container(
                            width: 49,
                            height: 62,
                            child: OutlinedButton(
                                onPressed: () {},
                                child: Image.asset(
                                  "assets/icon/search.png",
                                ),
                                style: OutlinedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(22)),
                                )),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        width: 342,
                        height: 119,
                        decoration: BoxDecoration(
                            color: Color(0xffD2EAC2),
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 93,
                              height: 60,
                              child: Text(
                                'New Product',
                                style: TextStyle(
                                    fontSize: 26, fontWeight: FontWeight.w800),
                              ),
                            ),
                            Image.asset(
                              'assets/product.png',
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
                                margin: const EdgeInsets.only(right: 16),
                                child: OutlinedButton(
                                  onPressed: () {},
                                  child: Text('All'),
                                  style: ButtonStyle(
                                      fixedSize: MaterialStateProperty.all(
                                        Size(53, 42),
                                      ),
                                      shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        ),
                                      ),
                                      side: MaterialStateProperty.all(
                                          BorderSide(
                                              color: Colors.black
                                                  .withOpacity(0.25)))),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(right: 16),
                                child: OutlinedButton(
                                  onPressed: () {},
                                  child: Text('Serum'),
                                  style: ButtonStyle(
                                      fixedSize: MaterialStateProperty.all(
                                        Size(87, 42),
                                      ),
                                      shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        ),
                                      ),
                                      side: MaterialStateProperty.all(
                                          BorderSide(color: Colors.black))),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(right: 16),
                                child: OutlinedButton(
                                  onPressed: () {},
                                  child: Text('Toner'),
                                  style: ButtonStyle(
                                      fixedSize: MaterialStateProperty.all(
                                        Size(99, 42),
                                      ),
                                      shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        ),
                                      ),
                                      side: MaterialStateProperty.all(
                                          BorderSide(
                                              color: Colors.black
                                                  .withOpacity(0.25)))),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(right: 16),
                                child: OutlinedButton(
                                  onPressed: () {},
                                  child: Text('Essence'),
                                  style: ButtonStyle(
                                      fixedSize: MaterialStateProperty.all(
                                        Size(99, 42),
                                      ),
                                      shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        ),
                                      ),
                                      side: MaterialStateProperty.all(
                                          BorderSide(
                                              color: Colors.black
                                                  .withOpacity(0.25)))),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                          height: 360,
                          child: ListView.builder(
                              itemCount: productList.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                Product product = productList[index];
                                return Container(
                                  width: 208,
                                  height: 349,
                                  margin: const EdgeInsets.only(right: 20),
                                  decoration: BoxDecoration(
                                      color: Color(0xFFD9D9D9),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Column(children: [
                                    Container(
                                      height: 240,
                                      margin: const EdgeInsets.only(
                                          left: 10,
                                          right: 15,
                                          top: 33,
                                          bottom: 18),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          RotatedBox(
                                            quarterTurns: -45,
                                            child: Text(
                                              product.name,
                                              style: TextStyle(fontSize: 20),
                                            ),
                                          ),
                                          Expanded(
                                            child: Image.network(
                                              product.imageUrl,
                                              fit: BoxFit.cover,
                                              alignment:
                                                  new Alignment(-4.0, -1.0),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          width: 129,
                                          height: 51,
                                          margin:
                                              const EdgeInsets.only(left: 10),
                                          child: ElevatedButton(
                                            onPressed: () {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) {
                                                return DetailPage(
                                                    productList[index]);
                                              }));
                                            },
                                            child: Text(
                                              'Detail',
                                              style: TextStyle(
                                                color: Colors.black,
                                              ),
                                            ),
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.white,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25))),
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
                                                onTap: () {},
                                                child: Icon(
                                                  Icons.favorite,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            )),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ]),
                                );
                              })),
                    ],
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