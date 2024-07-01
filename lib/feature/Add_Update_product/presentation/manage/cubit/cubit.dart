import 'package:admin/feature/Add_Update_product/data/repository/add_products_repo.dart';
import 'package:admin/feature/Add_Update_product/presentation/manage/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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


  Future getProfileImage(ImageSource imageSource) async {
   var result=await addProductsRepo.getProfileImage(imageSource: imageSource);
   result.fold(
         (failure) => emit(CreateProfileImageErrorState(error: failure.message)),
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
    result.fold(
          (failure) => emit(AddProductsErrorStates(error: failure.message)),
          (_) => emit(AddProductsSuccessStates()),
    );
  }
}