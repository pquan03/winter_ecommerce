import 'package:flutter/material.dart';
import 'package:t_store/commons/widgets/appbar/appbar.dart';
import 'package:t_store/utils/constants/sizes.dart';

class SubCategoryScreen extends StatelessWidget {
  const SubCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App bar
      appBar: WAppBar(
        title: const Text('Sports'),
        showBackArrow: true,
      ),
      // body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}
