import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testing_project/data/local_db/lms_db.dart';
import '../BL/cubit/authentication_cubit/authentication_cubit.dart';
import 'freq_used_widgets/funky_overlay.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  LmsDB lmsInstance = LmsDB();
  dynamic db;

  late String email = "", password = "";

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
                email = val;
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
                  hintText: "Email"),
              autofocus: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your Email';
                }
                return null;
              },
            ),
            const SizedBox(height: 30),
            TextFormField(
              onChanged: (val) {
                password = val;
              },
              decoration: InputDecoration(
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

  Widget _showPopUpMessageIfTheresError(AuthenticationState state) {
    if (state is AuthenticationLoadingError) {
      Future.delayed(const Duration(milliseconds: 0), () {
        showDialog(
          context: context,
          builder: (_) => FunkyOverlay(
            message: (state).message,
          ),
        );
      });

      return const SizedBox();
    } else {
      return const SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationCubit, AuthenticationState>(
      builder: (context, state) {
        if (state is AuthenticationLoaded ||
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
                        await lmsInstance.deleteDatabase('lms.db');
                        db = await lmsInstance.database;
                        lmsInstance.testFunction(db);
                        //the following make sure that the user typed any thing in the fields
                        if (_formKey.currentState!.validate()) {}
                      },
                      child: const Text(
                        'sign in',
                        style: TextStyle(color: Colors.white),
                      )),
                  _showPopUpMessageIfTheresError(state)
                ],
              ));
        } else {
          return const Scaffold(
              body: Center(child: CircularProgressIndicator()));
        }
      },
    );
  }
}
