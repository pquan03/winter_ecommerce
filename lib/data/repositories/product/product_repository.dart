import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:winter_store/features/shop/models/product_model.dart';
import 'package:winter_store/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:winter_store/utils/exceptions/format_exceptions.dart';

class ProductRepository extends GetxController {
  // Singleton
  static ProductRepository get instance => Get.find();

  // Variables
  final _db = FirebaseFirestore.instance;

  Future<List<ProductModel>> getFeaturedProducts() async {
    try {
      final snapshot = await _db
          .collection('products')
          .where('isFeatured', isEqualTo: true)
          .get();
      final list =
          snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
      return list;
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } catch (e) {
      throw e.toString();
    }
  }
}
