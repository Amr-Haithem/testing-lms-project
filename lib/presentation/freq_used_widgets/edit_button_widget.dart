import '../../data/models/course.dart';
import '/constants/measures.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/measures.dart';
import 'course_box.dart';

class EditButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String? currentData;
  final String lable; //the data lable to be edited
  final Course course;
  final Function(String) onChanged;
  const EditButtonWidget({
    Key? key,
    required this.onPressed,
    required this.currentData,
    required this.course,
    required this.lable,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          onPrimary: Colors.white,
          primary: Colors.white,
        ),
        child: const Icon(
          Icons.edit,
       //   color: primaryColor,
        ),
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return Wrap(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(defaultPadding),
                    child: Text(
                      'update $lable',
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // SizedBox(height: defaultPadding * 12),
                  Container(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Padding(
                      padding: const EdgeInsets.all(defaultPadding),
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: const InputDecoration(
                              border:  UnderlineInputBorder(),
                            ),
                            initialValue: currentData,
                            
                            onChanged:onChanged,
                            onEditingComplete: () {
                              //when user clicks done/enter/go on the keyboard
                              //update data in database
                              Navigator.of(context).pop();
                            },
                          ),
                          const SizedBox(height: defaultPadding),
                          ElevatedButton(
                            child: const Text("save"),
                            style: ElevatedButton.styleFrom(
                              onPrimary: Colors.white,
                      //        primary: primaryColor,
                              shape: const StadiumBorder(),
                            ),
                            onPressed:onPressed
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        },
      );
}
