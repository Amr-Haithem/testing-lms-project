import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testing_project/BL/cubit/professor_functionalities_cubit/professor_functionalities_content/professor_functionalities_content_cubit.dart';
import 'package:testing_project/BL/cubit/professor_functionalities_cubit/professor_functionalities_questions/professor_functionalities_questions_cubit.dart';
import 'package:testing_project/constants/colors.dart';
import 'package:testing_project/data/models/professor.dart';

import '../../data/models/course.dart';

class InsideCourseProfessor extends StatefulWidget {
  final Professor professor;
  final Course course;
  const InsideCourseProfessor(
      {Key? key, required this.professor, required this.course})
      : super(key: key);

  @override
  State<InsideCourseProfessor> createState() => _InsideCourseProfessorState();
}

class _InsideCourseProfessorState extends State<InsideCourseProfessor> {
  @override
  void initState() {
    BlocProvider.of<ProfessorFunctionalitiesQuestionsCubit>(context)
        .getCourseExcersizes(widget.course);
    BlocProvider.of<ProfessorFunctionalitiesContentCubit>(context)
        .getCourseContent(widget.professor, widget.course);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit material"),
        backgroundColor: darkGrey,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text("add content"),
                ElevatedButton(onPressed: () async {}, child: const Text('add'))
              ],
            ),
            BlocBuilder<ProfessorFunctionalitiesContentCubit,
                    ProfessorFunctionalitiesContentState>(
                builder: (context, state) {
              if (state is ProfessorFunctionalitiesContentLoaded) {
                return Padding(
                  padding: const EdgeInsets.all(35.0),
                  child: Container(
                      height: 200,
                      color: darkGrey,
                      width: double.infinity,
                      child: Center(
                        child: Text(state.content),
                      )),
                );
              } else if (state is ProfessorFunctionalitiesContentLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Center(
                  child: Text("Error"),
                );
              }
            }),
            BlocBuilder<ProfessorFunctionalitiesQuestionsCubit,
                    ProfessorFunctionalitiesQuestionsState>(
                builder: (context, state) {
              //todo implement the ui of questions
              return Row(
                children: [
                  Column(
                    children: [
                      Text("Set questions"),
                    ],
                  ),
                  Column(
                    children: const [
                      Text("set ans."),
                    ],
                  )
                ],
              );
            }),
            Container(),
            ElevatedButton(
                onPressed: () {}, child: const Text("submit questions"))
          ],
        ),
      ),
    );
  }
}
