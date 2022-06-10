import 'package:testing_project/data/models/excersize.dart';

import '../../data/models/course.dart';
import '/app_router.dart';
import '/constants/measures.dart';
import '/constants/colors.dart';
import 'package:flutter/material.dart';

import 'course_box.dart';

class EditableTextFormField extends StatefulWidget {

final Excersize excersize;

  const EditableTextFormField(
      {Key? key, required this.excersize})
      : super(key: key);

  @override
  State<EditableTextFormField> createState() => _EditableTextFormFieldState();
}

class _EditableTextFormFieldState extends State<EditableTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
          labelStyle: TextStyle(
            color: mainWhite,
            fontSize: defaultPadding,
          )
      ),
      initialValue: "${widget.excersize.question}",
      onChanged: (String? value) {
        widget.excersize.question = "${value}";
      },
    );
  }
}