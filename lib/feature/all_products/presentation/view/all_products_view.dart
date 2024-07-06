import 'package:admin/feature/all_products/presentation/view/widgets/all_products_view_body.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/components.dart';
import '../../../../core/utils/const.dart';
import '../../../Dashboard/presentation/view/dashboard_view.dart';

class AllProductsView extends StatelessWidget {
  const AllProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context: context,text: 'Search',
          function: (){
            navigateAndFinish(context, const DashBoardView());
          }
      ),
      body: const AllProductsViewBody(),
    );
  }
}
