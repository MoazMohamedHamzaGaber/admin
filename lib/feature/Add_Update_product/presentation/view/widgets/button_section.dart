import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../../../../../core/utils/components.dart';

class ButtonSection extends StatefulWidget {
  const ButtonSection(
      {super.key,
      required this.cubit,
      required this.fromKey,
      required this.isUpdate});

  final cubit;
  final fromKey;
  final bool isUpdate;


  @override
  State<ButtonSection> createState() => _ButtonSectionState();
}

class _ButtonSectionState extends State<ButtonSection> {

  final productID = const Uuid().v4();

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
             widget.cubit.titleController.text = '';
             widget.cubit.priceController.text = '';
             widget.cubit.quantityController.text = '';
             widget.cubit.descriptionController.text = '';
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
                      widget.cubit.updateProduct(
                        context: context,
                         productPrice: widget.cubit.priceController.text,
                        productTitle: widget.cubit.titleController.text,
                         productDescription: widget.cubit.descriptionController.text,
                         productQuantity: widget.cubit.quantityController.text,
                         productCategory: widget.cubit.addProductsRepo.selectedCategoryType,
                        productId:productID,
                      );
                    }
                  : () {
                      if (widget.cubit.addProductsRepo.selectedCategoryType == null) {
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
                          productPrice: widget.cubit.priceController.text,
                          productTitle: widget.cubit.titleController.text,
                          productDescription: widget.cubit.descriptionController.text,
                          productQuantity: widget.cubit.quantityController.text,
                          productCategory: widget.cubit.addProductsRepo.selectedCategoryType!,
                          productId: productID,
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
