import 'dart:io';

import 'package:admin/feature/Add_Update_product/data/model/product_model.dart';
import 'package:admin/feature/Add_Update_product/data/repository/add_products_repo.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:image_picker/image_picker.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/utils/components.dart';

class AddProductsRepoImpl implements AddProductsRepo {
  var picker = ImagePicker();

  Reference? ref;
  @override
  Future<Either<Failure, void>> addProducts({
    required String productId,
    String? productImage,
    required String productPrice,
    required String productTitle,
    required String productDescription,
    required String productQuantity,
    required String productCategory,
    required context
}) async{
    if (profileImageFile == null) {
      awesomeDialog(context, 'Please Choose Image',DialogType.error);
    }
    await ref!.putFile(profileImageFile!);
    productImage = await ref!.getDownloadURL();
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
        if(e is FirebaseException) {
          return left(FirebaseFailure.fromFirebaseException(e));
        }
        return left(FirebaseFailure(e.toString()));
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

  @override
  File? profileImageFile;

}