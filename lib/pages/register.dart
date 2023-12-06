import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../const.dart';
import '../helper/showSnack_bar.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';

class Register extends StatefulWidget {
  Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
                  height: 40,
                ),
                Image.asset(
                  'assets/images/Texting-amico.png',
                  width: 300,
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Register',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
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
                  height: 35,
                ),
                Button(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      isLoading = true;
                      setState(() {});
                      try {
                        var auth = FirebaseAuth.instance;
                        if (email != null && password != null) {
                          await RegisterMethod(auth);
                          // showSnackBar(
                          //     context, 'Successfully Registered', Colors.green);
                          // Handle the user creation result
                        }
                        Navigator.pushNamed(context, 'ChatPage',
                            arguments: email);
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          showSnackBar(context,
                              'The password provided is too weak.', Colors.red);
                        } else if (e.code == 'email-already-in-use') {
                          showSnackBar(
                              context,
                              'The account already exists for that email.',
                              Colors.red);
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
                  text: 'Register',
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already u have an account? '),
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Log In',
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
      ))),
    );
  }

  Future<void> RegisterMethod(FirebaseAuth auth) async {
    UserCredential user = await auth.createUserWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }
}
