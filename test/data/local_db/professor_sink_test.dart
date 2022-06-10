import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testing_project/data/models/course.dart';
import 'package:testing_project/data/models/professor.dart';
import 'package:testing_project/data/zoft/professor_sink.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //unit testing for professor sink class
  ProfessorSink professorSink = ProfessorSink();

  test("test getProfessor function", () async {
    expect(
        await professorSink.getProfessor('shehab', 'sheba'),
        await Future.delayed((const Duration(seconds: 0)), () {
          return [
            {
              'user_name': 'shehab',
              'prof_id': 0,
              'password': 'sheba',
              'name': 'shehab'
            }
          ];
        }));
     expect(professorSink.getProfessor("", ""), null);
     expect(professorSink.getProfessor("faliure", 'faliure'), null);
  });

  //-----------------------------------------------------

  test("test getCoursesOfProfessor function", () async {
    expect(
        await professorSink.getCoursesOfProfessor(Professor(
            id: 0, name: 'shehab', userName: 'shehab', password: 'sheba')),
        await Future.delayed((Duration(seconds: 0)), () {
          return [
            {
              'prof_id': 0,
              'course_id': 0,
              'content': 'no content yet',
              'name': "vibration and waves"
            },
            {
              'prof_id': 0,
              'course_id': 1,
              'content': 'no content yet',
              'name': "Logic design"
            },
            {
              'prof_id': 0,
              'course_id': 2,
              'content': 'no content yet',
              'name': "Signals and systems"
            },
            {
              'prof_id': 0,
              'course_id': 6,
              'content': 'no content yet',
              'name': "Literature and love"
            }
          ];
        }));
     expect(professorSink.getProfessor("", ""), null);
     expect(professorSink.getProfessor("faliure", 'faliure'), null);
  });

  test("test getCourseContent function", () async {
    expect(
        await professorSink.getCourseContent(
            Professor(
                id: 0, name: 'shehab', userName: 'shehab', password: 'sheba'),
            Course(
                id: 0,
                name: 'vibration and waves',
                content: 'no content yet',
                profId: 0)),
        await Future.delayed((const Duration(seconds: 0)), () {
          return [
            {'content': 'no content yet'}
          ];
        }));
     expect(professorSink.getProfessor("", ""), null);
     expect(professorSink.getProfessor("faliure", 'faliure'), null);
  });

  test("test getCourseExcersizes function", () async {
    expect(
        await professorSink.getCourseExcersizes(Course(
            id: 0,
            name: 'vibration and waves',
            content: 'no content yet',
            profId: 0)),
        await Future.delayed((Duration(seconds: 0)), () {
          return [
            {
              'course_id': 0,
              'ex_id': 0,
              'question': 'set a question',
              'answer': false
            },
            {
              'course_id': 0,
              'ex_id': 1,
              'question': 'set a question',
              'answer': false
            },
            {
              'course_id': 0,
              'ex_id': 2,
              'question': 'set a question',
              'answer': false
            }
          ];
        }));
     expect(professorSink.getProfessor("", ""), null);
     expect(professorSink.getProfessor("faliure", 'faliure'), null);
  });
}
