import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testing_project/constants/colors.dart';
AppBar buildAppBar(BuildContext context, String text) {
  const icon = CupertinoIcons.moon_stars;

  return AppBar(
    leading: const BackButton(color: Colors.black),
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: Center(
      child: Text(
        "${text}",
        style: TextStyle(
          color: mainBlack,
        ),
      ),
    ),
    actions: [
      IconButton(
        color: mainBlack,
        icon: const Icon(Icons.menu),
        onPressed: () {
        },
      ),
    ],
  );
}