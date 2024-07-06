import 'dart:async';
import 'dart:io';
import 'package:admin/feature/Add_Update_product/data/model/product_model.dart';
import 'package:admin/feature/Add_Update_product/data/repository/add_products_repo.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:image_picker/image_picker.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/utils/components.dart';
import '../../../../core/utils/const.dart';

class AddProductsRepoImpl implements AddProductsRepo {
  var picker = ImagePicker();
  firebase_storage.Reference? ref;
  @override
  File? profileImageFile;
  @override
  String? selectedCategoryType;

  @override
  Future<Either<Failure, void>> addProducts({
    required String productId,
    String? productImage,
    required String productPrice,
    required String productTitle,
    required String productDescription,
    required String productQuantity,
    required String productCategory,
    required context,
  }) async {
    if (profileImageFile == null) {
      awesomeDialog(context, 'Please Choose Image', DialogType.error);
      return left(FirebaseFailure('Image not selected'));
    }

    bool isConnected = await FirebaseFailure.hasInternetConnection();
    if (!isConnected) {
      awesomeDialog(context, 'No internet connection', DialogType.error);
      return left(FirebaseFailure('No internet connection'));
    }

    try {
      await ref!.putFile(profileImageFile!);
      productImage = await ref!.getDownloadURL();

      ProductModel productModel = ProductModel(
        productCategory: productCategory,
        productImage: productImage,
        productPrice: productPrice,
        productTitle: capitalize(productTitle),
        productDescription: productDescription,
        productId: productId,
        productQuantity: productQuantity,
        createdAt: Timestamp.now(),
      );

      var firebase = FirebaseFirestore.instance;
      await firebase.collection('products').doc(productId).set(productModel.toMap());
      return right(unit);
    } catch (e) {
      return _handleException(e);
    }
  }

  @override
  Future<Either<Failure, void>> updateProducts({
    required String productId,
    String? productImage,
    required String productPrice,
    required String productTitle,
    required String productDescription,
    required String productQuantity,
    String? productCategory,
    required context,
  }) async {
    bool isConnected = await FirebaseFailure.hasInternetConnection();
    if (!isConnected) {
      awesomeDialog(context, 'No internet connection', DialogType.error);
      return left(FirebaseFailure('No internet connection'));
    }

    try {
      if (profileImageFile == null) {
        var firebase = FirebaseFirestore.instance;
        await firebase.collection('products').doc(productId).update({
          'productId': productId,
          'productPrice': productPrice,
          'productTitle': productTitle,
          'productQuantity': productQuantity,
          'productDescription': productDescription,
          if (productCategory != null) 'productCategory': productCategory,
        });
      } else {
        await ref!.putFile(profileImageFile!);
        productImage = await ref!.getDownloadURL();
        var firebase = FirebaseFirestore.instance;
        await firebase.collection('products').doc(productId).update({
          'productId': productId,
          'productImage': productImage,
          'productPrice': productPrice,
          'productTitle': productTitle,
          'productQuantity': productQuantity,
          'productDescription': productDescription,
          if (productCategory != null) 'productCategory': productCategory,
        });
      }
      return right(unit);
    } catch (e) {
      return _handleException(e);
    }
  }

  @override
  Future<Either<Failure, void>> deleteProducts(String productId,context) async {
    bool isConnected = await FirebaseFailure.hasInternetConnection();
    if (!isConnected) {
      awesomeDialog(context, 'No internet connection', DialogType.error);
      return left(FirebaseFailure('No internet connection'));
    }
    try {
      final CollectionReference productsCollection =
      FirebaseFirestore.instance.collection('products');
      await productsCollection.doc(productId).delete();

      var items = await productsCollection.get();

      List<ProductModel> products = items.docs.map(
            (doc) => ProductModel.fromJson(doc.data() as Map<String, dynamic>),
      ).toList();

      return right(products);
    } catch (e) {
      return _handleException(e);
    }
  }

  @override
  Future<Either<FirebaseFailure,void>> getProfileImage({required ImageSource imageSource})async {

    final pickedFile = await picker.pickImage(source: imageSource);
    try{
      if (pickedFile != null) {
        profileImageFile = File(pickedFile.path);
        ref = firebase_storage.FirebaseStorage.instance.ref().child(
            'products/${Uri
                .file(profileImageFile!.path)
                .pathSegments
                .last}');
      }
      return Right(ref);
    }catch(e){
      return Left(FirebaseFailure(e.toString()));
    }
  }

  Either<Failure, void> _handleException(dynamic e) {
    if (e is FirebaseException) {
      return left(FirebaseFailure.fromFirebaseException(e));
    }
    return left(FirebaseFailure(e.toString()));
  }
}
