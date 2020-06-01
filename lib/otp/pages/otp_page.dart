import 'package:flashchat/otp/store/login_store.dart';
import 'package:flashchat/otp/widgets/loader_hud.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';
import 'package:provider/provider.dart';
import '../../theme.dart';

class OtpPage extends StatefulWidget {
  @override
  _OtpPageState createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  String text = "";

  void _onKeyboardTap(String value) {
    setState(() {
      text += value;
    });
  }

  Widget otpNumberWidget(int position) {
    try {
      return Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black54, width: 0.1),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: Center(
            child: Text(
          text[position],
          style: TextStyle(color: Colors.black54),
        )),
      );
    } catch (e) {
      return Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black54, width: 0.1),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginStore>(
      builder: (_, loginStore, __) {
        return Observer(
          builder: (_) => LoaderHUD(
            inAsyncCall: loginStore.isOtpLoading,
            child: Scaffold(
              backgroundColor: Colors.white,
              key: loginStore.otpScaffoldKey,
              appBar: AppBar(
                leading: IconButton(
                  icon: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: MyColors.primaryColorLight.withAlpha(20),
                    ),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: MyColors.primaryColor,
                      size: 16,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                elevation: 0,
                backgroundColor: Colors.white,
                brightness: Brightness.light,
              ),
              body: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Container(
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 20.0),
                                  child: Text(
                                    'Enter 6 digit verification code sent to your mobile number',
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 26),
                                  ),
                                ),
                                Container(
                                  constraints: BoxConstraints(
                                    maxWidth: 500,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      otpNumberWidget(0),
                                      otpNumberWidget(1),
                                      otpNumberWidget(2),
                                      otpNumberWidget(3),
                                      otpNumberWidget(4),
                                      otpNumberWidget(5),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 10.0),
                            constraints: BoxConstraints(
                              maxWidth: 500,
                            ),
                            child: RaisedButton(
                              onPressed: () {
                                loginStore.validateOtpAndLogin(context, text);
                              },
                              color: MyColors.primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(14.0)),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    'Confirm',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8)),
                                      color: MyColors.primaryColorLight,
                                    ),
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.white,
                                      size: 16,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          NumericKeyboard(
                            onKeyboardTap: _onKeyboardTap,
                            textColor: MyColors.primaryColorLight,
                            rightIcon: Icon(
                              Icons.backspace,
                              color: MyColors.primaryColorLight,
                            ),
                            rightButtonFn: () {
                              setState(() {
                                text = text.substring(0, text.length - 1);
                              });
                            },
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
