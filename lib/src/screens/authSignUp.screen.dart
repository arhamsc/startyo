import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:startyo/data/loginState.enum.dart';
import 'package:startyo/data/role.enum.dart';
import 'package:startyo/providers/auth.providers.dart';
import 'package:startyo/src/widgets/UI/bigButton.ui.dart';
import 'package:startyo/src/widgets/UI/body1.ui.dart';
import 'package:startyo/src/widgets/UI/header1.ui.dart';
import 'package:sizer/sizer.dart';
import 'package:startyo/src/widgets/UI/inputfield.ui.dart';
import 'package:startyo/theme/colors.theme.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _signInFormKey = GlobalKey();
  String? _fullName;
  String? _email;
  String? _phone;
  String? _password;
  String? _confirmPassword;
  Role? _role;

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  List<DropdownMenuItem<Role>> signUpAs = const [
    DropdownMenuItem(
      value: Role.mentor,
      child: Text("Mentor"),
    ),
    DropdownMenuItem(
      value: Role.startUp,
      child: Text("Start Up"),
    ),
  ];

  Future<void> submitSignUp() async {
    final isValid = _signInFormKey.currentState?.validate() ?? false;

    _fullName = _fullNameController.text.trim();
    _email = _emailController.text.trim();
    _phone = _phoneController.text.trim();
    _password = _passwordController.text.trim();
    _confirmPassword = _confirmPasswordController.text.trim();

    if (_password != _confirmPassword) {
      _signInFormKey.currentState?.reset();
      return;
    }

    if (!isValid) {
      print("not valid");
      return;
    }

    _signInFormKey.currentState?.save();
    _email = _emailController.text;
    print(_email);
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _confirmPasswordController.dispose();
    _phoneController.dispose();
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
            const HeaderText(text: "Sign Up"),
            Column(
              children: [
                Form(
                  key: _signInFormKey,
                  child: Column(
                    children: [
                      InputField(
                        controller: _fullNameController,
                        label: "Full Name",
                      ),
                      InputField(
                        controller: _emailController,
                        label: "E-Mail",
                      ),
                      InputField(
                        controller: _phoneController,
                        label: "Phone (+91)",
                      ),
                      InputField(
                        controller: _passwordController,
                        label: "Password",
                        isPassword: true,
                      ),
                      InputField(
                        controller: _confirmPasswordController,
                        label: "Confirm Password",
                        isPassword: true,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Body1(text: "Signing up as?"),
                          ),
                          const SizedBox(height: 5),
                          DropdownButtonFormField(
                            value: Role.mentor,
                            decoration: InputDecoration(
                              alignLabelWithHint: true,
                              filled: true,
                              fillColor: Palette.primary.shade200,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(24.sp),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            validator: (value) {
                              if (value == null) {
                                return "Please select a role";
                              }
                            },
                            items: signUpAs,
                            onChanged: (value) => {
                              if (value != null)
                                {
                                  _role = Role.values.firstWhere(
                                    (element) =>
                                        element.toString() == value.toString(),
                                  ),
                                }
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                BigButton(
                  text: "Sign Up",
                  buttonFunc: submitSignUp,
                ),
                const SizedBox(height: 10),
                InkWell(
                  onTap: () => Provider.of<AuthProvider>(context, listen: false)
                      .setAuthLoginState(AuthLoginState.login),
                  child: const Body1(
                    text: "Already have an account? ",
                    color: Palette.primary,
                  ),
                )
                // const SizedBox(height: 30),
              ],
            )
          ],
        ),
      ),
    );
  }
}
