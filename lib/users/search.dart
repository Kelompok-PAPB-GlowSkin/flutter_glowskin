import 'package:flutter/material.dart';
import 'package:glowskin_project/model/product.dart';
import 'package:glowskin_project/users/detailpage.dart';

class SearchPage extends StatefulWidget {
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Product> display_list = List.from(productList);

  void updateList(String value) {
    setState(() {
      display_list = productList
          .where((element) =>
              element.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
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
                onChanged: (value) => updateList(value),
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
              Container(
                child: Expanded(
                  child: display_list.length == 0
                      ? Center(
                          child: Text(
                            "Produk Tidak Ditemukan",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      : ListView.builder(
                          itemCount: display_list.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) => Container(
                                child: ListTile(
                                  contentPadding: const EdgeInsets.all(8.0),
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(builder: (context) {
                                      return DetailPage(productList[index]);
                                    }));
                                  },
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  title: Text(
                                    display_list[index].name,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  trailing: Text(
                                    "${display_list[index].rating}",
                                    style: TextStyle(color: Color(0xff51AD99)),
                                  ),
                                  leading: Image.network(
                                      display_list[index].imageUrl!),
                                ),
                              )),
                ),
              ),
            ]),
      ),
    );
  }
}

