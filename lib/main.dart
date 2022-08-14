import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
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

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  print("Handling a background message: ${message.messageId}");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FlutterNativeSplash.remove();
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Got a message whilst in the foreground!');
    print('Message data: ${message.data}');

    if (message.notification != null) {
      print('Message also contained a notification: ${message.notification}');
    }
  });
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  print('User granted permission: ${settings.authorizationStatus}');
  FirebaseMessaging.instance.subscribeToTopic('chat');
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
            debugShowCheckedModeBanner: false,
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
