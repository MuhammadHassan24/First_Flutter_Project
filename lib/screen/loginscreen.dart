import 'package:flutter/material.dart';
import 'package:practies_app/screen/signupscreen.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextField(),
          TextField(),
          ElevatedButton(onPressed: () {}, child: Text("Login")),
          TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignUpView()));
              },
              child: Text("Sign up! To Register Your Account"))
        ],
      ),
    );
  }
}
