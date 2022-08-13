import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:startyo/providers/auth.providers.dart';
import 'package:startyo/src/screens/dashboard.screen.dart';
import 'package:startyo/src/widgets/UI/bigButton.ui.dart';
import 'package:startyo/src/widgets/UI/body1.ui.dart';
import 'package:startyo/src/widgets/UI/header1.ui.dart';
import 'package:sizer/sizer.dart';
import 'package:startyo/src/widgets/UI/inputfield.ui.dart';
import 'package:startyo/theme/colors.theme.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _signInFormKey = GlobalKey();
  String? _email;
  String? _password;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> submitSignIn() async {
    final isValid = _signInFormKey.currentState?.validate() ?? false;
    if (!isValid) {
      print("not valid");
    }
    _signInFormKey.currentState?.save();
    _email = _emailController.text;
    _password = _passwordController.text;
    await Provider.of<AuthProvider>(context, listen: false)
        .loginAsStartUp(_email!, _password!);
    Navigator.of(context).pushReplacement(
      MaterialPageRoute<void>(
        builder: (BuildContext context) => const DashBoard(),
      ),
    );
    // print(_email);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Flexible(child: SizedBox()),
            const HeaderText(text: "Login"),
            Container(
              height: 25.h,
              width: 25.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.sp),
                image: const DecorationImage(
                  image: AssetImage("assets/StartYoLogo.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              children: [
                Form(
                  key: _signInFormKey,
                  child: Column(
                    children: [
                      InputField(
                        controller: _emailController,
                        label: "E-Mail",
                      ),
                      InputField(
                        controller: _passwordController,
                        label: "Password",
                        isPassword: true,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                BigButton(
                  text: "Login",
                  buttonFunc: submitSignIn,
                ),
                const SizedBox(height: 10),
                BigButton(
                  text: "Sign Up",
                  buttonFunc: () {
                    Provider.of<AuthProvider>(context, listen: false)
                        .switchToSignUp();
                  },
                  isOutlined: true,
                ),
                const SizedBox(height: 30),
                Wrap(
                  children: const [
                    Body1(
                      text: "Forgot Password?",
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Body1(
                      text: "Reset Here",
                      color: Palette.primary,
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
