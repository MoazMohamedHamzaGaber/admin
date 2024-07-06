import 'package:admin/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

Future customShowDialog(context,cubit)=>showDialog(
  context: context,
  builder: (context) => AlertDialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    backgroundColor:
    Theme.of(context).scaffoldBackgroundColor,
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Choose option',
          style: AppStyles.style20,
        ),
        const SizedBox(
          height: 20,
        ),
        buildMaterial(
          iconData: Icons.camera,
          text: 'Camera',
          function: () {
            cubit.getProfileImage(ImageSource.camera);
            Navigator.pop(context);
          },
        ),
        const SizedBox(
          height: 5,
        ),
        buildMaterial(
          iconData: Icons.image,
          text: 'Gallery',
          function: () {
            cubit.getProfileImage(ImageSource.gallery);
            Navigator.pop(context);
          },
        ),
        const SizedBox(
          height: 5,
        ),
        buildMaterial(
          iconData: Icons.remove,
          text: 'Remove',
          function: () {
            cubit.removeImage();
            Navigator.pop(context);
          },
        ),
      ],
    ),
  ),
);

Widget buildMaterial({
  required IconData iconData,
  required String text,
  required Function function,
}) =>
    MaterialButton(
      onPressed: () {
        function();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            iconData,
            color: Colors.blue,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            text,
            style: AppStyles.style18.copyWith(color: Colors.blue),
          ),
        ],
      ),
    );