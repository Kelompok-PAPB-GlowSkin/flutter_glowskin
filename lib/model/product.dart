import 'package:flutter/material.dart';

class Product {
  String name;
  String imageUrl;
  String description;
  String ingredients;
  String review;
  double rating;

  Product(
      {required this.name,
      required this.imageUrl,
      required this.description,
      required this.ingredients,
      required this.review,
      required this.rating});
}

List<Product> productList = [
  Product(
      name: 'Serum',
      imageUrl:
          'https://th.bing.com/th/id/OIP.UbAI9WsLVslqY1WuML-5MwHaKG?pid=ImgDet&rs=1',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud',
      ingredients: 'Vitamin A',
      review: 'review',
      rating: 4.8),
  Product(
      name: 'Toner',
      imageUrl:
          'https://th.bing.com/th/id/OIP.UbAI9WsLVslqY1WuML-5MwHaKG?pid=ImgDet&rs=1',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud',
      ingredients: 'Vitamin A',
      review: 'review',
      rating: 4.8),
  Product(
      name: 'Essence',
      imageUrl:
          'https://th.bing.com/th/id/OIP.UbAI9WsLVslqY1WuML-5MwHaKG?pid=ImgDet&rs=1',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud',
      ingredients: 'Vitamin A',
      review: 'review',
      rating: 4.8),
];
