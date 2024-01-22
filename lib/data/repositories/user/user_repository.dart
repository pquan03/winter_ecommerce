import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:winter_store/features/personalization/models/user_model.dart';
import 'package:winter_store/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:winter_store/utils/exceptions/format_exceptions.dart';
import 'package:winter_store/utils/exceptions/platform_exceptions.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection('users').doc(user.id).set(user.toJson());
    } on FirebaseException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (_) {
      throw 'Something went wrong. Please try again later.';
    }
  }
}
