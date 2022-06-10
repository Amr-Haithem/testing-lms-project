import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../BL/cubit/student_courses_cubit/student_courses_cubit.dart';
import '../../data/models/course.dart';

import 'course_box.dart';
import 'package:testing_project/presentation/freq_used_widgets/course_box.dart';
class CourseGrid extends StatefulWidget {
  const CourseGrid({Key? key,required this.course}) : super(key: key);
  final Course course;

  @override
  State<CourseGrid> createState() => _CourseGridState();
}

class _CourseGridState extends State<CourseGrid> {
  List<Widget> makeListOfCourseBoxs(List<Course> courses) {
    List<CourseBox> listOfCourseBoxs = [];
    for (var couerse in courses) {
      listOfCourseBoxs.add(CourseBox(course: widget.course, onTap: () {  },));
    }
    if (listOfCourseBoxs.isEmpty) {
      return [
        const Text("no courses registered yet!")
      ];
    } else {
      return listOfCourseBoxs;
    }
  }

@override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: BlocBuilder<StudentCoursesCubit, StudentCoursesState>(
                builder: (context, state) {
              if (state is StudentCoursesLoaded) {
                return Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 35,
                  //we have to implement here a function
                  // that takes the books from the state and build the list
                  children: makeListOfCourseBoxs((state).courses),
                );
              } else if (state is StudentCoursesToChooseError) {
                return const Center(
                  child: Text("Error"),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
          ),
        ),
      ),
    );
  }
}
