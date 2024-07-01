import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';

import 'build_Item.dart';

class CustomGridView extends StatelessWidget {
  const CustomGridView({super.key});


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 0,
          horizontal: 10,
        ),
        child: DynamicHeightGridView(
          physics: const BouncingScrollPhysics(),
          builder: (context, index) => const BuildItemSearch(),
          itemCount: 10,
          crossAxisCount: 2,
        ),
      ),
    );
  }
}
