import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:startyo/src/screens/aboutIdea.screen.dart';
import 'package:startyo/src/widgets/UI/bigButton.ui.dart';
import 'package:startyo/src/widgets/UI/body1.ui.dart';
import 'package:startyo/src/widgets/UI/header1.ui.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 6.h,
            ),
            Container(
              height: 39.h,
              width: 75.w,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/OnBoarding.png"),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Column(
              children: [
                const HeaderText(text: "Let's get started"),
                SizedBox(
                  height: 6.h,
                ),
                SizedBox(
                  width: 68.w,
                  child: const Body1(
                    text:
                        "We require a little information about you and your start-up for us to serve you better. Do not skip the steps as they are crucial for us to cater to your needs, Let's go!!!",
                  ),
                ),
              ],
            ),
            BigButton(
              buttonFunc: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => AboutIdeaScreen(),
                  ),
                );
              },
              text: "Get started now",
            )
          ],
        ),
      ),
    );
  }
}
