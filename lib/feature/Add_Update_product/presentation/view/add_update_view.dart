import 'package:admin/feature/Add_Update_product/presentation/view/widgets/add_update_view_body.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/components.dart';

class AddUpdateView extends StatelessWidget {
  const AddUpdateView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        context: context,
        centerTitle: true,
        text: 'Upload a new product',
        function: (){
          Navigator.pop(context);
        },
      ),
      body: const AddUpdateViewBody(),
    );
  }
}
