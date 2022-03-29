import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/Home/home.dart';
import 'package:flutter_application_1/views/constants.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorLightBrown,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.7,
            child: Stack(children: [
              PageView(
                children: const [
                  Page(
                    url: 'assets/1.jpeg',
                    text: 'Start your day with a cup of coffee',
                  ),
                  Page(
                    url: 'assets/2.jpeg',
                    text: 'Start your day with a cup of coffee',
                  ),
                  Page(
                    url: 'assets/3.jpeg',
                    text: 'Start your day with a cup of coffee',
                  ),
                ],
              ),
            ]),
          ),
          Row(
            children: const [Dot(), Dot(), Dot()],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
          const SizedBox(
            height: 20,
          ),
          MaterialButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()));
            },
            color: colorGreen,
            child: const Text('Get Started'),
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 100),
            textColor: Colors.white,
          )
        ],
      ),
    );
  }
}

class Dot extends StatelessWidget {
  const Dot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 15, top: 10),
      width: 10,
      height: 10,
      decoration: BoxDecoration(
          // color: true ?const Color.fromARGB(255, 31, 63, 47):
          color: const Color.fromARGB(255, 150, 115, 102),
          borderRadius: BorderRadius.circular(10)),
    );
  }
}

class Page extends StatelessWidget {
  final String url;
  final String text;
  const Page({Key? key, required this.url, required this.text})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * .6,
          decoration: BoxDecoration(
              image:
                  DecorationImage(image: AssetImage(url), fit: BoxFit.cover)),
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          text,
          style: const TextStyle(
              color: Color.fromARGB(255, 56, 40, 34),
              fontSize: 20,
              fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
