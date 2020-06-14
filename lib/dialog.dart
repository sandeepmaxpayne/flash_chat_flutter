import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dialogflow/flutter_dialogflow.dart';

class DialogChat extends StatefulWidget {
  static const id = 'dialogChat';
  @override
  _DialogChatState createState() => _DialogChatState();
}

class _DialogChatState extends State<DialogChat> {
  final messageInsert = TextEditingController();
  List<Map> messages = List();

  void response(String query) async {
    Dialogflow dialogflow =
        Dialogflow(token: 'b3604cc823e24ab5a992701b9ecf2cf9 ');
    AIResponse aiResponse = await dialogflow.sendQuery(query);
    print(aiResponse.getMessageResponse());
    setState(() {
      messages
          .insert(0, {'data': 0, 'messages': aiResponse.getMessageResponse()});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AppTutor'),
        backgroundColor: Colors.deepOrange,
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Flexible(
                child: ListView.builder(
                    reverse: true,
                    itemCount: messages.length,
                    itemBuilder: (context, index) =>
                        messages[index]['data'] == 0
                            ? Text(messages[index]['messages'].toString())
                            : Text(
                                messages[index]['messages'].toString(),
                                textAlign: TextAlign.right,
                              ))),
            Divider(
              height: 3.0,
            ),
            Container(
              padding: EdgeInsets.only(bottom: 20.0),
              margin: EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: <Widget>[
                  Flexible(
                    child: TextField(
                      controller: messageInsert,
                      decoration:
                          InputDecoration(hintText: 'Send your message'),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 4.0),
                    child: IconButton(
                      icon: Icon(Icons.send),
                      onPressed: () {
                        if (messageInsert.text.isNotEmpty) {
                          setState(() {
                            messages.insert(
                                0, {'data': 1, 'messages': messageInsert.text});
                          });
                          response(messageInsert.text);
                          messageInsert.clear();
                        }
                      },
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
