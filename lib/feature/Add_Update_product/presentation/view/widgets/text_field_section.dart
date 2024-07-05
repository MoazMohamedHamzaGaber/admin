import 'package:admin/core/utils/styles.dart';
import 'package:admin/feature/Add_Update_product/data/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../core/utils/components.dart';
import '../../../../../core/utils/const.dart';

class TextFieldSection extends StatelessWidget {
  const TextFieldSection({super.key, required this.model, required this.isUpdate,required this.cubit});

  final ProductModel model;
  final bool isUpdate;
  final cubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildTextField(
          context: context,
          controller: cubit.titleController,
          title:isUpdate?cubit.titleController.text= model.productTitle:'Product Title',
          keyboardType: TextInputType.multiline,
          maxLength: 80,
          validate: 'Please enter a valid title',
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Flexible(
              flex: 1,
              child: buildTextField(
                  context: context,
                  controller: cubit.priceController,
                  title:isUpdate?cubit.priceController.text= model.productPrice: 'Price',
                  keyboardType: TextInputType.number,
                  validate: 'Price is missing',
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        RegExp(r'^(\d+)?\.?\d{0,2}')
                    ),
                  ],
                  prefix: Text('\$ ',style: AppStyles.style16.copyWith(color: Colors.blue),)
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Flexible(
              flex: 1,
              child: buildTextField(
                context: context,
                controller: cubit.quantityController,
                title:isUpdate?cubit.quantityController.text= model.productQuantity: 'QTY',
                keyboardType: TextInputType.number,
                inputFormatters:  [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                validate: 'Quantity is missing',
              ),
            ),
          ],
        ),
        buildTextField(
          context: context,
          controller: cubit.descriptionController,
          title:isUpdate?cubit.descriptionController.text= model.productDescription: 'Product Description',
          keyboardType: TextInputType.multiline,
          maxLength: 1000,
          //minLines: 3,
          //maxLines: 8,
          validate: 'Description is missing',
          height: 150,
        ),
      ],
    );
  }
}
