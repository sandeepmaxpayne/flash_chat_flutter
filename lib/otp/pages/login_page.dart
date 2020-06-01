import 'package:flashchat/otp/store/login_store.dart';
import 'package:flashchat/otp/widgets/loader_hud.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../theme.dart';

class LoginPageOtp extends StatefulWidget {
  @override
  _LoginPageOtpState createState() => _LoginPageOtpState();
}

class _LoginPageOtpState extends State<LoginPageOtp> {
  TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<LoginStore>(
      builder: (_, loginStore, __) {
        return Observer(
          builder: (_) => LoaderHUD(
            inAsyncCall: loginStore.isLoginLoading,
            child: Scaffold(
              backgroundColor: Colors.white,
              key: loginStore.loginScaffoldKey,
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: Column(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 20),
                                child: Stack(
                                  children: <Widget>[
                                    Center(
                                      child: Container(
                                        height: 240,
                                        constraints:
                                            BoxConstraints(maxWidth: 500),
                                        margin: EdgeInsets.only(top: 100),
                                        decoration: BoxDecoration(
                                            color: Color(0xFFE1E0F5),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(30.0))),
                                      ),
                                    ),
                                    Center(
                                      child: Container(
                                        constraints:
                                            BoxConstraints(maxHeight: 340),
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Image.asset(
                                          'assets/img/login.png',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  'OTP Awesome',
                                  style: TextStyle(
                                      color: MyColors.primaryColor,
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: <Widget>[
                              Container(
                                constraints: BoxConstraints(maxWidth: 500),
                                margin: EdgeInsets.symmetric(horizontal: 10.0),
                                child: RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(children: <TextSpan>[
                                    TextSpan(
                                        text: 'One Time Password',
                                        style: TextStyle(
                                            color: MyColors.primaryColor)),
                                    TextSpan(
                                        text: 'On this mobile number',
                                        style: TextStyle(
                                            color: MyColors.primaryColor,
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(
                                        text: 'on this mobile number',
                                        style: TextStyle(
                                            color: MyColors.primaryColor)),
                                  ]),
                                ),
                              ),
                              Container(
                                height: 40,
                                constraints: BoxConstraints(maxWidth: 500),
                                margin: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: CupertinoTextField(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 16.0),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(4))),
                                  controller: phoneController,
                                  clearButtonMode:
                                      OverlayVisibilityMode.editing,
                                  keyboardType: TextInputType.phone,
                                  maxLines: 1,
                                  placeholder: '+91...',
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 10.0),
                                constraints: BoxConstraints(maxWidth: 500),
                                child: RaisedButton(
                                  onPressed: () {
                                    if (phoneController.text.isNotEmpty) {
                                      loginStore.getCodeWithPhoneNumber(context,
                                          phoneController.text.toString());
                                    } else {
                                      loginStore.loginScaffoldKey.currentState
                                          .showSnackBar(SnackBar(
                                        behavior: SnackBarBehavior.floating,
                                        backgroundColor: Colors.red,
                                        content: Text(
                                          'Please enter a phone number',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ));
                                    }
                                  },
                                  color: MyColors.primaryColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(14))),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 8),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          'Next',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(20)),
                                            color: MyColors.primaryColorLight,
                                          ),
                                          child: Icon(
                                            Icons.arrow_forward_ios,
                                            color: Colors.white,
                                            size: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
