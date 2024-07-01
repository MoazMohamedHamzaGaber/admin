import 'package:admin/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../core/utils/components.dart';
import '../../../../../core/utils/const.dart';

class TextFieldSection extends StatelessWidget {
  const TextFieldSection({super.key});


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildTextField(
          context: context,
          controller: titleController,
          title:'Product Title',
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
                  controller: priceController,
                  title: 'Price',
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
                controller: quantityController,
                title: 'QTY',
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
          controller: descriptionController,
          title: 'Product Description',
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
