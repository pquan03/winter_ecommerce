import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:winter_store/data/dummy/dummy.dart';
import 'package:winter_store/features/shop/models/brand_category_model.dart';
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

  // Upload brand category relationship to firebase storage
  Future<void> pushAllBrandCategory() async {
    try {
      final listBrandCategory = WDummy.listBrandCategory;
      for (BrandCategoryModel brandCategory in listBrandCategory) {
        await _db
            .collection('brandCategory')
            .doc(brandCategory.id)
            .set(brandCategory.toJson());
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
      final querySnapshot = limit == -1
          ? await _db
              .collection('products')
              .where('Brand.id', isEqualTo: brandId)
              .get()
          : await _db
              .collection('products')
              .where('Brand.id', isEqualTo: brandId)
              .limit(limit)
              .get();
      final products =
          querySnapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
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

  // Get brands by categoryId
  Future<List<BrandModel>> getBrandsByCategoryId(String categoryId) async {
    try {
      // Query list brandcategory by categoryId
      QuerySnapshot brandQuerySnapshot = await _db
          .collection('brandCategory')
          .where('categoryId', isEqualTo: categoryId)
          .get();

      // Map brandId from brandCategory
      List<String> brandIds = brandQuerySnapshot.docs
          .map((doc) => doc['brandId'] as String)
          .toList();

      if (brandIds.isEmpty) {
        return [];
      }

      // Query brands by brandId
      final brandsQuery = await _db
          .collection('brands')
          .where(FieldPath.documentId, whereIn: brandIds)
          .limit(2)
          .get();

      // Extract brands from query
      final brands =
          brandsQuery.docs.map((e) => BrandModel.fromSnapshot(e)).toList();

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
}
