
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testing_project/data/models/course.dart';
import 'package:testing_project/data/models/professor.dart';
import 'package:testing_project/data/models/student.dart';
import 'package:testing_project/data/zoft/presentation/inside_course_professor.dart';
import 'package:testing_project/presentation/student/inside_course_student.dart';

void main() {
  Widget testWidget = MaterialApp(
      home: InsideCourseStudent(
    student:
        Student(id: 0, name: "amr", userName: "amr", password: "amor"),
    course: Course(id: 0, name: "course", content: 'content', profId: 7),
  ));
  testWidgets("inside course student screen ",
      (WidgetTester widgetTester) async {
    //find all widgets needed

    final questionCard1 = find.byKey(const ValueKey('questionCard1'));
    final questionCard2 = find.byKey(const ValueKey('questionCard2'));
    final questionCard3 = find.byKey(const ValueKey('questionCard3'));
    final submitButton = find.byKey(const ValueKey("submitQuestions"));
    //execute actual text

    await widgetTester.pumpWidget(testWidget);
    await widgetTester.tap(questionCard1);
    await widgetTester.tap(questionCard2);
    await widgetTester.tap(questionCard3);
    await widgetTester.tap(submitButton); 
    await widgetTester.pump();
    //check outputs
    expect(find.text('Today is a great day'), findsOneWidget);
    expect(find.byKey(ValueKey(questionCard1)), findsOneWidget);
    expect(find.byKey(ValueKey(questionCard2)), findsOneWidget);
    expect(find.byKey(ValueKey(questionCard3)), findsOneWidget);
    expect(find.byKey(ValueKey(submitButton)), findsOneWidget);
  });
}
