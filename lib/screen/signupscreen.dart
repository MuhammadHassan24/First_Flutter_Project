import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailcontrollor = TextEditingController();
    TextEditingController passwordcontrollor = TextEditingController();

    registerUser() async {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailcontrollor.text,
          password: passwordcontrollor.text,
          
        );
        emailcontrollor.clear();
        passwordcontrollor.clear();
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
        }
      } catch (e) {
        print(e);
      }
    }

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: emailcontrollor,
            ),
            TextField(
              controller: passwordcontrollor,
            ),
            ElevatedButton(
                onPressed: () {
                  registerUser();
                },
                child: Text("Sign up"))
          ],
        ),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
