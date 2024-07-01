import 'package:admin/feature/all_products/presentation/manage/cubit/cubit.dart';
import 'package:admin/feature/all_products/presentation/manage/cubit/states.dart';
import 'package:admin/feature/all_products/presentation/view/widgets/custom_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/components.dart';

class AllProductsViewBody extends StatefulWidget {
  const AllProductsViewBody({super.key});

  @override
  State<AllProductsViewBody> createState() => _AllProductsViewBodyState();
}

class _AllProductsViewBodyState extends State<AllProductsViewBody> {
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AllProductsCubit,AllProductsStates>(
      listener: (BuildContext context, state) {  },
      builder: (BuildContext context, Object? state) {
        if(state is AllProductsSuccessStates) {
          return state.products.isEmpty?const Center(
          child: Text(
            "No product has been added",
          ),
        ): Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),      child: Column(
          children: [
            buildTextField(
              context: context,
              keyboardType: TextInputType.text,
              controller: searchController,
              title: 'Search',
              prefixIcon: Icons.search_sharp,
            ),
             CustomGridView(products: state.products),
          ],
        ),
        );
        }else if(state is AllProductsErrorStates){
          Center(
            child: Text(state.errMessage,style: const TextStyle(
              fontSize: 30,
            ),),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
