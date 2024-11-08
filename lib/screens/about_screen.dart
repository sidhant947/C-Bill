import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatelessWidget {
  final Uri _url = Uri.parse('mailto:khatkarsidhant.com"');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About"),
        centerTitle: true,
      ),
      body: Center(
          child: GestureDetector(
        onTap: () {
          launchUrl(_url);
        },
        child: const Text(
          "Made by Sidhant",
          style: TextStyle(fontSize: 30),
        ),
      )),
    );
  }
}
