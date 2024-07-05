import '../../../../Add_Update_product/data/model/product_model.dart';

abstract class AllProductsStates{}

class InitialAllProductsStates extends  AllProductsStates{}

class AllProductsSuccessStates extends AllProductsStates{
  final List<ProductModel> products;

  AllProductsSuccessStates({required this.products});
}

class AllProductsLoadingStates extends AllProductsStates{}

class AllProductsErrorStates extends AllProductsStates{
  final String errMessage;

  AllProductsErrorStates({required this.errMessage});
}


class SearchProductsSuccessStates extends AllProductsStates{
  final List<ProductModel> products;

  SearchProductsSuccessStates({required this.products});
}

class SearchProductsLoadingStates extends AllProductsStates{}

class SearchProductsErrorStates extends AllProductsStates{
  final String errMessage;

  SearchProductsErrorStates({required this.errMessage});
}