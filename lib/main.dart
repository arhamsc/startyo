import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:startyo/data/loginState.enum.dart';
import 'package:startyo/firebase_options.dart';
import 'package:startyo/providers/auth.providers.dart';
import 'package:startyo/src/screens/authLogin.screen.dart';
import 'package:startyo/src/screens/authSignUp.screen.dart';
import 'package:startyo/src/screens/dashboard.screen.dart';
import 'package:startyo/src/screens/getStarted.screen.dart';
import 'package:startyo/theme/button.theme.dart';
import 'package:startyo/theme/colors.theme.dart';
import 'package:startyo/theme/text.theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: Consumer<AuthProvider>(
        builder: (context, auth, _) => Sizer(
          builder: (context, orientation, deviceType) => MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Palette.primary,
              appBarTheme: AppBarThemes.appBarTheme(),
              scaffoldBackgroundColor: Palette.tertiary,
              textTheme: TextThemes.typography,
              elevatedButtonTheme: ButtonThemes.elevatedButton,
              textButtonTheme: ButtonThemes.textButton,
              bottomAppBarTheme: AppBarThemes.bottomNav(),
              outlinedButtonTheme: ButtonThemes.outlinedButton,
            ),
            home: Scaffold(
              body: HomePage(
                auth: auth,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.auth}) : super(key: key);
  final AuthProvider auth;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    switch (widget.auth.authLoginState) {
      case AuthLoginState.login:
        return const LoginScreen();
      case AuthLoginState.signUp:
        return const SignUpScreen();
      case AuthLoginState.signingUp:
        return const GetStartedScreen();
      case AuthLoginState.loggedIn:
        return const DashBoard();
      default:
        return const Center(
          child: Text("Child"),
        );
    }
  }
}
