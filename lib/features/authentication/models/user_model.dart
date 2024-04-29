import 'package:ecommerce_flutter/utils/formatters/formatter.dart';

class UserModel {
  final String id;
  String firstName;
  String lastName;
  final String userName;
  String phoneNo;
  final String email;
  String profilePicture;

  UserModel(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.userName,
      required this.phoneNo,
      required this.email,
      required this.profilePicture});

  static List<String> nameparts(name) => name.split(' ');

  String get fullName => '$firstName $lastName';
  String get formattedPhoneNo => TFormatter.formatPhoneNumber(phoneNo);
  static String genetrateUsername(String fullName) {
    final List<String> nameparts = fullName.split(' ');
    final firstName = nameparts.first.toLowerCase();
    final lastName = nameparts.length > 1 ? nameparts[1].toLowerCase() : '';
    return '$firstName$lastName';
  }

  static UserModel get empty => UserModel(
      id: '',
      firstName: '',
      lastName: '',
      userName: '',
      phoneNo: '',
      email: '',
      profilePicture: '');

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'userName': userName,
      'phoneNo': phoneNo,
      'email': email,
      'profilePicture': profilePicture,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as String,
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      userName: map['userName'] as String,
      phoneNo: map['phoneNo'] as String,
      email: map['email'] as String,
      profilePicture: map['profilePicture'] as String,
    );
  }

  UserModel copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? userName,
    String? phoneNo,
    String? email,
    String? profilePicture,
  }) {
    return UserModel(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      userName: userName ?? this.userName,
      phoneNo: phoneNo ?? this.phoneNo,
      email: email ?? this.email,
      profilePicture: profilePicture ?? this.profilePicture,
    );
  }
}
