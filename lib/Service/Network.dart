import 'package:flutter_getx/Models/Product.dart';
import 'package:http/http.dart' as http;

class Network {
  static var client = http.Client();


  static Future<List<Product>> fetchProducts() async {
    var response = await client.get(
        'https://jsonplaceholder.typicode.com/photos');
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return productFromJson(jsonString);
    } else {
      //show error message
      return null;
    }
  }

}