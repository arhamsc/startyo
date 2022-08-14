import 'package:flutter/material.dart';
import 'package:startyo/src/screens/chat.screen.dart';
import 'package:startyo/src/widgets/UI/body1.ui.dart';
import 'package:startyo/src/widgets/UI/header1.ui.dart';
import 'package:startyo/theme/colors.theme.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: const EdgeInsets.only(left: 10),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Icon(
                Icons.menu,
                size: 32,
              ),
            ),
            const HeaderText(text: "Dashboard"),
            const SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: const [
                  DashboardCards(
                    title: "Mentoring",
                    description:
                        "A Mentor will guide you in your journey of the Start-Up. Get access to world class mentors who have mentored many other start-ups.",
                    assetImage: "assets/images/Mentoring.png",
                  ),
                  DashboardCards(
                    title: "Investors",
                    description:
                        "Get the necessary finances to run your start-up, pitch to the wide catalogue of Investors with great portfolio to make your dream reality.",
                    assetImage: "assets/images/Investors.png",
                  ),
                  DashboardCards(
                    title: "Outsourcing",
                    description:
                        "Need a helping hand or would want to have a buddy? Do not fret we have got you covered. Hire professionals who are excellent at their domains.",
                    assetImage: "assets/images/OutSource.png",
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: HeaderText(
                text: "Avail Immediate Services",
                header2: true,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ServiceCard(
                    title: "Chat with our available mentors?",
                    buttonText: "Chat now",
                    buttonFunc: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ChatScreen(),
                        ),
                      );
                    },
                  ),
                  ServiceCard(
                    title: "Make a Pitch Deck",
                    buttonText: "Coming Soon...",
                    buttonFunc: () {},
                  ),
                  ServiceCard(
                    title: "Hire support.",
                    buttonText: "Coming Soon...",
                    buttonFunc: () {},
                  )
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.leaderboard), label: "Ananlytics"),
        ],
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  const ServiceCard({
    Key? key,
    required this.title,
    required this.buttonText,
    required this.buttonFunc,
  }) : super(key: key);
  final String title;
  final String buttonText;
  final Function buttonFunc;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        width: 290,
        height: 150,
        child: Column(
          children: [
            Wrap(
              children: [
                HeaderText(
                  text: title,
                  header2: true,
                  size: 20,
                ),
              ],
            ),
            TextButton(
              child: Text(
                buttonText,
                textAlign: TextAlign.center,
              ),
              onPressed: () => buttonFunc(),
            ),
          ],
        ),
      ),
    );
  }
}

class DashboardCards extends StatelessWidget {
  const DashboardCards({
    Key? key,
    required this.assetImage,
    required this.title,
    required this.description,
  }) : super(key: key);
  final String assetImage;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      child: Container(
        padding: const EdgeInsets.only(top: 20, bottom: 20),
        height: 400,
        width: 290,
        child: Column(
          children: [
            Container(
              width: 230,
              height: 170,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(assetImage), fit: BoxFit.cover),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 230,
              child: Column(
                children: [
                  HeaderText(
                    text: title,
                    header2: true,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Body1(
                    text: description,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
