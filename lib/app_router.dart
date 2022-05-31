import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testing_project/BL/cubit/authentication_cubit/authentication_cubit.dart';
import 'package:testing_project/BL/cubit/professor_functionalities_cubit/professor_functionalities_content/professor_functionalities_content_cubit.dart';
import 'package:testing_project/BL/cubit/professor_functionalities_cubit/professor_functionalities_questions/professor_functionalities_questions_cubit.dart';
import 'package:testing_project/BL/cubit/professors_courses_cubit/professor_courses_cubit.dart';
import 'package:testing_project/BL/cubit/student_courses_cubit/student_courses_cubit.dart';
import 'package:testing_project/BL/cubit/student_functionalities_cubit/student_funcationalities_cubit.dart';
import 'package:testing_project/constants/urls.dart';
import 'package:testing_project/data/models/professor.dart';
import 'package:testing_project/data/models/student.dart';
import 'package:testing_project/presentation/professor/inside_course_professor.dart';
import 'package:testing_project/presentation/professor/professor_dashboard.dart';
import 'package:testing_project/presentation/signIn.dart';
import 'package:testing_project/presentation/student/inside_course_student.dart';
import 'package:testing_project/presentation/student/student_dashboard.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case professorDashBoard:
        final professor = settings.arguments as Professor;
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  lazy: false,
                  create: (context) => ProfessorCoursesCubit(),
                  child: ProfessorDashBoard(professor: professor),
                ));
      case signInScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  lazy: false,
                  create: (context) => AuthenticationCubit(),
                  child: const SignInScreen(),
                ));
      case studentDashBoard:
        final student = settings.arguments as Student;

        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      lazy: false,
                      create: (context) => StudentCoursesCubit(),
                    ),
                    BlocProvider(
                      lazy: false,
                      create: (context) => StudentFuncationalitiesCubit(),
                    ),
                  ],
                  child: StudentDashBoard(student: student),
                ));
      case insideCourseProfessor:
        // final professor = settings.arguments as Professor;
        final professorThenCourse = settings.arguments as List;

        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                lazy: false,
                create: (context) => ProfessorFunctionalitiesContentCubit(),
              ),
              BlocProvider(
                lazy: false,
                create: (context) => ProfessorFunctionalitiesQuestionsCubit(),
              ),
            ],
            child: InsideCourseProfessor(
                professor: professorThenCourse[0],
                course: professorThenCourse[1]),
          ),
        );
      case insideCourseStudent:
        final studentThenCourse = settings.arguments as List;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            lazy: false,
            create: (context) => StudentFuncationalitiesCubit(),
            child: InsideCourseStudent(
                student: studentThenCourse[0], course: studentThenCourse[1]),
          ),
        );
    }
  }
}
