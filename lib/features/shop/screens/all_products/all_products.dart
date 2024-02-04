import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:winter_store/commons/widgets/appbar/appbar.dart';
import 'package:winter_store/features/shop/controllers/all_product_controller.dart';
import 'package:winter_store/features/shop/models/product_model.dart';
import 'package:winter_store/features/shop/screens/all_products/widgets/sortable_product.dart';
import 'package:winter_store/utils/constants/sizes.dart';

class AllProductsScreen extends StatelessWidget {
  const AllProductsScreen(
      {super.key, required this.title, this.query, this.futureMethod});

  final String title;
  final Query? query;
  final Future<List<ProductModel>>? futureMethod;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductController());
    return Scaffold(
      // App bar
      appBar: WAppBar(
        title: Text(title),
        showBackArrow: true,
      ),
      // Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: FutureBuilder(
              future: futureMethod ?? controller.fetchProductsByQuery(query),
              builder: ((context, snapshot) {
                const loader = Center(child: CircularProgressIndicator());
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return loader;
                }

                if (!snapshot.hasData ||
                    snapshot.data == null ||
                    snapshot.data!.isEmpty) {
                  return Center(child: Text('No Data Found!'));
                }

                if (snapshot.hasError) {
                  return Center(child: Text('No Data Found!'));
                }

                final products = snapshot.data!;

                return SortableProduct(
                  products: products,
                );
              })),
        ),
      ),
    );
  }
}
