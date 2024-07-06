import 'package:admin/core/utils/assets.dart';
import 'package:admin/feature/Dashboard/presentation/view/widgets/dashboard_view_body.dart';
import 'package:flutter/material.dart';

import 'widgets/build_app_bar.dart';

class DashBoardView extends StatelessWidget {
  const DashBoardView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: BuildAppBar(image: Assets.imagesShoppingCart, title: 'ShopSmart'),
      body: DashBoardViewBody(),
    );
  }
}
