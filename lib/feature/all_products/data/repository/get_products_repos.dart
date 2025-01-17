import 'package:admin/core/error/failure.dart';
import 'package:admin/feature/Add_Update_product/data/model/product_model.dart';
import 'package:dartz/dartz.dart';

abstract class GetProductsRepos{
 Stream<Either<Failure,List<ProductModel>>> fetchProducts();
 Future<Either<Failure,List<ProductModel>>> searchProducts(String query);
}