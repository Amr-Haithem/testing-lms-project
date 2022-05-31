import 'package:flutter/material.dart';

import '../../data/models/course.dart';
import '../../data/models/student.dart';

class InsideCourseStudent extends StatefulWidget {
  final Student student;
  final Course course;
  const InsideCourseStudent({Key? key, required this.student, required this.course}) : super(key: key);

  @override
  State<InsideCourseStudent> createState() => _InsideCourseStudentState();
}

class _InsideCourseStudentState extends State<InsideCourseStudent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("inside course student"),
      ),
    );
  }
}
