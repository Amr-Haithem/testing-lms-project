import 'dart:convert';

class Professor {
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

  Professor copyWith({
    int? id,
    String? name,
    String? userName,
    String? password,
  }) {
    return Professor(
      id: id ?? this.id,
      name: name ?? this.name,
      userName: userName ?? this.userName,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'userName': userName,
      'password': password,
    };
  }

  factory Professor.fromMap(Map<String, dynamic> map) {
    return Professor(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      userName: map['userName'] ?? '',
      password: map['password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Professor.fromJson(String source) => Professor.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Professor(id: $id, name: $name, userName: $userName, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Professor &&
      other.id == id &&
      other.name == name &&
      other.userName == userName &&
      other.password == password;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      userName.hashCode ^
      password.hashCode;
  }
}
