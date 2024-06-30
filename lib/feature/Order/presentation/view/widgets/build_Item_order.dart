import 'package:admin/feature/Order/presentation/view/widgets/custom_image.dart';
import 'package:admin/feature/Order/presentation/view/widgets/custom_details_item.dart';
import 'package:flutter/material.dart';


class BuildItemOrder extends StatelessWidget {
  const BuildItemOrder({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.15,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomImage(),
          const SizedBox(
            width: 10,
          ),
          const CustomDetailsItem(),
          IconButton(
            onPressed: (){},
            icon: const Icon(
              Icons.close,
              size: 18,
              color: Colors.red,
            ),
          )
        ],
      ),
    );
  }
}
