import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: ListView(
            children: [
              SizedBox(height: 57),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 215,
                    child: Text(
                      "Find your favorite skincare",
                      style:
                          TextStyle(fontSize: 27, fontWeight: FontWeight.w800),
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
              SizedBox(height: 41),
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
              SizedBox(height: 44),
              Row(
                children: [
                  Container(
                    child: OutlinedButton(
                      onPressed: () {},
                      child: Text('All'),
                      style: ButtonStyle(
                          fixedSize: MaterialStateProperty.all(
                            Size(53, 42),
                          ),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          side: MaterialStateProperty.all(BorderSide(
                              color: Colors.black.withOpacity(0.25)))),
                    ),
                  ),
                  Container(
                    child: OutlinedButton(
                      onPressed: () {},
                      child: Text('Serum'),
                      style: ButtonStyle(
                          fixedSize: MaterialStateProperty.all(
                            Size(87, 42),
                          ),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          side: MaterialStateProperty.all(
                              BorderSide(color: Colors.black))),
                    ),
                  ),
                  Container(
                    child: OutlinedButton(
                      onPressed: () {},
                      child: Text('Toner'),
                      style: ButtonStyle(
                          fixedSize: MaterialStateProperty.all(
                            Size(99, 42),
                          ),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          side: MaterialStateProperty.all(BorderSide(
                              color: Colors.black.withOpacity(0.25)))),
                    ),
                  ),
                  Container(
                    child: OutlinedButton(
                      onPressed: () {},
                      child: Text('Essence'),
                      style: ButtonStyle(
                          fixedSize: MaterialStateProperty.all(
                            Size(99, 42),
                          ),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          side: MaterialStateProperty.all(BorderSide(
                              color: Colors.black.withOpacity(0.25)))),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 29),
              Container(
                child: Row(
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Text(
                            'Serum',
                            style: TextStyle(fontSize: 20),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
