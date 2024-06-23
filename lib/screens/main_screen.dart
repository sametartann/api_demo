import 'package:flutter/material.dart';
import 'package:http_demo/data.api/category_api.dart';
import 'package:http_demo/data.api/product_api.dart';
import 'package:http_demo/models/category.dart';
import 'dart:convert';

import 'package:http_demo/models/product.dart';
import 'package:http_demo/widgets/Product_List_Widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return MainScreenState();
  }
}

class MainScreenState extends State {
  List<Category> categories = <Category>[];
  List<Widget> categoryWidgets = <Widget>[];
  List<Product> products = <Product>[];

  @override
  void initState() {
    getCategoriesFromApi();
    getAllProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping System', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),
      body: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: categoryWidgets,
                ),
              ),
              ProductListWidget(products),
            ],
          )),
    );
  }

  void getCategoriesFromApi() {
    CategoryApi.getCategories().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        this.categories =
            list.map((category) => Category.fromJson(category)).toList();
        getCategoryWidgets();
      });
    });
  }

  List<Widget> getCategoryWidgets() {
    for (int i = 0; i < categories.length; i++) {
      categoryWidgets.add(getCategoryWidget(categories[i]));
    }
    return categoryWidgets;
  }

  Widget getCategoryWidget(Category categori) {
    return MaterialButton(
        onPressed: () {
          getProductByCategoryId(categori);
        },
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: BorderSide(color: Colors.lightGreenAccent)),
        child: Text(categori.categoryName,
            style: TextStyle(color: Colors.blueGrey)));
  }

  void getProductByCategoryId(Category categori) {
    ProductApi.getProductByCategoryId(categori.id).then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        this.products =
            list.map((product) => Product.fromJson(product)).toList();
      });
    });
  }

  void getAllProducts() {
    ProductApi.getProducts().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        this.products =
            list.map((product) => Product.fromJson(product)).toList();
      });
    });
  }
}
