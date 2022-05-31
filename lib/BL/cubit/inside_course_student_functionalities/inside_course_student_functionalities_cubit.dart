import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:testing_project/data/models/course.dart';
import 'package:testing_project/data/models/excersize.dart';
import 'package:testing_project/data/models/student.dart';
part 'inside_course_student_functionalities_state.dart';

class InsideCourseStudentFunctionalitiesCubit
    extends Cubit<InsideCourseStudentFunctionalitiesState> {
  InsideCourseStudentFunctionalitiesCubit()
      : super(InsideCourseStudentFunctionalitiesInitial());
  // List<Excersize> getExcersizesForThatCourse(Course course) {
  //   //impementation
  // }

  void setStudentMarkForThisCourse(Student student, Course course) {
    //impementation
  }
}
