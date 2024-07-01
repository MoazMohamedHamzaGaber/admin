import 'package:flutter/material.dart';

class CategoryModel {
  static List<String> categoriesList = [
    'Phones',
    'Laptops',
    'Electronics',
    'Clothes',
    'Books',
    'Shoes',
    'Watches',
    'Cosmetics',
    'Accessories',
  ];
  
  static List<DropdownMenuItem> categoriesDropdownList =
      List<DropdownMenuItem>.generate(
        CategoryModel.categoriesList.length,
    (index) => DropdownMenuItem(
      value: CategoryModel.categoriesList[index],
      child: Text(
        CategoryModel.categoriesList[index],
      ),
    ),
  );
}
