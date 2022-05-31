import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testing_project/constants/urls.dart';
import 'package:testing_project/data/local_db/lms_db.dart';
import 'package:testing_project/data/local_db/professor_sink.dart';
import '../BL/cubit/authentication_cubit/authentication_cubit.dart';
import 'freq_used_widgets/funky_overlay.dart';

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
              onChanged: (val) {
                userName = val;
              },
              decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1.5),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  hintText: "userName"),
              autofocus: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your userName';
                }
                return null;
              },
            ),
            const SizedBox(height: 30),
            TextFormField(
              onChanged: (val) {
                password = val;
              },
              decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black54, width: 1.5),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black54),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black54)),
                  hintText: "password"),
              autofocus: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter password';
                }
                return null;
              },
            ),
            const SizedBox(height: 30)
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        if (state is AuthenticationLoaded) {
          if (state.student) {
            Navigator.pushReplacementNamed(context, studentDashBoard,
                arguments: state.studentOrProfessor);
          } else {
            Navigator.pushReplacementNamed(context, professorDashBoard,
                arguments: state.studentOrProfessor);
          }
        } else if (state is AuthenticationLoadingError) {
          showDialog(
            context: context,
            builder: (_) => FunkyOverlay(
              message: (state).message,
            ),
          );
        }
      },
      child: BlocBuilder<AuthenticationCubit, AuthenticationState>(
        builder: (context, state) {
          if (state is AuthenticationInitial ||
              state is AuthenticationLoadingError) {
            return Scaffold(
                appBar: AppBar(
                  title: const Text("Sign in"),
                  backgroundColor: Colors.black,
                ),
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildTextFields(),
                    ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.black),
                        ),
                        onPressed: () async {
                          _lmsDB.deleteDatabase("lms.db");
                          if (_formKey.currentState!.validate()) {
                            BlocProvider.of<AuthenticationCubit>(context)
                                .authenticateUser(userName, password);
                          }
                        },
                        child: const Text(
                          'sign in',
                          style: TextStyle(color: Colors.white),
                        )),
                  ],
                ));
          } else {
            return const Scaffold(
                body: Center(child: CircularProgressIndicator()));
          }
        },
      ),
    );
  }
}
