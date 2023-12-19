import 'package:flutter/material.dart';
import 'package:t_store/commons/widgets/appbar/appbar.dart';
import 'package:t_store/commons/widgets/products/cart/cart_menu_icon.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WAppBar(
        title: Text(
          "Store",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        actions: [CartCounterIcon(onPressed: () {})],
      ),
      body: NestedScrollView(
        headerSliverBuilder: (_, innerBoxIsScrolled) {
          return [];
        },
        body: Container(),
      ),
    );
  }
}
