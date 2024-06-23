import 'package:flutter/material.dart';
import 'package:http_demo/models/product.dart';

class ProductListRowWidget extends StatelessWidget{

  Product product;

  ProductListRowWidget(this.product){}

  @override
  Widget build(BuildContext context) {

    return buildProductItemCard(context);
  }

  Widget buildProductItemCard(BuildContext context) {
    return InkWell(
      child: Card(
        child: Column(
          children: [
            Container(
              height: 110,
              width: MediaQuery.of(context).size.width / 2.0 ,
              child: Image.network("https://i.pinimg.com/736x/27/f2/02/27f202975f0473774cd0d21067a16709.jpg"),
            ),
            Text(product.productName),
            Text("${product.unitPrice} TL", style: TextStyle(fontSize: 18, color: Colors.red)),
          ],
        ),
      ),
    );
  }

}