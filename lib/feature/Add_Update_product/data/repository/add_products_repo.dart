import 'dart:io';
import 'package:admin/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';

abstract class AddProductsRepo{
  File? profileImageFile;
  String? selectedCategoryType;
  Future<Either<Failure,void>> addProducts({
    required String productId,
    String? productImage,
    required String productPrice,
    required String productTitle,
    required String productDescription,
    required String productQuantity,
    required String productCategory,
    required context,
});

  Future<Either<Failure,void>> updateProducts({
     required String productId,
    String? productImage,
    required String productPrice,
    required String productTitle,
    required String productDescription,
    required String productQuantity,
    String? productCategory,
    required context,
  });

  Future<Either<FirebaseFailure,void>> getProfileImage({
    required ImageSource imageSource,
});
  Future<Either<Failure,void>> deleteProducts(String productsId,context);
}