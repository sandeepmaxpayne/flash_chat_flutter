import 'package:flashchat/screens/chat_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashBoard extends StatelessWidget {
  static const id = 'DashBoard';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text('Dashboard'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            UserBoard(),
            Text('User Board TODO'),
            RaisedButton.icon(
              icon: Icon(Icons.chat),
              label: Text('chat'),
              elevation: 4.0,
              onPressed: () {
                Navigator.pushNamed(context, ChatScreen.id);
              },
            )
          ],
        ),
      ),
    );
  }
}

class UserBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
