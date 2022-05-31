import 'package:flutter/material.dart';
import 'package:testing_project/constants/colors.dart';

import '../../data/models/course.dart';

class CourseBox extends StatelessWidget {
  final Course course;
  final Function() onTap;
  const CourseBox({Key? key, required this.course, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(13), color: darkGrey),
        width: 150,
        height: 150,
        child: Center(
          child: Text(
            course.name,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
