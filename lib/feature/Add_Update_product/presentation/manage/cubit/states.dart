
import '../../../data/model/product_model.dart';

abstract class ProductsStates{}

class InitialProductsStates extends ProductsStates{}

class ProductChangeSelectedCategoryStates extends ProductsStates{}

class RemoveSelectedAccountState extends ProductsStates{}

class CreateProfileImageSuccessState extends ProductsStates{}

class CreateProfileImageErrorState extends ProductsStates{
  final String error;

  CreateProfileImageErrorState({required this.error});
}

class RemoveImageState extends ProductsStates{}

class AddProductsSuccessStates extends ProductsStates{
  // final List<ProductModel>products;
  //
  // AddProductsSuccessStates({required this.products});
}

class AddProductsLoadingStates extends ProductsStates{}

class AddProductsErrorStates extends ProductsStates{
  final String error;

  AddProductsErrorStates({required this.error});
}

class UpdateProductsSuccessStates extends ProductsStates{}

class UpdateProductsLoadingStates extends ProductsStates{}

class UpdateProductsErrorStates extends ProductsStates{
  final String errMessage;

  UpdateProductsErrorStates({required this.errMessage});
}

class DeleteProductsSuccessStates extends ProductsStates{
  final List<ProductModel> products;

  DeleteProductsSuccessStates({required this.products});
}

class DeleteProductsLoadingStates extends ProductsStates{}

class DeleteProductsErrorStates extends ProductsStates{
  final String errMessage;

  DeleteProductsErrorStates({required this.errMessage});
}