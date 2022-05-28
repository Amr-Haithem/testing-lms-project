import 'dart:convert';

class Student {
  int id;
  String name;
  String userName;
  String password;
  Student({
    required this.id,
    required this.name,
    required this.userName,
    required this.password,
  });

  Student copyWith({
    int? id,
    String? name,
    String? userName,
    String? password,
  }) {
    return Student(
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

  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      userName: map['userName'] ?? '',
      password: map['password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Student.fromJson(String source) => Student.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Student(id: $id, name: $name, userName: $userName, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Student &&
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
