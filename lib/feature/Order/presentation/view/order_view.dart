import 'package:admin/core/utils/components.dart';
import 'package:admin/feature/Order/presentation/view/widgets/order_view_body.dart';
import 'package:flutter/material.dart';

class OrderView extends StatelessWidget {
  const OrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context: context,text: 'Placed Orders',
          function: (){
            Navigator.pop(context);
          }
      ),
      body: const OrderViewBody(),
    );
  }
}
