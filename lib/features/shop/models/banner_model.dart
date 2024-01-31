import 'package:cloud_firestore/cloud_firestore.dart';

class BannerModel {
  String id;
  bool active;
  String imageUrl;
  String targetScreen;

  BannerModel({
    required this.id,
    required this.active,
    required this.imageUrl,
    required this.targetScreen,
  });

  static BannerModel empty() => BannerModel(
        id: '',
        active: false,
        imageUrl: '',
        targetScreen: '',
      );

  factory BannerModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot) {
    if (documentSnapshot.data() != null) {
      final json = documentSnapshot.data()!;
      return BannerModel(
        id: documentSnapshot.id,
        active: json['active'],
        imageUrl: json['imageUrl'],
        targetScreen: json['targetScreen'],
      );
    } else {
      return BannerModel.empty();
    }
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'active': active,
        'imageUrl': imageUrl,
        'targetScreen': targetScreen,
      };
}
