import 'dart:convert';

import 'package:equatable/equatable.dart';

class Professor with EquatableMixin {
  int id;
  String name;
  String userName;
  String password;
  Professor({
    required this.id,
    required this.name,
    required this.userName,
    required this.password,
  });
 @override
  List<Object> get props {
    return [id, name, userName, password];
  }
}
