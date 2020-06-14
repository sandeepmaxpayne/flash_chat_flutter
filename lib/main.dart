import 'package:firebase_auth/firebase_auth.dart';
import 'package:flashchat/dialog.dart';
import 'package:flashchat/otp/pages/splash_page.dart';
import 'package:flashchat/otp/store/login_store.dart';
import 'package:flashchat/screens/chat_screen.dart';
import 'package:flashchat/screens/dashboard.dart';
import 'package:flashchat/screens/login_screen.dart';
import 'package:flashchat/screens/registration_screen.dart';
import 'package:flashchat/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'intro_onboarding/onboarding_screen.dart';
import 'otp/pages/splash_page.dart';
import 'package:provider/provider.dart';

int initScreen;
final FirebaseAuth _auth = FirebaseAuth.instance;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  initScreen = prefs.getInt('initScreen');
  await prefs.setInt('initScreen', 1);
  print("initScreen: $initScreen");
  runApp(FlashChat());
}

class FlashChat extends StatelessWidget {
  // Method , if user logged in or not
  Future<FirebaseUser> getUser() async {
    return await _auth.currentUser();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<LoginStore>(
          create: (_) => LoginStore(),
        ),
      ],
      child: MaterialApp(
//        initialRoute: DialogChat.id,
        initialRoute: initScreen == 0 || initScreen == null
            ? IntroScreen.id
            : WelcomeScreen.id,
        routes: {
          DialogChat.id: (context) => DialogChat(),
          IntroScreen.id: (context) => IntroScreen(),
          SplashPage.id: (context) => SplashPage(),
          WelcomeScreen.id: (context) => WelcomeScreen(),
          LoginScreen.id: (context) => LoginScreen(),
          RegistrationScreen.id: (context) => RegistrationScreen(),
          ChatScreen.id: (context) => ChatScreen(),
          DashBoard.id: (context) => DashBoard(),
        },
      ),
    );
  }
}
