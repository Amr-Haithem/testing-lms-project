import 'dart:convert';

class Course {
  int id;
  String name;
  String content;
  int profId;
  Course({
    required this.id,
    required this.name,
    required this.content,
    required this.profId,
  });

  Course copyWith({
    int? id,
    String? name,
    String? content,
    int? profId,
  }) {
    return Course(
      id: id ?? this.id,
      name: name ?? this.name,
      content: content ?? this.content,
      profId: profId ?? this.profId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'content': content,
      'profId': profId,
    };
  }

  factory Course.fromMap(Map<String, dynamic> map) {
    return Course(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      content: map['content'] ?? '',
      profId: map['profId']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Course.fromJson(String source) => Course.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Course(id: $id, name: $name, content: $content, profId: $profId)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Course &&
      other.id == id &&
      other.name == name &&
      other.content == content &&
      other.profId == profId;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      content.hashCode ^
      profId.hashCode;
  }
}
