import 'dart:async';

import 'package:flutter/material.dart';
import '../password_input.dart';

class SecondRoute extends StatefulWidget {

  @override
  _SecondRouteState createState() => _SecondRouteState();
}

class _SecondRouteState extends State<SecondRoute> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LoginPage'),
        automaticallyImplyLeading: false,
      ),
      // floatingActionButton: new FloatingActionButton(
      //   child: new Icon(Icons.fullscreen_exit),
      //   onPressed: (){
      //     Navigator.pushReplacementNamed(context, "/logout");
      //   },
      // ),
      body: Form(
              child: Card(
                elevation: 8.0,
                child: Padding(
          padding: const EdgeInsets.only(top: 60.0, left: 20.0, right: 20.0),
          child: Column(children: <Widget>[
            new Padding(
              padding: const EdgeInsets.only(top: 6.0),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'Email Address'
                )
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: PasswordFormField(
              ),
            ),
            SizedBox(height: 40.0),
            SizedBox(
              height: 60.0,
              width: double.infinity,
                      child: RaisedButton(
                child: Text('Login'),
                onPressed: (){
                },
                color: Colors.blueGrey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)
                ),
              ),
            ),
            ]),
        ),
      ),
      ),
    );
  }
}