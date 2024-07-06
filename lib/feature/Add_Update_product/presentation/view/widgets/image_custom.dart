import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/model/product_model.dart';
import '../../manage/cubit/cubit.dart';
import '../../manage/cubit/states.dart';
import 'custom_show_dialog.dart';

class ImageCustom extends StatelessWidget {
  const ImageCustom({super.key, required this.isUpdate, required this.model});

  final bool isUpdate;
  final ProductModel model;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocConsumer<ProductsCubit, ProductsStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        var cubit = ProductsCubit.get(context);
        return Column(
          children: [
            Container(
              width: size.width * 0.45,
              height: size.height * 0.18,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(12),
                shape: BoxShape.rectangle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: isUpdate
                      ? cubit.addProductsRepo.profileImageFile == null
                  ?CachedNetworkImageProvider(model.productImage!)
                          : FileImage(cubit.addProductsRepo.profileImageFile!)
                              as ImageProvider
                      : cubit.addProductsRepo.profileImageFile == null
                  ?const CachedNetworkImageProvider('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTxddtPSxt3mS3QjGibU-bVEPkoBgh_852nNRuU2_CuZ2sEEJJD9VEcGBZ9OGmlv_LmGdg&usqp=CAU')
                          : FileImage(cubit.addProductsRepo.profileImageFile!)
                              as ImageProvider,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (cubit.addProductsRepo.profileImageFile == null)
                    TextButton(
                      child: const Text(
                        'Pick product image',
                        style: TextStyle(color: Colors.blue),
                      ),
                      onPressed: () {
                        customShowDialog(context, cubit);
                      },
                    ),
                ],
              ),
            ),
            if (cubit.addProductsRepo.profileImageFile != null)
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        child: const Text(
                          'Pick another image',
                          style: TextStyle(color: Colors.blue),
                        ),
                        onPressed: () {
                          customShowDialog(context, cubit);
                        },
                      ),
                    ),
                    Expanded(
                        child: TextButton(
                            onPressed: () {
                              cubit.removeImage();
                            },
                            child: const Text(
                              'Remove image',
                              style: TextStyle(color: Colors.red),
                            ))),
                  ],
                ),
              ),
          ],
        );
      },
    );
  }
}
