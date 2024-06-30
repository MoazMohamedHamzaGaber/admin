import 'package:admin/core/utils/styles.dart';
import 'package:flutter/material.dart';

class BuildItem extends StatelessWidget {
  const BuildItem({super.key, required this.image, required this.title, required this.function});

  final String image;
  final String title;
  final Function function;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: InkWell(
        onTap: (){
          function(context);
        },
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(image,height: 65,width: 65,),
              const SizedBox(
                height: 10,
              ),
              Text(title,
                style: AppSStyles.style18,
              )
            ],
          ),
        ),
      ),
    );
  }
}
