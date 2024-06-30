import 'package:flutter/material.dart';

import '../../../../../core/utils/const.dart';
import 'build_Item_order.dart';

class OrderViewBody extends StatelessWidget {
  const OrderViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Flex(
        direction: Axis.vertical,
        children: [
          Expanded(
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder:(context,index)=>const BuildItemOrder(),
              separatorBuilder:(context,index)=>buildDivider(),
              itemCount: 20,
            ),
          )
        ],
      ),
    );
  }
}
