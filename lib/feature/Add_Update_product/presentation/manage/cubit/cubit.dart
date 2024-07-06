import 'package:admin/core/utils/components.dart';
import 'package:admin/feature/Add_Update_product/data/repository/add_products_repo.dart';
import 'package:admin/feature/Add_Update_product/presentation/manage/cubit/states.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';


class ProductsCubit extends Cubit<ProductsStates>{
  ProductsCubit(this.addProductsRepo):super(InitialProductsStates());

  static ProductsCubit get(context)=>BlocProvider.of(context);

  final AddProductsRepo addProductsRepo;


  var titleController=TextEditingController();
  var priceController=TextEditingController();
  var quantityController=TextEditingController();
  var descriptionController=TextEditingController();

  void changeSelectedAccount(value) {
    addProductsRepo.selectedCategoryType = value;
    emit(ProductChangeSelectedCategoryStates());
  }

  void removeSelectedAccount() {
    addProductsRepo.selectedCategoryType = null;
    emit(RemoveSelectedAccountState());
  }


  Future getProfileImage(ImageSource imageSource) async {
   var result=await addProductsRepo.getProfileImage(imageSource: imageSource);
   result.fold(
         (failure) => emit(CreateProfileImageErrorState(error: failure.errMessage)),
         (_) => emit(CreateProfileImageSuccessState()),
   );
  }

  void removeImage() {
    addProductsRepo.profileImageFile = null;
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
    emit(AddProductsLoadingStates());
    var result=await addProductsRepo.addProducts(
        productId: productId,
      productCategory: productCategory,
      productDescription: productDescription,
      productPrice: productPrice,
      productQuantity: productQuantity,
      productTitle: productTitle,
      productImage: productImage, context: context,
    );
    result.fold((failure){
      emit(AddProductsErrorStates(error: failure.errMessage));
      print('/////////////////////////////////////////');
      print(failure.errMessage);
      print('/////////////////////////////////////////');
      awesomeDialog(context, 'text', DialogType.error);
    }, (books) {
      emit(AddProductsSuccessStates());
    });
  }

  void updateProduct({
    required String productId,
    String? productImage,
    required String productPrice,
    required String productTitle,
    required String productDescription,
    required String productQuantity,
    String? productCategory,
    required context,
  }) async {
    emit(UpdateProductsLoadingStates());

    var result = await addProductsRepo.updateProducts(
      productId: productId,
      productPrice: productPrice,
      productTitle: productTitle,
      productDescription: productDescription,
      productQuantity: productQuantity,
      productCategory: productCategory!,
      productImage: productImage,
      context: context,
    );

    result.fold((failure) {
      print('/////////////////////////////////////////');
      print('Failure: ${failure.errMessage}');
      print('/////////////////////////////////////////');
      emit(UpdateProductsErrorStates(errMessage: failure.errMessage));
      awesomeDialog(context, 'Error', DialogType.error);
    }, (_) {
      emit(UpdateProductsSuccessStates());
    });
  }

  void deleteProducts(String productsId)async {
    emit(DeleteProductsLoadingStates());

    var result= await addProductsRepo.deleteProducts(productsId);

    result.fold(
          (failure)=>emit(DeleteProductsErrorStates(errMessage: failure.errMessage)),
          (products){
        emit(DeleteProductsSuccessStates(products: products));
      },
    );
  }
}