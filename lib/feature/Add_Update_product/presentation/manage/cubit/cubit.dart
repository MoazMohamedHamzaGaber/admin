import 'dart:io';

import 'package:admin/feature/Add_Update_product/data/repository/add_products_repo.dart';
import 'package:admin/feature/Add_Update_product/presentation/manage/cubit/states.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ProductsCubit extends Cubit<ProductsStates>{
  ProductsCubit(this.addProductsRepo):super(InitialProductsStates());

  static ProductsCubit get(context)=>BlocProvider.of(context);

  final AddProductsRepo addProductsRepo;

  String? selectedCategoryType;

  void changeSelectedAccount(value) {
    selectedCategoryType = value;
    emit(ProductChangeSelectedCategoryStates());
  }

  void removeSelectedAccount() {
    selectedCategoryType = null;
    emit(RemoveSelectedAccountState());
  }

  File? profileImageFile;
  var picker = ImagePicker();

  Reference? ref;

  Future getProfileImage(ImageSource imageSource) async {
    final pickedFile = await picker.pickImage(source: imageSource);
    if (pickedFile != null) {
      profileImageFile = File(pickedFile.path);
      print(pickedFile.path.toString());
      ref = firebase_storage.FirebaseStorage.instance.ref().child(
          'products/${Uri.file(profileImageFile!.path).pathSegments.last}');
      emit(CreateProfileImageSuccessState());
    } else {
      print('No Image Selected');
      emit(CreateProfileImageErrorState());
    }
  }

  void removeImage() {
    profileImageFile = null;
    emit(RemoveImageState());
  }

  void addProduct({
    required String productId,
    String? productImage,
    required String productPrice,
    required String productTitle,
    required String productDescription,
    required String productQuantity,
    required String productCategory,
    required context,
}) async{
    if (profileImageFile == null) {
      await AwesomeDialog(
        context: context,
        title: 'هام',
        dialogType: DialogType.error,
        body: const Text('Please Choose Image'),
      ).show();
    }
    emit(AddProductsLoadingStates());
    await ref!.putFile(profileImageFile!);
    productImage = await ref!.getDownloadURL();
    var result=await addProductsRepo.addProducts(
        productId: productId,
      productCategory: productCategory,
      productDescription: productDescription,
      productPrice: productPrice,
      productQuantity: productQuantity,
      productTitle: productTitle,
      productImage: productImage,
    );
    result.fold(
          (failure) => emit(AddProductsErrorStates(error: 'failure.message')),
          (_) => emit(AddProductsSuccessStates()),
    );
  }
}