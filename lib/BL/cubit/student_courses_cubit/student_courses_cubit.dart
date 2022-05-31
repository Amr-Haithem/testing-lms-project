import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:testing_project/data/models/student.dart';
import 'package:testing_project/data/repository/student_sink_repo.dart';

import '../../../data/models/course.dart';

part 'student_courses_state.dart';

class StudentCoursesCubit extends Cubit<StudentCoursesState> {
  StudentCoursesCubit() : super(StudentCoursesInitial());
  final StudentSinkRepo _studentSinkRepo = StudentSinkRepo();

  void getStudentCourses(Student student) {
    emit(StudentCoursesLoading());
    _studentSinkRepo.getStudentCourses(student).then((courses) {
      print("meoooooow ");
      print(courses);
      emit(StudentCoursesLoaded(courses: courses));
    }).onError((error, stackTrace) {
      print("bararara");
      emit(StudentCoursesError());
    });
  }

  void getAllCourses() {
    emit(StudentCoursesToChooseLoading());

    _studentSinkRepo.getAllCourses().then((courses) {
      print("courses are ");
      print(courses);
      emit(StudentCoursesToChooseLoaded(courses: courses));
    }).onError((error, stackTrace) {
      emit(StudentCoursesToChooseError());
    });
  }
}
