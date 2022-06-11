import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testing_project/data/zoft/presentation/sign_in.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testing_project/BL/cubit/authentication_cubit/authentication_cubit.dart';

void main() {
  Widget testWidget = MaterialApp(home: SignInScreen());
  testWidgets("test sign in textfields and sign in button ",
      (WidgetTester widgetTester) async {
    //find all widgets needed

    final textFieldOfUserName =
        find.byKey(const ValueKey('testFieldOfUserName'));
    final textFieldOfPassword =
        find.byKey(const ValueKey('textFieldOfPassword'));
    final signInButton = find.byKey(const ValueKey('signInButton'));
    //execute actual text

    await widgetTester.pumpWidget(testWidget);
    await widgetTester.enterText(
        textFieldOfUserName, 'Amr is the best developer');
    await widgetTester.enterText(textFieldOfPassword, '123');
    //await widgetTester.tap(signInButton);
    await widgetTester.pump();

    //check outputs
    
    expect(find.text('Amr is the best developer'), findsOneWidget);
    expect(find.text('123'), findsOneWidget);
  });
}
