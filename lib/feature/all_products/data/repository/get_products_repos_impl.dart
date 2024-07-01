import 'package:admin/core/error/failure.dart';
import 'package:admin/feature/Add_Update_product/data/model/product_model.dart';
import 'package:admin/feature/all_products/data/repository/get_products_repos.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

class GetProductsReposImpl implements GetProductsRepos {
  @override
  Future<Either<Failure, List<ProductModel>>> fetchProducts() async {
    try {
      var querySnapshot =
      await FirebaseFirestore.instance.collection('products').get();
      List<ProductModel> products = querySnapshot.docs
          .map((doc) => ProductModel.fromJson(doc.data()))
          .toList();
      return Right(products);
    } catch (e) {
      return Left(FirebaseFailure(e.toString()));
    }
  }
}