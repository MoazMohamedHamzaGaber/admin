import 'package:admin/feature/Dashboard/presentation/view/widgets/home_view_body.dart';
import 'package:flutter/material.dart';

import 'widgets/build_app_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: BuildAppBar(image: 'assets/images/shopping_cart.png', title: 'ShopSmart'),
      body: HomeViewBody(),
    );
  }
}
