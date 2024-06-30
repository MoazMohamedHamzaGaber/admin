import 'package:flutter/material.dart';
import '../../../../../core/utils/components.dart';
import '../../../../../core/utils/const.dart';

class ButtonSection extends StatefulWidget {
   const ButtonSection({super.key, required this.function,required this.cubit});

  final Function function;
  final cubit;

  @override
  State<ButtonSection> createState() => _ButtonSectionState();
}

class _ButtonSectionState extends State<ButtonSection> {
  var fromKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        buildMaterialButton(
          text: 'Clear',
          iconData: Icons.clear,
          color: Colors.red,
          function: () {
            widget.cubit.removeImage();
            widget.cubit.removeSelectedAccount();
            titleController.text='';
            priceController.text='';
            quantityController.text='';
            descriptionController.text='';
          },
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: buildMaterialButton(
            text:'Upload Product',
            iconData:Icons.upload,
            color: Colors.blue,
            function: (){
              widget.function();
            },
          ),
        ),
      ],
    );
  }
}
