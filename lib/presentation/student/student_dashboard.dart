import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testing_project/BL/cubit/student_courses_cubit/student_courses_cubit.dart';
import 'package:testing_project/BL/cubit/student_functionalities_cubit/student_funcationalities_cubit.dart';
import 'package:testing_project/constants/colors.dart';
import 'package:testing_project/constants/urls.dart';
import 'package:testing_project/data/models/student.dart';

import '../../data/models/course.dart';
import '../freq_used_widgets/course_box.dart';
import '../freq_used_widgets/funky_overlay.dart';

class StudentDashBoard extends StatefulWidget {
  final Student student;
  const StudentDashBoard({Key? key, required this.student}) : super(key: key);

  @override
  State<StudentDashBoard> createState() => _StudentDashBoardState();
}

class _StudentDashBoardState extends State<StudentDashBoard> {
  Widget courseToBeSelectedContainer(
      Course course, double width, bool selected, Function(bool) onPressed) {
    return InkWell(
      onTap: () {
        selected = !selected;
        onPressed(selected);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: selected ? Colors.amber : darkGrey),
                width: width,
                height: 150,
                child: Text(course.name + " " + course.id.toString(),
                    style: TextStyle(color: Colors.white))),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    BlocProvider.of<StudentCoursesCubit>(context)
        .getStudentCourses(widget.student);
    super.initState();
  }

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
        appBar: AppBar(
          backgroundColor: darkGrey,
          title: const Center(child: Text('dashboard')),
        ),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('My credentials'),
              Container(
                height: height * .2,
                width: width * .8,
                child: const Text("data here"),
                color: darkGrey,
              ),
              const Text('My courses'),
              MultiBlocListener(
                listeners: [
                  BlocListener<StudentCoursesCubit, StudentCoursesState>(
                    listener: (context, state) {
                      if (state is StudentCoursesLoaded) {
                        if (state.courses.isEmpty) {
                          BlocProvider.of<StudentCoursesCubit>(context)
                              .getAllCourses();
                        }
                      }
                    },
                  ),
                  BlocListener<StudentFuncationalitiesCubit,
                      StudentFuncationalitiesState>(
                    listener: (context, state) {
                      if (state
                          is StudentFuncationalitiesRegisteringCoursesLoaded) {
                        BlocProvider.of<StudentCoursesCubit>(context)
                            .getStudentCourses(widget.student);
                      }
                    },
                  ),
                ],
                child: BlocBuilder<StudentCoursesCubit, StudentCoursesState>(
                  builder: (context, state) {
                    if (state is StudentCoursesToChooseLoaded) {
                      return Container(
                          child: registerCourseWidget(
                              widget.student, state.courses, width));
                    } else if (state is StudentCoursesToChooseLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is StudentCoursesToChooseError) {
                      return const Center(
                        child: Text("error"),
                      );
                    }
                    if (state is StudentCoursesLoaded) {
                      List<CourseBox> courseBoxes = [];

                      for (var course in state.courses) {
                        courseBoxes.add(CourseBox(
                          course: course,
                          onTap: () {
                            Navigator.pushNamed(context, insideCourseStudent,
                                arguments: [widget.student, course]);
                          },
                        ));
                      }
                      return Wrap(
                        spacing: 20,
                        runSpacing: 20,
                        direction: Axis.horizontal,
                        children: courseBoxes,
                      );
                    } else if (state is StudentCoursesLoading ||
                        state is StudentCoursesInitial) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return const Center(child: Text("error"));
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

//todo change color when selected + implement register button to register courses
  Widget registerCourseWidget(
      Student student, List<Course> courses, double width) {
    List<Widget> courseContainers = [];
    List<Course> coursesToBeRegistered = [];
    for (var course in courses) {
      courseContainers
          .add(courseToBeSelectedContainer(course, 150, false, (selected) {
        if (selected) {
          coursesToBeRegistered.add(course);
          print(coursesToBeRegistered);
        } else {
          coursesToBeRegistered.remove(course);
          print(coursesToBeRegistered);
        }
      }));
    }

    return Column(
      children: [
        SizedBox(
          height: 150,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: courseContainers,
          ),
        ),
        ElevatedButton(
            onPressed: () {
              if (coursesToBeRegistered.isNotEmpty) {
                BlocProvider.of<StudentFuncationalitiesCubit>(context)
                    .registerCoursesForAStudent(student, coursesToBeRegistered);
              } else {
                showDialog(
                  context: context,
                  builder: (_) => const FunkyOverlay(
                    message: "select courses to register",
                  ),
                );
              }
            },
            child: const Text("Register"))
      ],
    );
  }
}
