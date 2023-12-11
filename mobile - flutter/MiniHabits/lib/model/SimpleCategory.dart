import 'package:cloud_firestore/cloud_firestore.dart';

class SimpleCategory {
  String uid = '';
  String name;

  SimpleCategory(this.name);

  SimpleCategory.complete({required this.name, required this.uid});

  factory SimpleCategory.fromJson(
          DocumentSnapshot<Map<String, dynamic>> json, String uid) =>
      SimpleCategory.complete(name: json['name'], uid: uid);

  Map<String, dynamic> toJson() => {
        'name': name,
      };
}
