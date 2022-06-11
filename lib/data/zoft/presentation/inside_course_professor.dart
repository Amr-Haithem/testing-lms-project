import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testing_project/BL/cubit/professor_functionalities_cubit/professor_functionalities_content/professor_functionalities_content_cubit.dart';
import 'package:testing_project/BL/cubit/professor_functionalities_cubit/professor_functionalities_questions/professor_functionalities_questions_cubit.dart';
import 'package:testing_project/constants/colors.dart';
import 'package:testing_project/data/models/course.dart';
import 'package:testing_project/data/models/excersize.dart';
import 'package:testing_project/data/models/professor.dart';
import 'package:testing_project/presentation/freq_used_widgets/button_widget.dart';
import 'package:testing_project/presentation/freq_used_widgets/bottom_sheet.dart';
import 'package:testing_project/presentation/freq_used_widgets/appbar_widget.dart';
import '../../../constants/measures.dart';
import 'package:testing_project/presentation/freq_used_widgets/querstion_card.dart';
import 'package:testing_project/presentation/freq_used_widgets/editable_textformfield.dart';

class InsideCourseProfessor extends StatefulWidget {
  final Professor professor;
  final Course course;
  const InsideCourseProfessor({
    Key? key,
    required this.professor,
    required this.course,
  }) : super(key: key);

  @override
  State<InsideCourseProfessor> createState() => _InsideCourseProfessorState();
}

class _InsideCourseProfessorState extends State<InsideCourseProfessor> {
  String question1 = "Question 1";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update Course material"),
        backgroundColor: darkGrey,
      ),
      body: ListView(
        children: [
          Column(children: [
            const SizedBox(
              height: defaultPadding * 2,
            ),

            //course content
            ContentCard(context, widget.course),

            const SizedBox(
              height: defaultPadding,
            ),

            Center(
                child: ButtonWidget(
              text: "Add course content",
              onClicked: () {},
            )),

            const SizedBox(
              height: defaultPadding,
            ),

            //  Container(),

            //
            QuestionCard(
              key: const Key('questionCard1'),
              excersize: excersize1,
            ),
            QuestionCard(
              key: const Key('questionCard2'),
              excersize: excersize2,
            ),
            QuestionCard(
              key: const Key('questionCard3'),
              excersize: excersize3,
            ),


            const SizedBox(
              height: defaultPadding,
            ),

            Center(
                child: ButtonWidget(
                  key: const Key("submitQuestions"),
              text: "submit questions",
              onClicked: () {},
            )),

            const SizedBox(
              height: defaultPadding,
            ),
          ]),
        ],
      ),
    );
  }
}

Widget buildQuestion1(BuildContext context, Course course) => TextFormField(
    decoration: const InputDecoration(
        labelStyle: const TextStyle(
      color: mainBlack,
      fontSize: defaultPadding,
    )),
    initialValue: "${excersize1.question}",
    onChanged: (String? value) {
      excersize1.question = "${value}";
    });

Widget ContentCard(BuildContext context, Course course) => Container(
      width: defaultPadding * 20,
      height: defaultPadding * 15,
      padding: const EdgeInsets.all(defaultPadding / 10),
      decoration: const BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.all(Radius.circular(14)),
      ),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(defaultPadding / 4),
        decoration: const BoxDecoration(
// color: Color.fromARGB(255, 253, 253, 245),
          color: mainWhite,
          borderRadius: BorderRadius.all(Radius.circular(defaultBorderRadius)),
        ),
        child: TextFormField(
          key: Key('textFormFieldContentCard'), 
          decoration: const InputDecoration(
              labelText: "Course content",
              labelStyle: TextStyle(
                color: primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: defaultPadding * 1.5,
              )),
          initialValue: "${course.content}",
          onChanged: (String? value) {
            course.content = "${value}";
          },
          keyboardType: TextInputType.multiline,
          maxLines: null,
          textInputAction: TextInputAction.done,
          enableInteractiveSelection: true,
        ),
      ), //Text(state.content),
    );

final excersize1 =
    Excersize(id: 123, answer: 1, courseId: 123, question: 'How are you?');
final excersize2 =
    Excersize(id: 456, answer: 0, courseId: 456, question: "What's your name?");
final excersize3 =
    Excersize(id: 789, answer: 1, courseId: 789, question: 'How old are you?');
