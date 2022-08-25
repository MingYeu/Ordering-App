import 'package:flutter/material.dart';
import 'package:order/home/components/loginBody.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text(
        //   "Sign In",
        //   style: TextStyle(
        //       fontFamily: 'Lato', fontWeight: FontWeight.w800, fontSize: 22.0),
        // ),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        bottomOpacity: 0.0,
        elevation: 0.0,
      ),
      body: LoginBody(),
    );
  }
}
