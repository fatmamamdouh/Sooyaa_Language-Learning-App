import 'package:flutter/material.dart';
import 'package:sooyaa_pro/core/screens/Home/home.dart';
import 'package:sooyaa_pro/core/screens/Login%20Screens/code_screen.dart';
import 'package:sooyaa_pro/core/screens/Login%20Screens/create_new_pass.dart';
import 'package:sooyaa_pro/core/screens/Login%20Screens/login_screen.dart';
import 'package:sooyaa_pro/core/screens/Sign%20Up%20Screens/create_password.dart';
import 'package:sooyaa_pro/core/screens/Sign%20Up%20Screens/level_screen.dart';
import 'package:sooyaa_pro/core/screens/Sign%20Up%20Screens/loading_screen.dart';
import 'package:sooyaa_pro/core/screens/Sign%20Up%20Screens/name_screen.dart';
import 'package:sooyaa_pro/core/screens/Sign%20Up%20Screens/old_screen.dart';
import 'package:sooyaa_pro/core/screens/Sign%20Up%20Screens/select_language_screen.dart';
import 'package:sooyaa_pro/core/screens/Sign%20Up%20Screens/sign_up_with_email.dart';
import 'package:sooyaa_pro/core/screens/Sign%20Up%20Screens/success_screen.dart';
import 'package:sooyaa_pro/core/screens/Sign%20Up%20Screens/why_screen.dart';
import 'package:sooyaa_pro/core/screens/Sign%20Up%20Screens/zone_screen.dart';
import 'package:sooyaa_pro/core/screens/Welcome%20Screen/welcome_screen.dart';

Map<String, Widget Function(BuildContext)> routes = <String, WidgetBuilder>{
  "welcome": (context) => const WelcomeScreen(),
  "name": (context) => const NameScreen(),
  "signUpWithEmail": (context) => const SignUpWithEmail(),
  "login": (context) => const LoginScreen(),
  "createPassword": (context) => const CreatePassword(),
  "createNewPassword": (context) => const CreateNewPassword(),
  "success": (context) => const SuccessScreen(),
  "selectLunguage": (context) => SelectLanguageScreen(),
  "levels": (context) => LevelScreen(),
  "why": (context) => WhyScreen(),
  "zone": (context) => ZoneScreen(),
  "old": (context) => OldScreen(),
  "loading": (context) => const LoadingScreen(),
  "code": (context) => const CodeScreen(),
  "home": (context) => const Home(),
};