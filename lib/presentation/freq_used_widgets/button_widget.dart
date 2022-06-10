import 'package:testing_project/constants/colors.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;
  const ButtonWidget({
    Key? key,
    required this.text,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(), //button shaped like a stadium
          onPrimary: Colors.white,
          primary: primaryColor,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
        ),
        child: Text(
          text,
          style: const TextStyle(fontSize: 15),
        ),
        onPressed: onClicked,
      );
}
