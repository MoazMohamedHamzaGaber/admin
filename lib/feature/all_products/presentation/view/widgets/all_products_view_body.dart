import 'package:admin/feature/all_products/presentation/view/widgets/custom_grid_view.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/components.dart';

class AllProductsViewBody extends StatefulWidget {
  const AllProductsViewBody({super.key});

  @override
  State<AllProductsViewBody> createState() => _AllProductsViewBodyState();
}

class _AllProductsViewBodyState extends State<AllProductsViewBody> {
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),      child: Column(
        children: [
          buildTextField(
            context: context,
            keyboardType: TextInputType.text,
            controller: searchController,
            title: 'Search',
            prefixIcon: Icons.search_sharp,
          ),
          const CustomGridView(),
        ],
      ),
    );
  }
}
