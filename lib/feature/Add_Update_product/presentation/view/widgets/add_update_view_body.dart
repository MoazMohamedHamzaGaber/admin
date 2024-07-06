import 'package:admin/core/loading/loading_manager.dart';
import 'package:admin/feature/Add_Update_product/presentation/view/widgets/text_field_section.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/components.dart';
import '../../../../../core/utils/const.dart';
import '../../../../Dashboard/presentation/view/dashboard_view.dart';
import '../../../../all_products/presentation/view/all_products_view.dart';
import '../../../data/model/product_model.dart';
import '../../../data/repository/add_products_repo_impl.dart';
import '../../manage/cubit/cubit.dart';
import '../../manage/cubit/states.dart';
import 'button_section.dart';
import 'dropdown_button_section.dart';
import 'image_custom.dart';

class AddUpdateViewBody extends StatefulWidget {
  const AddUpdateViewBody(
      {super.key, required this.isUpdate, required this.model});

  final bool isUpdate;
  final ProductModel model;

  @override
  State<AddUpdateViewBody> createState() => _AddUpdateViewBodyState();
}

class _AddUpdateViewBodyState extends State<AddUpdateViewBody> {
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ProductsCubit(AddProductsRepoImpl()),
      child: BlocConsumer<ProductsCubit, ProductsStates>(
        listener: (BuildContext context, ProductsStates state) {
          if (state is AddProductsSuccessStates) {
            navigateTo(context, const DashBoardView());
            awesomeDialog(
                context, 'Product added successfully!', DialogType.success);
          }
          if (state is UpdateProductsSuccessStates) {
            navigateTo(context, const AllProductsView());
            awesomeDialog(
                context, 'Product update successfully!', DialogType.success);
          }
          if (state is DeleteProductsSuccessStates) {
            navigateTo(context, const AllProductsView());
            awesomeDialog(
              context,
              'Product Deleted Successfully',
              DialogType.success,
            );
          }
        },
        builder: (BuildContext context, Object? state) {
          var cubit = ProductsCubit.get(context);
          return LoadingManager(
            isLoading: state is AddProductsLoadingStates &&
                    cubit.addProductsRepo.profileImageFile != null ||
                state is UpdateProductsLoadingStates ||
                state is DeleteProductsLoadingStates,
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
                          ImageCustom(
                            isUpdate: widget.isUpdate,
                            model: widget.model,
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          DropdownButtonSection(
                            isUpdate: widget.isUpdate,
                            model: widget.model,
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          TextFieldSection(
                            isUpdate: widget.isUpdate,
                            model: widget.model,
                            cubit: cubit,
                          ),
                          const Spacer(),
                          ButtonSection(
                            fromKey: formKey,
                            isUpdate: widget.isUpdate,
                            cubit: cubit, id: widget.model.productId,
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
