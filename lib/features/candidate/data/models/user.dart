
import 'package:job_search/features/candidate/data/models/work.dart';

import 'education.dart';

class User {
  String? id;
  String? firstName;
  String? lastName;
  String? gender;
  String? phone;
  String? email;
  String? type;
  String? password;
  String? username;
  String? isVerified;

  String? cname;
  String? country;
  String? region;
  String? cabout;
  String? cdesc;
  String? csector;
  String? avatarImage;

  String? title;
  String? sector;
  String? summary;
  List<String>? skills;

  List<Work>? workSet;
  List<Education>? educationSet;

  User({
    this.id,
    this.firstName,
    this.lastName,
    this.phone,
    this.email,
    this.password,
    this.username,
    this.gender,
    this.type,
    this.cname,
    this.country,
    this.cabout,
    this.cdesc,
    this.csector,
    this.region,
    this.sector,
    this.skills,
    this.summary,
    this.title,
    this.workSet,
    this.educationSet,
    this.avatarImage,
    this.isVerified,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        phone: json['phone'],
        email: json['email'],
        password: json['password'],
        username: json['username'],);
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'phone': phone,
      'email': email,
      'password': password,
      'username': username,
    };
  }
}
