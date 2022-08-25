import 'package:flutter/material.dart';
import 'package:order/components/rounded_button.dart';
import 'package:order/components/rounded_input.dart';
import 'package:order/components/rounded_password_field.dart';
import 'package:order/home/components/home_screen.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({Key? key}) : super(key: key);

  @override
  State<LoginBody> createState() => _BodyState();
}

class _BodyState extends State<LoginBody> {
  final formGlobalKey = GlobalKey<FormState>();
  bool visible = false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future userLogin() async {
    setState(() {
      visible = true;
    });
    String userEmail = emailController.text;
    String userPwd = passwordController.text;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height,
      child: SingleChildScrollView(
        child: Form(
          key: formGlobalKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                "assets/images/logo.png",
                height: size.height * 0.2,
              ),
              // SizedBox(height: size.height * 0.05),
              Text(
                "Sign In",
                style: TextStyle(
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w800,
                    fontSize: 30.0),
              ),
              SizedBox(height: size.height * 0.03),
              RoundedInputField(
                validator: validateEmail,
                hintText: "Email",
                icon: Icons.email_outlined,
                onChanged: (value) {},
                controller: emailController,
                enableMode: true,
              ),
              RoundedPasswordField(
                validator: validatePwd,
                controller: passwordController,
                onChanged: (value) {},
                icon: Icons.lock,
                hintText: "Password",
              ),
              Container(
                child: Align(
                  alignment: Alignment(0.70, -0.80),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return HomeScreen();
                          },
                        ),
                      );
                    },
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w800,
                        fontSize: 15.0,
                        decoration: TextDecoration.underline,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.05),
              RoundedButton(
                text: "Sign In",
                //press: validateEmail(emailController.text.trim()).isEmpty && validatePwd(passwordController.text.trim()).isEmpty? userLogin: () {}
                press: () async {
                  if (formGlobalKey.currentState!.validate()) {
                    formGlobalKey.currentState!.save();
                    await userLogin();
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  String? validateEmail(String? value) {
    String _msg = '';
    RegExp regex = new RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    if (value!.isEmpty) {
      _msg = "Your email is required";
      return _msg;
    } else if (!regex.hasMatch(value)) {
      _msg = "Please provide a valid email address";
      return _msg;
    }
    return null;
  }

  String? validatePwd(String? value) {
    String _msg = '';
    if (value!.isEmpty) {
      _msg = "Your password is required";
      return _msg;
    }
    return null;
  }
}
