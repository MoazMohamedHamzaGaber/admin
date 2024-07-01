import 'package:admin/core/loading/loading_manager.dart';
import 'package:admin/feature/Add_Update_product/presentation/view/widgets/text_field_section.dart';
import 'package:admin/feature/Dashboard/presentation/view/dashboard_view.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

import '../../../../../core/utils/components.dart';
import '../../../../../core/utils/const.dart';
import '../../../data/repository/add_products_repo_impl.dart';
import '../../manage/cubit/cubit.dart';
import '../../manage/cubit/states.dart';
import 'button_section.dart';
import 'dropdown_button_section.dart';
import 'image_custom.dart';

class AddUpdateViewBody extends StatefulWidget {
  const AddUpdateViewBody({super.key});

  @override
  State<AddUpdateViewBody> createState() => _AddUpdateViewBodyState();
}

class _AddUpdateViewBodyState extends State<AddUpdateViewBody> {
  var formKey = GlobalKey<FormState>();

  final productID = const Uuid().v4();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>ProductsCubit(AddProductsRepoImpl()),
      child: BlocConsumer<ProductsCubit, ProductsStates>(
        listener: (BuildContext context, state) {
          if (state is AddProductsSuccessStates) {
            navigateTo(context, const DashBoardView());
            awesomeDialog(context, 'Product added successfully!',DialogType.success);
          }
          if(state is AddProductsErrorStates){
            awesomeDialog(context, state.error,DialogType.error);
          }
        },
        builder: (BuildContext context, Object? state) {
          var cubit = ProductsCubit.get(context);
          return LoadingManager(
            isLoading: state is AddProductsLoadingStates &&
                cubit.addProductsRepo.profileImageFile != null,
            child: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: CustomScrollView(
                  physics: const BouncingScrollPhysics(),
                  slivers: [
                    SliverFillRemaining(
                      hasScrollBody: false,
                      child: Column(
                        children: [
                           const ImageCustom(),
                          const SizedBox(
                            height: 25,
                          ),
                          const DropdownButtonSection(),
                          const SizedBox(
                            height: 25,
                          ),
                          const TextFieldSection(),
                          const Spacer(),
                          ButtonSection(
                             cubit: cubit, productID: productID,
                            fromKey: formKey,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
