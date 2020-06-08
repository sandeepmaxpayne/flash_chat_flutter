import 'package:fancy_on_boarding/fancy_on_boarding.dart';
import 'package:flashchat/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

class IntroScreen extends StatefulWidget {
  static const id = "intro";
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FancyOnBoarding(
        skipButtonText: 'skip',
        doneButtonText: 'done',
        pageList: [
          PageModel(
            color: Color(0xFFFFB7B7),
            heroAssetPath: 'images/svg/new_app.svg',
            title: Text(
              'Intro to the Chat',
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                  fontSize: 34.0),
            ),
            body: Text(
              'Proceed to the next page for getting started',
              style: TextStyle(color: Colors.white, fontSize: 18.0),
              textAlign: TextAlign.center,
            ),
            iconAssetPath: 'images/png/smile.png',
          ),
          PageModel(
            color: Color(0xFF720D5D),
            heroAssetPath: 'images/png/group_chat.png',
            title: Text(
              'Have a Group Chat',
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                  fontSize: 34.0),
            ),
            body: Text(
              'Experience the group chat feature publicly from world wide',
              style: TextStyle(color: Colors.white, fontSize: 18.0),
              textAlign: TextAlign.center,
            ),
            iconAssetPath: 'images/png/group_icon.png',
          ),
          PageModel(
            color: Color(0xFF7540EE),
            heroAssetPath: 'images/png/chat.png',
            title: Text(
              'Personal Chat',
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                  fontSize: 34.0),
            ),
            body: Text(
              'Engage with people personally and in a private way',
              style: TextStyle(color: Colors.white, fontSize: 18.0),
              textAlign: TextAlign.center,
            ),
            iconAssetPath: 'images/png/chat_icon.png',
          ),
          PageModel(
              color: Color(0xFFFAA736),
              heroAssetPath: 'images/png/feedback.png',
              title: Text(
                'Give Feedback',
                style: TextStyle(
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                    fontSize: 34.0),
              ),
              body: Text(
                'Your regular feedback will help us to improve the chat experience',
                style: TextStyle(color: Colors.white, fontSize: 18.0),
                textAlign: TextAlign.center,
              ),
              iconAssetPath: 'images/png/feedback_icon.png'),
        ],
        onDoneButtonPressed: () {
          Navigator.of(context).pushReplacementNamed(WelcomeScreen.id);
        },
        onSkipButtonPressed: () {
          Navigator.of(context).pushReplacementNamed(WelcomeScreen.id);
        },
      ),
    );
  }
}
