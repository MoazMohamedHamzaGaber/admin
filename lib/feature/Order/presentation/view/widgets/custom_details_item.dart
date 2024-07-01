import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';

class CustomDetailsItem extends StatelessWidget {
  const CustomDetailsItem({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: size.width * 0.6,
            child: const Text(
              'Apple iphone 14 pro (128GB)-Black',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              const Text(
                'Price : ',
              ),
              Text(
                '1399.99 \$',
                style: AppStyles.style16.copyWith(
                    color: Colors.blue
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            'Qty: 10',
          ),
        ],
      ),
    );
  }
}
