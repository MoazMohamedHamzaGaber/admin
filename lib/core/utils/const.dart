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

Future navigateAndFinish(context,Widget)
{
  return Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Widget),(route) => false,);
}
 String capitalize(String text) {
   if (text.isEmpty) return text;
   return text[0].toUpperCase() + text.substring(1).toLowerCase();
 }
