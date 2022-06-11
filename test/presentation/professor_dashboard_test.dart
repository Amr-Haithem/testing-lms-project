import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testing_project/constants/urls.dart';
import 'package:testing_project/data/models/professor.dart';
import 'package:testing_project/data/models/student.dart';
import 'package:testing_project/data/zoft/presentation/professor_dashboard.dart';
import 'package:testing_project/presentation/student/student_dashboard.dart';

void main() {
  Widget testWidget = MaterialApp(
      home: StudentDashBoard(
    student: Student(id: 0, name: "a", userName: "adsf", password: "fasf"),
  ));

  testWidgets("student dashboard screen test", (WidgetTester widgetTester) async {
    //find all widgets needed

    final course1Button = find.byKey(const ValueKey('course1'));
    final course2Button = find.byKey(const ValueKey('course2'));

    //execute actual text

    await widgetTester.pumpWidget(testWidget);

    await widgetTester.tap(course1Button);
    await widgetTester.tap(course2Button);
    await widgetTester.pump();

    //check outputs

    expect(find.byKey(const ValueKey('course1')), findsOneWidget);
    expect(find.byKey(const ValueKey('course1')), findsOneWidget);
  });
}
