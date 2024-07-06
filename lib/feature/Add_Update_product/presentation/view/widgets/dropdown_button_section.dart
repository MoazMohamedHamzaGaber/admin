import 'package:admin/feature/Add_Update_product/data/model/category_model.dart';
import 'package:admin/feature/Add_Update_product/data/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../manage/cubit/cubit.dart';
import '../../manage/cubit/states.dart';


class DropdownButtonSection extends StatelessWidget {
   const DropdownButtonSection({super.key, required this.isUpdate, required this.model});

   final bool isUpdate;
   final ProductModel model;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductsCubit,ProductsStates>(
      listener: (BuildContext context, Object? state) {  },
      builder: (BuildContext context, state) {
        var cubit=ProductsCubit.get(context);
        return Card(
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none
          ),
          margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width *0.2,
          ),
          child: DropdownButtonFormField(
            padding: const EdgeInsets.symmetric(
              horizontal: 14,
            ),
            hint:isUpdate? Text('${model.productCategory}'):const Text('Select Category',),
            icon: const Icon(
              Icons.keyboard_arrow_down,
            ),
            borderRadius: BorderRadius.circular(20),
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
           // value:cubit.selectedCategoryType=model.productCategory,
            items:CategoryModel.categoriesDropdownList,
            onChanged: (value) {
              cubit.changeSelectedAccount(value);
            },
          ),
        );
      },
    );
  }
}
