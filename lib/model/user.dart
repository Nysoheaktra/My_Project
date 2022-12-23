import 'dart:convert';

import 'package:hive/hive.dart';
part 'user.g.dart';

User userFromJson(String str) => User.fromJson(jsonDecode(str));

@HiveType(typeId: 4)
class User {
  @HiveField(0)
  String id;
  @HiveField(1)
  String fullname;
  @HiveField(2)
  String email;
  @HiveField(3)
  String? image;
  @HiveField(4)
  DateTime? brithDate;

  User(
      {required this.id,
      required this.email,
      required this.fullname,
      this.image,
      this.brithDate});

  factory User.fromJson(Map<String, dynamic> data) => User(
      id: data['id'].toString(),
      email: data['fullName'],
      fullname: data['email'],
      image: data['image'] == null ? null : data['image']['url'],
      brithDate: data['age'] == null ? null : DateTime.parse(data['age']));
}
