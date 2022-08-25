import 'package:flutter/material.dart';

class RoundedPasswordField extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final TextEditingController controller;
  final String hintText;
  final IconData icon;
  final FormFieldValidator<String> validator;

  const RoundedPasswordField({
    Key? key,
    required this.onChanged,
    required this.controller,
    required this.hintText,
    required this.icon,
    required this.validator,
  }) : super(key: key);

  @override
  State<RoundedPasswordField> createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  bool _obscureText = false;

  @override
  void initState() {
    // TODO: implement initState
    _obscureText = false;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // bool _obscureText = true;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
      width: size.width * 0.9,
      child: TextFormField(
        controller: widget.controller,
        validator: widget.validator,
        obscureText: !_obscureText,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          hintText: widget.hintText,
          labelText: widget.hintText,
          labelStyle: TextStyle(color: Colors.red),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
          icon: Icon(
            widget.icon,
            color: Colors.red,
          ),
          suffixIcon: IconButton(
            icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off,
                color: Colors.red),
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
          ),
          // border: InputBorder.none,
        ),
      ),
    );
  }
}
