import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'login_page.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final formKey = GlobalKey<FormState>();
  bool rememberMe = false;
  bool visiblePassword = false;
  bool isLoading = false;

  
  @override
  Widget build(BuildContext context) {

    InputDecoration buildInputDecoration(hintText, [eyeVisible = false]){
  var outLineBorder = OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey.withOpacity(0.2)),
  );

  return InputDecoration(
    suffixIcon: eyeVisible
        ? IconButton(
          icon: Icon(
            Icons.remove_red_eye,
            color: !visiblePassword ? Colors.grey : Colors.red
          ),
          onPressed: (){
            setState((){
              visiblePassword = !visiblePassword;
            });
          },
          )
        : SizedBox.shrink(),
    hintText: hintText,
    contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
    border: outLineBorder,
    enabledBorder: outLineBorder,
    focusedBorder: outLineBorder,
  );
}

    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: <Widget>[
            Container(
              color: Color(0xfffcfcfb),
              height: 60.0,
              alignment: Alignment.center,
              child: RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: "Already have an account? ",
                      style: TextStyle(color: Colors.black),
                    ),
                    TextSpan(
                      text: "Log in",
                      style: TextStyle(fontWeight: FontWeight.bold,
                      color: Colors.blue,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SecondRoute()));
                        }
                    )
                  ],
                  style: TextStyle(fontSize: 12.0)
                ),
              ),
            ),
            Divider(height: 1.0),
            Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 26),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Sign Up",
                        style: Theme.of(context).textTheme.headline4),
                        SizedBox(height: 25.0),
                        TextFormField(
                          decoration: buildInputDecoration("Full name"),
                          validator: InputValidator.emptyCheck("Full name can't be empty"),
                        ),
                        SizedBox(height: 15.0),
                        TextFormField(
                          decoration: buildInputDecoration("Email"),
                          validator: InputValidator.email,
                        ),
                        SizedBox(height: 8.0),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: TextFormField(
                            obscureText: visiblePassword,
                            decoration: buildInputDecoration("password", true),
                            validator: InputValidator.password,
                            onChanged: (t){
                              InputValidator.passwordText = t;
                            },
                          ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: TextFormField(
                              obscureText: visiblePassword,
                              onChanged: (t){
                                InputValidator.confirmPasswordText = t;
                              },
                              decoration: buildInputDecoration("Re-enter password", true),
                              validator: InputValidator.password,
                            )
                          )
                      ],
                      ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 26.0),
                    child: CheckboxListTile(
                      onChanged: (a){
                        setState((){
                          rememberMe = !rememberMe;
                        });
                      },
                      value: rememberMe,
                      controlAffinity: ListTileControlAffinity.leading,
                      title: Text("Receive our weekly news letter and other occasional updates",
                      style: TextStyle(
                        fontSize: 12.0,
                      ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15.0,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 26.0),
                    child: MaterialButton(
                      height: 40.0,
                      minWidth: MediaQuery.of(context).size.width,
                      color: Colors.purple,
                      onPressed: (){
                        register();
                      },
                      child: isLoading
                          ? Container(
                            child: CircularProgressIndicator(
                              strokeWidth: 2.0,
                            ),
                            width: 20.0,
                            height: 20.0)
                          : Text("Create account",
                          style: TextStyle(color: Colors.white)
                          )
                          )
                    )]
                  ))
                ]
              ),
            )
          )
        );
  
}



  @override
  Future register() async {
    if (formKey.currentState.validate()){
      formKey.currentState.save();
      setState((){
        isLoading = true;
      });
      if (rememberMe){
        print("saved");
      }
      await Future.delayed(Duration(seconds: 1));
      setState((){
        isLoading = false;
      });
    }
    return null;
  }
  }

abstract class RegisterAuth {
  Future register();
}


class InputValidator{
  static String confirmPasswordText;
  static String passwordText;
  static String emailText;
  static String name;

  static emptyCheck(String msg){
    return (t){
      if (t.isEmpty || t == null) return msg;
      return null;
    };
  }

  static String email(String t){
    if (t.isEmpty || t == null) return "Email can't be empty";
    return null;
  }

  static String password(String t){
    if (t.isEmpty) return "Password can't be empty";
    if (confirmPasswordText != passwordText) return "Password not matched";
    return null;
  }
}

