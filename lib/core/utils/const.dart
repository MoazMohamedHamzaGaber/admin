 import 'package:flutter/material.dart';

Widget buildDivider()=>Container(
  margin: const EdgeInsets.symmetric(
      vertical: 10
  ),
  width: double.infinity,
  height: 1,
  color: Colors.grey[300],
);

Future navigateTo(context,Widget)
{
  return Navigator.push(context, MaterialPageRoute(builder: (context)=>Widget));
}
//
// Future navigateAndFinish(context,Widget)
// {
//   return Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Widget),(route) => false,);
// }
//
// var titleController=TextEditingController();
// var priceController=TextEditingController();
// var quantityController=TextEditingController();
// var descriptionController=TextEditingController();
//
// String uId='';
//
//
