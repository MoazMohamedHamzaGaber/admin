import 'package:flutter/material.dart';
import '../../../../../core/utils/components.dart';
import '../../../../../core/utils/const.dart';

class ButtonSection extends StatefulWidget {
  const ButtonSection(
      {super.key,
      required this.cubit,
      required this.productID,
      required this.fromKey,
      required this.isUpdate});

  final cubit;
  final productID;
  final fromKey;
  final bool isUpdate;

  @override
  State<ButtonSection> createState() => _ButtonSectionState();
}

class _ButtonSectionState extends State<ButtonSection> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        buildMaterialButton(
          text: 'Clear',
          iconData: Icons.clear,
          color: Colors.red,
          function: () {
            widget.cubit.removeImage();
            widget.cubit.removeSelectedAccount();
            titleController.text = '';
            priceController.text = '';
            quantityController.text = '';
            descriptionController.text = '';
          },
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: buildMaterialButton(
              text: widget.isUpdate ? 'Update Product' : 'Upload Product',
              iconData: Icons.upload,
              color: Colors.blue,
              function: widget.isUpdate
                  ? () {
                      print('Update');
                    }
                  : () {
                      if (widget.cubit.selectedCategoryType == null) {
                        buildShowDialog(
                          context: context,
                          image: 'assets/images/warning.png',
                          name: 'Category is empty',
                          function: () {
                            Navigator.pop(context);
                          },
                        );
                      } else if (widget.fromKey.currentState!.validate()) {
                        widget.cubit.addProduct(
                          productPrice: priceController.text,
                          productTitle: titleController.text,
                          productDescription: descriptionController.text,
                          productQuantity: quantityController.text,
                          productCategory: widget.cubit.selectedCategoryType!,
                          productId: widget.productID,
                          context: context,
                        );
                      }
                      FocusScope.of(context).unfocus();
                    }),
        ),
      ],
    );
  }
}
