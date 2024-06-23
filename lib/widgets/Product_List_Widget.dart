import 'package:flutter/material.dart';
import 'package:http_demo/models/product.dart';
import 'package:http_demo/widgets/Product_List_Row_Widget.dart';

class ProductListWidget extends StatefulWidget {
  List<Product> products = <Product>[];

  ProductListWidget(this.products, {super.key}) ;

  @override
  State<StatefulWidget> createState() {
    return ProductListWidgetState();
  }
}

class ProductListWidgetState extends State<ProductListWidget> {
  @override
  Widget build(BuildContext context) {
    return buildProductList(context);
  }

  Widget buildProductList(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10,),
        SizedBox(
          height: 500,
          child: GridView.count(
            crossAxisCount: 2,
            children: List.generate(widget.products.length, (index) {
              return ProductListRowWidget(widget.products[index]);
            }),
          ),
        ),
      ],
    );
  }
}
