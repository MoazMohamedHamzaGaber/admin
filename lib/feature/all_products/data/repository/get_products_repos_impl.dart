import 'package:admin/core/error/failure.dart';
import 'package:admin/feature/Add_Update_product/data/model/product_model.dart';
import 'package:admin/feature/all_products/data/repository/get_products_repos.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

class GetProductsReposImpl implements GetProductsRepos {
  @override
  Stream<Either<Failure, List<ProductModel>>> fetchProducts() {
    return FirebaseFirestore.instance.collection('products').snapshots().map((snapshot) {
      try {
        List<ProductModel> products = snapshot.docs
            .map((doc) => ProductModel.fromJson(doc.data() as Map<String, dynamic>))
            .toList();
        return Right(products);
      } catch (e) {
        return Left(FirebaseFailure(e.toString()));
      }
    });
  }

  @override
  Future<Either<Failure, List<ProductModel>>> searchProducts(String query)async {
    try {
      final CollectionReference productsCollection =
      FirebaseFirestore.instance.collection('products');

      QuerySnapshot querySnapshot = await productsCollection
          .where('productTitle', isGreaterThanOrEqualTo: query)
          .where('productTitle', isLessThanOrEqualTo: query + '\uf8ff')
          .get();

      List<ProductModel> products = querySnapshot.docs
          .map((doc) => ProductModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();

      return Right(products);
    } catch (e) {
      return Left(FirebaseFailure(e.toString()));
    }
  }
}
