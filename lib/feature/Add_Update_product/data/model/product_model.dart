import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel
{
    String? productId;
    String? productImage;
    late String productPrice;
    late String productTitle;
    late String productDescription;
    late String productQuantity;
     String? productCategory;
     Timestamp? createdAt;

    ProductModel({
       this.productCategory,
      this.productImage,
      required this.productPrice,
      required this.productTitle,
      required this.productDescription,
       this.productId,
      required this.productQuantity,
       this.createdAt,
});

    ProductModel.fromJson(dynamic json)
    {
      productId=json['productId'];
      productCategory=json['productCategory'];
      productImage=json['productImage'];
      productPrice=json['productPrice'];
      productTitle=json['productTitle'];
      productQuantity=json['productQuantity'];
      productDescription=json['productDescription'];
      createdAt=json['createdAt'];
    }


    Map<String,dynamic>toMap(){
      return {
        'productId':productId,
        'productCategory':productCategory,
        'productImage':productImage,
        'productPrice':productPrice,
        'productTitle':productTitle,
        'productQuantity':productQuantity,
        'productDescription':productDescription,
        'createdAt':createdAt,
      };
    }
}