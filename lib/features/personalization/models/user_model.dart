import 'package:winter_store/utils/formatters/formatter.dart';

class UserModel {
  String id;
  String firstName;
  String lastName;
  String username;
  String email;
  String phoneNumber;
  String profilePicture;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.profilePicture,
  });

  String get fullName => '$firstName $lastName';

  String get formatPhoneNumber => TFormatter.formatPhoneNumber(phoneNumber);

  static List<String> nameParts(String fullName) => fullName.split(' ');

  static String generateUsername(String fullName) {
    List<String> nameParts = fullName.split(' ');
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : '';

    String camelCaseUsername = '$firstName$lastName';
    String usernameWithPrefix = 'winter_$camelCaseUsername';
    return usernameWithPrefix;
  }

  static UserModel empty() => UserModel(
      id: '',
      firstName: '',
      lastName: '',
      username: '',
      email: '',
      phoneNumber: '',
      profilePicture: '');

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      username: map['username'],
      email: map['email'],
      phoneNumber: map['phoneNumber'],
      profilePicture: map['profilePicture'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'username': username,
      'email': email,
      'phoneNumber': phoneNumber,
      'profilePicture': profilePicture,
    };
  }
}
