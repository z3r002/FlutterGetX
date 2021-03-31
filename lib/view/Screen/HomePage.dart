import 'package:flutter/material.dart';
import 'package:flutter_getx/Controllers/productController.dart';
import 'package:flutter_getx/view/Widgets/Card.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              if (productController.isLoading.value)
                return Center(child: CircularProgressIndicator());
              else
                return GridView.builder(
                  itemCount: productController.productList.length,
                  itemBuilder: (context, index) {
                    return ProductTile(productController.productList[index]);
                  },
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16),
                );
            }),
          )
        ],
      ),
    );
  }
}
