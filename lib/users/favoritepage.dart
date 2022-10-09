import 'package:flutter/material.dart';

class FavoritePage extends StatefulWidget {
  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(top: 40),
              child: const Text(
                'My Favorite',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 16),
              ),
            ),
            SizedBox(height: 20),
            Container(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Container(
                      width: 319,
                      height: 101,
                      margin: const EdgeInsets.all(10),
                      // margin: const EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                      color: Color(0xFFD9D9D9),
                      borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        children: [
                          Container(
                            height: 300,
                            padding: const EdgeInsets.fromLTRB(80, 10, 0, 0),
                            margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                              image: AssetImage(
                                'assets/product.png',
                              ),
                              fit: BoxFit.fitHeight,
                            )),
                          ),
                      
                          Container(
                            child: Column(
                              children: [
                                  Container(
                                    alignment: Alignment.topLeft,
                                    padding: const EdgeInsets.fromLTRB(5, 15, 5, 5),
                                    child: const Text(
                                      'Nama Serum',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15),
                                        )
                                  ),
                                  Container(
                                    alignment: Alignment.topLeft,
                                    padding: const EdgeInsets.all(5),
                                    child: const Text(
                                      'Lorem Ipsum',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 15),
                                        )
                                  ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                              left: 76, right: 10),
                            height: 43,
                            child: SizedBox.fromSize(
                              size: Size(43, 33),
                              child: ClipOval(
                                  child: Material(
                                color: Color.fromARGB(255, 139, 1, 1),
                                child: InkWell(
                                  onTap: () {},
                                  child: Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                    size: 33,
                                    ),),
                                    )),
                                    ),)
                        ],
                      ),
                    )
                  ],
                  
                ),
              ),
            ),
            
            SizedBox(height: 10),
            Container(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Container(
                      width: 319,
                      height: 101,
                      margin: const EdgeInsets.all(10),
                      // margin: const EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                      color: Color(0xFFD9D9D9),
                      borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        children: [
                          Container(
                            height: 300,
                            padding: const EdgeInsets.fromLTRB(80, 10, 0, 0),
                            margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                              image: AssetImage(
                                'assets/product.png',
                              ),
                              fit: BoxFit.fitHeight,
                            )),
                          ),
                      
                          Container(
                            child: Column(
                              children: [
                                  Container(
                                    alignment: Alignment.topLeft,
                                    padding: const EdgeInsets.fromLTRB(5, 15, 5, 5),
                                    child: const Text(
                                      'Nama Serum',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15),
                                        )
                                  ),
                                  Container(
                                    alignment: Alignment.topLeft,
                                    padding: const EdgeInsets.all(5),
                                    child: const Text(
                                      'Lorem Ipsum',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 15),
                                        )
                                  ),
                                  
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                  
                ),
              ),
            ),

            SizedBox(height: 10),
            Container(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Container(
                      width: 319,
                      height: 101,
                      margin: const EdgeInsets.all(10),
                      // margin: const EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                      color: Color(0xFFD9D9D9),
                      borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        children: [
                          Container(
                            height: 300,
                            padding: const EdgeInsets.fromLTRB(80, 10, 0, 0),
                            margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                              image: AssetImage(
                                'assets/product.png',
                              ),
                              fit: BoxFit.fitHeight,
                            )),
                          ),
                      
                          Container(
                            child: Column(
                              children: [
                                  Container(
                                    alignment: Alignment.topLeft,
                                    padding: const EdgeInsets.fromLTRB(5, 15, 5, 5),
                                    child: const Text(
                                      'Nama Serum',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15),
                                        )
                                  ),
                                  Container(
                                    alignment: Alignment.topLeft,
                                    padding: const EdgeInsets.all(5),
                                    child: const Text(
                                      'Lorem Ipsum',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 15),
                                        )),
                              ],),)
                        ],),)
                  ],
                ),
              ),
            ),

            SizedBox(height: 10),
            Container(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Container(
                      width: 319,
                      height: 101,
                      margin: const EdgeInsets.all(10),
                      // margin: const EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                      color: Color(0xFFD9D9D9),
                      borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        children: [
                          Container(
                            height: 300,
                            padding: const EdgeInsets.fromLTRB(80, 10, 0, 0),
                            margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                              image: AssetImage(
                                'assets/product.png',
                              ),
                              fit: BoxFit.fitHeight,
                            )),
                          ),
                      
                          Container(
                            child: Column(
                              children: [
                                  Container(
                                    alignment: Alignment.topLeft,
                                    padding: const EdgeInsets.fromLTRB(5, 15, 5, 5),
                                    child: const Text(
                                      'Nama Serum',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15),
                                        )
                                  ),
                                  Container(
                                    alignment: Alignment.topLeft,
                                    padding: const EdgeInsets.all(5),
                                    child: const Text(
                                      'Lorem Ipsum',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 15),
                                        )
                                  ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                  
                ),
              ),
            ),
            

          ],
        ),
        ),
    );
  }
}
