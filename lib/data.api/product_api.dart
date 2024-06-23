import 'dart:async';
//import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ProductApi {
  static Future getProducts() async {
    var url = Uri.parse('http://10.0.2.2:3000/products');
    try {
      var response = await http.get(url);
      /*if(kDebugMode)
        print('Response status: ${response.statusCode}');
      if(kDebugMode)
        print('Response body: ${response.body}');*/
      return response;
    } on TimeoutException catch (e) {
      /*if(kDebugMode)
        print('Request timed out. $e');*/
      return null;
    } catch (e) {
      /*if(kDebugMode)
        print('Error: $e');*/
      return null;
    }
  }

  static Future getProductByCategoryId(int id) async {
    var url = Uri.parse('http://10.0.2.2:3000/products?categoryId=$id');
    try {
      var response = await http.get(url);
      /*if(kDebugMode)
        print('Response status: ${response.statusCode}');
      if(kDebugMode)
        print('Response body: ${response.body}');*/
      return response;
    } catch (e) {
      /*if(kDebugMode)
        print('Error: $e');*/
      return null;
    }
  }
}
