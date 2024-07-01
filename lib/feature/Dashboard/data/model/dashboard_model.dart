import 'package:admin/feature/all_products/presentation/view/all_products_view.dart';

import '../../../../core/utils/const.dart';
import '../../../Add_Update_product/presentation/view/add_update_view.dart';
import '../../../Order/presentation/view/order_view.dart';

class DashboardModel {
  late final String image;
  late final String title;
  late final Function function;

  DashboardModel({
    required this.title,
    required this.image,
    required this.function,
  });

  static List<DashboardModel> dashboardModel = [
    DashboardModel(
      title: 'Add a new product',
      image: 'assets/images/dashboard/cloud.png',
      function: (context) {
        navigateTo(
            context,
            const AddUpdateView());
      },
    ),
    DashboardModel(
      title: 'Inspect all products',
      image: 'assets/images/shopping_cart.png',
      function: (context) {
        navigateTo(context, const AllProductsView());
      },
    ),
    DashboardModel(
      title: 'View Order',
      image: 'assets/images/dashboard/order.png',
      function: (context) {
        navigateTo(context, const OrderView());
      },
    ),
  ];
}
