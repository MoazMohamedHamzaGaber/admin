import 'package:admin/core/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract class AddProductsRepo{
  Future<Either<Failure,void>> addProducts({
    required String productId,
    String? productImage,
    required String productPrice,
    required String productTitle,
    required String productDescription,
    required String productQuantity,
    required String productCategory,
});
}