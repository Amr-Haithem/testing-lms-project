import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testing_project/BL/cubit/authentication_cubit/authentication_cubit.dart';
import 'package:testing_project/BL/cubit/professors_courses_cubit/professor_courses_cubit.dart';
import 'package:testing_project/constants/colors.dart';
import 'package:testing_project/constants/urls.dart';
import 'package:testing_project/data/models/professor.dart';
import 'package:testing_project/data/models/student.dart';
import 'package:testing_project/presentation/freq_used_widgets/course_box.dart';
import 'package:testing_project/presentation/freq_used_widgets/button_widget.dart';
import 'package:testing_project/presentation/freq_used_widgets/bottom_sheet.dart';
import 'package:testing_project/presentation/freq_used_widgets/appbar_widget.dart';

import '../../models/course.dart';

class ProfessorDashBoard extends StatefulWidget {
  final Professor professor;
  const ProfessorDashBoard({Key? key, required this.professor})
      : super(key: key);

  @override
  State<ProfessorDashBoard> createState() => _ProfessorDashBoardState();
}

class _ProfessorDashBoardState extends State<ProfessorDashBoard> {
  List<Widget> courseBoxes = [
    CourseBox(
      course: Course(id: 0, name: "something", content: "content", profId: 5),
      onTap: () {},
      key: Key("course1"),
    ),
    CourseBox(
      course: Course(id: 0, name: "otherthing", content: "content", profId: 5),
      onTap: () {},
      key: Key("course2"),
    )
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacementNamed(context, signInScreen);
        return false;
      },
      child: Scaffold(
        appBar: buildAppBar(context, "Dashboard"),
        body: SizedBox(
          width: double.infinity,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Text('My credentials'),
            Container(
              height: height * .2,
              width: width * .8,
              child: Text("data here"),
              color: darkGrey,
            ),
            Text('My courses'),
            Wrap(
              spacing: 20,
              runSpacing: 20,
              direction: Axis.horizontal,
              children: courseBoxes,
            )
          ]),
        ),
      ),
    );
  }
}
