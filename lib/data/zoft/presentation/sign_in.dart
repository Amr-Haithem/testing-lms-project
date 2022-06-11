import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testing_project/constants/urls.dart';
import 'package:testing_project/data/local_db/lms_db.dart';

import '../../../constants/colors.dart';
import '../../../constants/measures.dart';
import '../../../presentation/freq_used_widgets/button_widget.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  //todo remove this
  final LmsDB _lmsDB = LmsDB();
  String userName = "", password = "";
  final _formKey = GlobalKey<FormState>();
  Widget _buildTextFields() {
    return Container(
      padding: const EdgeInsets.all(45),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              key: Key("testFieldOfUserName"),
              onChanged: (val) {
                userName = val;
              },
              decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: primaryColor, width: 1.5),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: mainBlack),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: mainBlack)),
                  hintText: "username"),
              autofocus: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your username';
                }
                return null;
              },
            ),
            const SizedBox(height: 30),
            TextFormField(
              key: Key('textFieldOfPassword'),
              onChanged: (val) {
                password = val;
              },
              decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: primaryColor, width: 1.5),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: mainBlack),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: mainBlack)),
                  hintText: "password"),
              autofocus: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter password';
                }
                return null;
              },
            ),
            //  const SizedBox(height: 30)
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Center(child: const Text("Eng ASU LMS")),
      //   backgroundColor: Colors.black,
      // ),

      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Wrap(
          direction: Axis.horizontal,
          alignment: WrapAlignment.center,
          runSpacing: defaultPadding,
          children: [
            // child: Wrap(
            //   direction: Axis.horizontal,
            //   spacing: 20,
            //   runSpacing: 0,

            // children: [
            //   SizedBox(height: defaultPadding),

            _buildTextFields(),

            ButtonWidget(
              key: Key("signInButton"),
              onClicked: () async {
                // _lmsDB.deleteDatabase("lms.db");
                if (_formKey.currentState!.validate()) {}
              },
              text: 'Sign in',
            ),
          ],
        ),
      ),
    );
  }
}
