import 'dart:convert';

class Excersize {
  int id;
  String question;
  String answer;
  int courseId;
  Excersize({
    required this.id,
    required this.question,
    required this.answer,
    required this.courseId,
  });

  Excersize copyWith({
    int? id,
    String? question,
    String? answer,
    int? courseId,
  }) {
    return Excersize(
      id: id ?? this.id,
      question: question ?? this.question,
      answer: answer ?? this.answer,
      courseId: courseId ?? this.courseId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'question': question,
      'answer': answer,
      'courseId': courseId,
    };
  }

  factory Excersize.fromMap(Map<String, dynamic> map) {
    return Excersize(
      id: map['id']?.toInt() ?? 0,
      question: map['question'] ?? '',
      answer: map['answer'] ?? '',
      courseId: map['courseId']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Excersize.fromJson(String source) => Excersize.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Excersize(id: $id, question: $question, answer: $answer, courseId: $courseId)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Excersize &&
      other.id == id &&
      other.question == question &&
      other.answer == answer &&
      other.courseId == courseId;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      question.hashCode ^
      answer.hashCode ^
      courseId.hashCode;
  }
}
