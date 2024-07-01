import 'package:admin/feature/Add_Update_product/presentation/view/widgets/add_update_view_body.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/components.dart';
import '../../data/model/product_model.dart';

class AddUpdateView extends StatelessWidget {
  const AddUpdateView({super.key, required this.isUpdate, required this.model});

  final bool isUpdate;
  final ProductModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        context: context,
        centerTitle: true,
        text:isUpdate? 'Update a Product':'Upload a new product',
        function: (){
          Navigator.pop(context);
        },
      ),
      body: AddUpdateViewBody(isUpdate: isUpdate, model: model,),
    );
  }
}
