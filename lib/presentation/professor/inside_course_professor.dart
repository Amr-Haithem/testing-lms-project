import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testing_project/BL/cubit/professor_functionalities_cubit/professor_functionalities_content/professor_functionalities_content_cubit.dart';
import 'package:testing_project/BL/cubit/professor_functionalities_cubit/professor_functionalities_questions/professor_functionalities_questions_cubit.dart';
import 'package:testing_project/constants/colors.dart';
import 'package:testing_project/data/models/excersize.dart';
import 'package:testing_project/data/models/professor.dart';
import 'package:testing_project/presentation/freq_used_widgets/button_widget.dart';
import 'package:testing_project/presentation/freq_used_widgets/bottom_sheet.dart';
import 'package:testing_project/presentation/freq_used_widgets/appbar_widget.dart';
import '../../constants/measures.dart';
import '../../data/models/course.dart';
import 'package:testing_project/presentation/freq_used_widgets/querstion_card.dart';
import 'package:testing_project/presentation/freq_used_widgets/editable_textformfield.dart';

class InsideCourseProfessor extends StatefulWidget {
  final Professor professor;
  final Course course;
  const InsideCourseProfessor(
      {Key? key, required this.professor, required this.course, })
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
          Column(
          children: [

            SizedBox(height: defaultPadding*2,),

            BlocBuilder<ProfessorFunctionalitiesContentCubit,
                    ProfessorFunctionalitiesContentState>(
                builder: (context, state) {
                  ////*****************************************//
                  //course content
              if (state is ProfessorFunctionalitiesContentLoaded) {
                return ContentCard( context,  widget.course);
                ////*****************************************//


              } else if (state is ProfessorFunctionalitiesContentLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return const Center(
                  child: Text("Error"),
                );
              }
            }),
          //  SizedBox(height: defaultPadding*1.5,),
            SizedBox(height: defaultPadding,),

          /////******************************//
            Center(child: ButtonWidget(text: "Add course content", onClicked: (){},)),

            SizedBox(height: defaultPadding,),

            BlocBuilder<ProfessorFunctionalitiesQuestionsCubit,
                    ProfessorFunctionalitiesQuestionsState>(
                builder: (context, state) {
                  if(state is ProfessorFunctionalitiesQuestionsLoaded){
                    state.excersizes.forEach((excersize) {QuestionCard( excersize: excersize);});
                  }
              //todo implement the ui of questions
              return Padding(
                padding: const EdgeInsets.all(defaultPadding/4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: const [
                        Text(
                            "Set questions",
                          style: TextStyle(
                            fontSize: defaultPadding *1.2,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: const [
                        Text(
                          "Set Answers",
                          style: TextStyle(
                            fontSize: defaultPadding *1.2,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              );
            }),

          //  Container(),

           //
             QuestionCard(excersize: excersize1,),
            QuestionCard(excersize: excersize2,),
            QuestionCard(excersize: excersize3,),

            // // const SizedBox(height: defaultPadding,),
           //
           //  QuestionCard(excersize: ,),
           //  //const SizedBox(height: defaultPadding,),
           //
           //  QuestionCard(course: widget.course, question_number: 3),

            //  buildQuestion1(context,widget.course),

        //  list of questions:


  //      buildQuestion1(context,widget.course),


        const SizedBox(height: defaultPadding,),

        Center(child: ButtonWidget(text: "submit questions", onClicked: (){},)),

            const SizedBox(height: defaultPadding,),
          ]
        ),
     ], ),
    );
  }
}
Widget buildQuestion1(BuildContext context, Course course) =>
TextFormField(
decoration: InputDecoration(
labelStyle: TextStyle(
color: mainBlack,
fontSize: defaultPadding,
)
),
initialValue: "${excersize1.question}",
onChanged: (String? value) {
  excersize1.question = "${value}";
}
);



Widget ContentCard(BuildContext context, Course course) => Container(
width: defaultPadding*20,
  height: defaultPadding*15,
  padding: EdgeInsets.all(defaultPadding /10),
  decoration: const BoxDecoration(
    color: primaryColor,
    borderRadius: BorderRadius.all(Radius.circular(14)),
  ),
  child: Container(
    width: double.infinity,

    padding: const EdgeInsets.all(defaultPadding /4),
    decoration: const BoxDecoration(
// color: Color.fromARGB(255, 253, 253, 245),
      color: mainWhite,
      borderRadius: BorderRadius.all(Radius.circular(defaultBorderRadius)),
    ),
          child: TextFormField(

            decoration: const InputDecoration(

                labelText: "Course content",
                labelStyle: TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: defaultPadding*1.5,
                )
            ),
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


final excersize1 = Excersize(id: 123, answer: 1, courseId: 123, question: 'How are you?');
final excersize2 = Excersize(id: 456, answer: 0, courseId: 456, question: "What's your name?");
final excersize3 = Excersize(id: 789, answer: 1, courseId: 789, question: 'How old are you?');
