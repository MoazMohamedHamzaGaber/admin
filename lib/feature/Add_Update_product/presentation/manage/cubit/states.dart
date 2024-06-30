
abstract class ProductsStates{}

class InitialProductsStates extends ProductsStates{}

class ProductChangeSelectedCategoryStates extends ProductsStates{}

class RemoveSelectedAccountState extends ProductsStates{}

class CreateProfileImageSuccessState extends ProductsStates{}

class CreateProfileImageErrorState extends ProductsStates{}

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