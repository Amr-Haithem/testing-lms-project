import 'package:flutter/material.dart';

import '../../data/models/course.dart';
import '../../data/models/student.dart';

import 'package:testing_project/presentation/freq_used_widgets/editable_textformfield.dart';
import 'package:testing_project/presentation/freq_used_widgets/button_widget.dart';
import 'package:testing_project/presentation/freq_used_widgets/bottom_sheet.dart';
import 'package:testing_project/presentation/freq_used_widgets/appbar_widget.dart';
import 'package:flutter/cupertino.dart';

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
      appBar: buildAppBar(context,"course name"),
      body: Center(
        child: Text("inside course student"),
      ),
    );
  }
}
