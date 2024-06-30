import 'package:admin/feature/Add_Update_product/data/model/product_model.dart';
import 'package:admin/feature/Add_Update_product/data/repository/add_products_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';

class AddProductsRepoImpl implements AddProductsRepo {
  @override
  Future<Either<Failure, void>> addProducts({
    required String productId,
    String? productImage,
    required String productPrice,
    required String productTitle,
    required String productDescription,
    required String productQuantity,
    required String productCategory,
}) async{

    ProductModel productModel = ProductModel(
      productCategory: productCategory,
      productImage: productImage,
      productPrice: productPrice,
      productTitle: productTitle,
      productDescription: productDescription,
      productId: productId,
      productQuantity: productQuantity,
      createdAt: Timestamp.now(),
    );
      try{
        var firebase= FirebaseFirestore.instance;
        await firebase
            .collection('products')
            .doc(productId)
            .set(productModel.toMap());
        return right(unit);
      }catch (e) {
        return left(FirebaseFailure(e.toString()));
      }
    }

}