import 'package:cloud_firestore/cloud_firestore.dart';

class AddressModel {
  String id;
  String name;
  String phoneNumber;
  String street;
  String city;
  String state;
  String postalCode;
  String country;
  bool isDefault;

  AddressModel(
      {required this.id,
      required this.name,
      required this.phoneNumber,
      required this.street,
      required this.city,
      required this.state,
      required this.postalCode,
      required this.country,
      this.isDefault = true});

  // String get formatedPhoneNumber = TFormatter.formatPho/

  static AddressModel empty() => AddressModel(
      id: '',
      name: '',
      phoneNumber: '',
      street: '',
      city: '',
      state: '',
      postalCode: '',
      country: '',
      isDefault: false);

  // To json
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'phoneNumber': phoneNumber,
        'street': street,
        'city': city,
        'state': state,
        'postalCode': postalCode,
        'country': country,
        'isDefault': isDefault,
      };

  // From snapshot
  factory AddressModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot) {
    final data = documentSnapshot.data()!;
    if (data.isEmpty) return AddressModel.empty();
    return AddressModel(
      id: documentSnapshot.id,
      name: data['name'],
      phoneNumber: data['phoneNumber'],
      street: data['street'],
      city: data['city'],
      state: data['state'],
      postalCode: data['postalCode'],
      country: data['country'],
      isDefault: data['isDefault'],
    );
  }
}
