import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:winter_store/data/dummy/dummy.dart';
import 'package:winter_store/features/shop/models/brand_model.dart';
import 'package:winter_store/features/shop/models/product_model.dart';
import 'package:winter_store/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:winter_store/utils/exceptions/format_exceptions.dart';

class BrandRepository extends GetxController {
  // Singleton
  static BrandRepository get instance => Get.find();

  // Variables
  final _db = FirebaseFirestore.instance;

  // Fetch all brands from firebase storage
  Future<List<BrandModel>> fetchAllBrands() async {
    try {
      final snapshot = await _db.collection('brands').get();
      final brands =
          snapshot.docs.map((e) => BrandModel.fromSnapshot(e)).toList();
      return brands;
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } catch (_) {
      throw 'Something went wrong. Please try again.';
    }
  }

  // Upload all brands to firebase storage
  Future<void> pushAllBanners() async {
    try {
      final brands = WDummy.listBrands;
      for (BrandModel banner in brands) {
        await _db.collection('brands').doc(banner.id).set(banner.toJson());
      }
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } catch (_) {
      throw 'Something went wrong. Please try again.';
    }
  }

  Future<List<ProductModel>> getProductsForBrand(
      {required String brandId, int limit = -1}) async {
    try {
      final querySnapshot = limit == -1 ? await _db.collection('products').where('Brand.id', isEqualTo: brandId).get() : await _db.collection('products').where('Brand.id', isEqualTo: brandId).limit(limit).get();
      final products = querySnapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
      return products;
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } catch (_) {
      throw 'Something went wrong. Please try again.';
    }
  }
}
