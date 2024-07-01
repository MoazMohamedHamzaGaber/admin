import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';

import '../../../../Add_Update_product/data/model/product_model.dart';
import 'build_Item.dart';

class CustomGridView extends StatelessWidget {
  const CustomGridView({super.key,required this.products});


  final List<ProductModel> products;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('products').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if(snapshot.hasData) {
          return Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 0,
              horizontal: 10,
            ),
            child: DynamicHeightGridView(
              physics: const BouncingScrollPhysics(),
              builder: (context, index) =>  BuildItemSearch(model: products[index],),
              itemCount: products.length,
              crossAxisCount: 2,
            ),
          ),
        );
        }else{
          return const SizedBox.shrink();
        }
      },
    );
  }
}
