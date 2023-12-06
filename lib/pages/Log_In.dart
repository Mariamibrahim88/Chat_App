import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:scholar_chat_app/const.dart';

import '../const.dart';

import '../helper/showSnack_bar.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';

class LogIn extends StatefulWidget {
  LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  String? email;
  String? password;
  bool isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
          body: Center(
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Image.asset(
                    'assets/images/log_in.png',
                    width: 300,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    'Log In',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  text_field(
                    onChanged: (data) {
                      email = data;
                    },
                    hint_text: 'Email',
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  text_field(
                    obscureText: true,
                    onChanged: (data) {
                      password = data;
                    },
                    hint_text: 'Password',
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Button(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        isLoading = true;
                        setState(() {});
                        try {
                          var auth = FirebaseAuth.instance;
                          //if (email != null && password != null) {
                          await LogInMethod(auth);
                          // showSnackBar(
                          //     context, 'Successfully Log In', Colors.green);
                          // Handle the user creation result
                          //}
                          Navigator.pushNamed(context, 'ChatPage',
                              arguments: email);
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'user-not-found') {
                            showSnackBar(context,
                                'No user found for that email.', Colors.red);
                          } else if (e.code == 'wrong-password') {
                            showSnackBar(
                                context,
                                'Wrong password provided for that user.',
                                Colors.red);
                          } else {
                            showSnackBar(context,
                                'Check your email and password', Colors.red);
                          }
                        } catch (e) {
                          showSnackBar(
                              context, 'Something went wrong', Colors.red);
                        }
                        isLoading = false;
                        setState(() {});
                      } else {}
                      //print(user.user!.displayName);
                    },
                    text: 'Log In',
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('if u dont have an account!! , '),
                      GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, 'Register');
                          },
                          child: const Text(
                            'Register now',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ))
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }

  Future<void> LogInMethod(FirebaseAuth auth) async {
    UserCredential user = await auth.signInWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }
}
