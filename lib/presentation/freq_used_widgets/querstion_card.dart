import 'package:testing_project/data/models/excersize.dart';
import 'package:testing_project/presentation/freq_used_widgets/editable_textformfield.dart';

import '../../data/models/course.dart';
import '/app_router.dart';
import '/constants/measures.dart';
import '/constants/colors.dart';
import 'package:flutter/material.dart';

import 'course_box.dart';

class QuestionCard extends StatefulWidget {
  final Excersize excersize;
  const QuestionCard({Key? key, required this.excersize});

  @override
  State<QuestionCard> createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
  bool yes_answer_is_checked = false;
  bool no_answer_is_checked = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // const SizedBox(height: defaultPadding,),
        // Text('Question #${widget.question_number}:',   style: TextStyle(fontWeight: FontWeight.bold,),),
        const SizedBox(
          height: defaultPadding,
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(defaultPadding / 10),
            decoration: const BoxDecoration(
              // color: Color.fromARGB(255, 253, 253, 245),
              color: primaryColor,
              borderRadius:
                  BorderRadius.all(Radius.circular(defaultBorderRadius)),
            ),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(defaultPadding / 2),
              decoration: const BoxDecoration(
                // color: Color.fromARGB(255, 253, 253, 245),
                color: mainWhite,
                borderRadius:
                    BorderRadius.all(Radius.circular(defaultBorderRadius)),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(defaultPadding / 10),
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
                          borderRadius: BorderRadius.all(
                              Radius.circular(defaultBorderRadius)),
                        ),
                        child: EditableTextFormField(
                          excersize: widget.excersize,
                          key: widget.key,
                        ), //   const Text('My Courses:',   style: TextStyle(fontWeight: FontWeight.bold,),),
                        //  Image.network('https://eng.asu.edu.eg/img/logo.png'),
                      ),
                    ),
                  ),
                  //   const SizedBox(width: defaultPadding),

                  SizedBox(
                    //  width: 100,
                    child: Row(
                      children: [
                        Checkbox(
                            value: yes_answer_is_checked,
                            activeColor: Colors.green,
                            focusColor: Colors.green,
                            checkColor: Colors.white,
                            onChanged: (value) {
                              setState(
                                () {
                                  yes_answer_is_checked = value!;
                                  no_answer_is_checked = !yes_answer_is_checked;
                                  //  no_answer_is_checked = !yes_answer_is_checked;
                                },
                              );
                            }),
                        Checkbox(
                            value: no_answer_is_checked,
                            focusColor: Colors.red,
                            activeColor: Colors.red,
                            checkColor: mainWhite,
                            onChanged: (value) {
                              setState(
                                () {
                                  no_answer_is_checked = value!;
                                  yes_answer_is_checked = !no_answer_is_checked;
                                },
                              );
                            }),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
