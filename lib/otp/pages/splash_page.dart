import 'package:flashchat/otp/store/login_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../theme.dart';
import 'home_page.dart';
import 'login_page.dart';

class SplashPage extends StatefulWidget {
  static const id = "splash_page";
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<LoginStore>(context, listen: false)
        .isAlreaduAuthenticated()
        .then((result) {
      if (result) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (_) => HomePage()),
            (Route<dynamic> route) => false);
      } else {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (_) => LoginPageOtp()),
            (Route<dynamic> route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primaryColor,
    );
  }
}
