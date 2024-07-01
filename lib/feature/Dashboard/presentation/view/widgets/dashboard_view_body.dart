import 'package:flutter/material.dart';

import '../../../data/model/dashboard_model.dart';
import 'build_item.dart';

class DashBoardViewBody extends StatelessWidget {
  const DashBoardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  GridView.count(
      crossAxisCount: 2,
      children: List.generate(DashboardModel.dashboardModel.length, (index) => BuildItem(
        title:  DashboardModel.dashboardModel[index].title,
        image: DashboardModel.dashboardModel[index].image,
        function: DashboardModel.dashboardModel[index].function,
      )),
    );
  }
}
