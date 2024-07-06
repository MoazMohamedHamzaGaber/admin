import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:admin/core/utils/styles.dart';
import 'package:admin/feature/Add_Update_product/data/model/product_model.dart';
import '../../../../../core/utils/components.dart';

class TextFieldSection extends StatefulWidget {
  const TextFieldSection({super.key, required this.model, required this.isUpdate, required this.cubit});

  final ProductModel model;
  final bool isUpdate;
  final cubit;

  @override
  _TextFieldSectionState createState() => _TextFieldSectionState();
}

class _TextFieldSectionState extends State<TextFieldSection> {
  @override
  void initState() {
    super.initState();
    if (widget.isUpdate) {
      widget.cubit.titleController.text = widget.model.productTitle;
      widget.cubit.priceController.text = widget.model.productPrice;
      widget.cubit.quantityController.text = widget.model.productQuantity;
      widget.cubit.descriptionController.text = widget.model.productDescription;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildTextField(
          context: context,
          controller: widget.cubit.titleController,
          title: 'Product Title',
          keyboardType: TextInputType.multiline,
          maxLength: 80,
          validate: 'Please enter a valid title',
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Flexible(
              flex: 1,
              child: buildTextField(
                context: context,
                controller: widget.cubit.priceController,
                title: 'Price',
                keyboardType: TextInputType.number,
                validate: 'Price is missing',
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^(\d+)?\.?\d{0,2}')),
                ],
                prefix: Text('\$ ', style: AppStyles.style16.copyWith(color: Colors.blue)),
              ),
            ),
            const SizedBox(width: 10),
            Flexible(
              flex: 1,
              child: buildTextField(
                context: context,
                controller: widget.cubit.quantityController,
                title: 'QTY',
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                validate: 'Quantity is missing',
              ),
            ),
          ],
        ),
        buildTextField(
          context: context,
          controller: widget.cubit.descriptionController,
          title: 'Product Description',
          keyboardType: TextInputType.multiline,
          maxLength: 1000,
          validate: 'Description is missing',
          height: 150,
        ),
      ],
    );
  }
}
