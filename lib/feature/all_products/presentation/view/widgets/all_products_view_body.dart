import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:admin/feature/all_products/presentation/manage/cubit/cubit.dart';
import 'package:admin/feature/all_products/presentation/manage/cubit/states.dart';
import '../../../../../core/utils/components.dart';
import 'build_GridView_Based_OnState.dart';

class AllProductsViewBody extends StatefulWidget {
  const AllProductsViewBody({super.key});

  @override
  State<AllProductsViewBody> createState() => _AllProductsViewBodyState();
}

class _AllProductsViewBodyState extends State<AllProductsViewBody> {
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AllProductsCubit, AllProductsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Column(
            children: [
              buildTextField(
                onChanged: (e) {
                  AllProductsCubit.get(context).searchProducts(e);
                },
                height: 80,
                context: context,
                keyboardType: TextInputType.text,
                controller: searchController,
                title: 'Search',
                prefixIcon: Icons.search_sharp,
              ),
              Expanded(
                child: buildGridViewBasedOnState(state),
              ),
            ],
          ),
        );
      },
    );
  }
}