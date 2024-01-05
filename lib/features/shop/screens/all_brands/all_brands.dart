import 'package:flutter/material.dart';
import 'package:t_store/commons/widgets/appbar/appbar.dart';
import 'package:t_store/commons/widgets/brands/brand_card.dart';
import 'package:t_store/commons/widgets/layouts/grid_layout.dart';
import 'package:t_store/commons/widgets/texts/section_heading.dart';
import 'package:t_store/utils/constants/sizes.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App bar
      appBar: WAppBar(
        title: const Text('Brands'),
        showBackArrow: true,
      ),
      // Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(children: [
            // Heading
            SectionHeading(
              title: 'Brands',
              showActionButton: false,
            ),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            // Grid Brands
            GridLayout(
                itemCount: 20,
                mainAxisExtent: 80,
                itemBuilder: (_, index) => BrandCard())
          ]),
        ),
      ),
    );
  }
}
