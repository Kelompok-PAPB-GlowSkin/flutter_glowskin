import 'dart:ui';
import 'package:dio/dio.dart';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:glowskin_project/model/product.dart';
import 'package:glowskin_project/users/landingpage2.dart';

class DetailPage extends StatelessWidget {

  String url = Platform.isAndroid ? "http://10.223.244.172:3001" : 'http://localhost:3001';

  Future getDetailbyID() async {
    try{
      SharedPreferences id = await SharedPreferences.getInstance();
      String id_barang = id.getString('id')!;
      print(id_barang);
      var dio = Dio();
      var response = await dio.get(url + '/product/get-product-by-id/$id_barang');
      print(response.data['products']['nama_barang']);
      return response.data;
    }catch(e){
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getDetailbyID(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return Container(
              child: Column(
                children: [
                  Container(
                    height: 300,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(snapshot.data['products']['foto_barang']),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    snapshot.data['products']['nama_barang'],
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    snapshot.data['products']['deskripsi_barang'],
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      )
    );
  }
}

