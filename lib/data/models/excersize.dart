import 'package:equatable/equatable.dart';

class Excersize with EquatableMixin{
  int id;
  String question;
  int answer;
  int courseId;
  Excersize({
    required this.id,
    required this.question,
    required this.answer,
    required this.courseId,
  });
  @override
  List<Object> get props {
    return [id, question, answer, courseId];
  }
}
