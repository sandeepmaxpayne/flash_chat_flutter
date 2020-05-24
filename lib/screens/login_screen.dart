import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flashchat/components/rounded_button.dart';
import 'package:flashchat/constants.dart';
import 'package:flashchat/screens/chat_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static const id = "login_screen";
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String loginEmail;
  String loginPassword;
  final _auth = FirebaseAuth.instance;
  bool progress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: progress,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  loginEmail = value;
                },
                decoration:
                    kInputTextDecoration.copyWith(hintText: 'Enter your email'),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                obscureText: true,
                onChanged: (value) {
                  loginPassword = value;
                },
                decoration: kInputTextDecoration.copyWith(
                    hintText: 'enter your password'),
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                title: 'Log In',
                color: Colors.blueAccent,
                onPress: () async {
                  setState(() {
                    progress = true;
                  });
                  try {
                    final logUser = await _auth.signInWithEmailAndPassword(
                        email: loginEmail, password: loginPassword);

                    if (logUser != null) {
                      setState(() {
                        progress = false;
                      });
                      Navigator.pushNamed(context, ChatScreen.id);
                    }
                  } catch (e) {
                    setState(() {
                      progress = false;
                    });
                    print('Login error: $e');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
