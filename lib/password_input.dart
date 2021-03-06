import 'package:flutter/material.dart';

class PasswordFormField extends StatefulWidget {
  final TextEditingController controller;

  const PasswordFormField({
    Key key,
    @required this.controller,
  })  : assert(controller != String),
        super(key: key);

  @override
  _PasswordFormFieldState createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        icon: Icon(Icons.lock),
        labelText: "Password",
        suffixIcon: GestureDetector(
          onTap: (){
            setState((){
              _showPassword = !_showPassword;
            });
          },
          child: Icon(
            _showPassword ? Icons.visibility : Icons.visibility_off,
          ),
          )  
      ),
      obscureText: !_showPassword,
      validator: (String value) {
        if (value.isEmpty){
          return "please enter your password";
        }
      },
    );
  }
}

