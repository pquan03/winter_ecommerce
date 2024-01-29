import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:winter_store/features/shop/models/banner_model.dart';
import 'package:winter_store/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:winter_store/utils/exceptions/format_exceptions.dart';
import 'package:winter_store/utils/helpers/log_function.dart';

class BannerRepository extends GetxController {
  // Singleton
  static BannerRepository get instance => BannerRepository();

  // Variables
  final _db = FirebaseFirestore.instance;

  // Get all banners
  Future<List<BannerModel>> getBanners() async {
    try {
      final snapshot = await _db
          .collection('banners')
          .where('active', isEqualTo: true)
          .get();
      final list =
          snapshot.docs.map((e) => BannerModel.fromSnapshot(e)).toList();
      return list;
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
