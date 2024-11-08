import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AubankScreen extends StatefulWidget {
  @override
  _AubankScreenState createState() => _AubankScreenState();
}

class _AubankScreenState extends State<AubankScreen> {
  final TextEditingController _firstController = TextEditingController();
  final TextEditingController _secondController = TextEditingController();

  Future<void> _launchURL() async {
    final firstValue = _firstController.text;
    final secondValue = _secondController.text;

    final url = Uri.parse(
        'upi://pay?pa=AUCC$firstValue$secondValue@AUBANK&pn=AU Bank&cu=INR');

    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AU Bank'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              maxLength: 10,
              controller: _firstController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter 10 digit mobile number',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              maxLength: 4,
              controller: _secondController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter Last 4 Digit of Card',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
              onPressed: () {
                _launchURL();
              },
              child: const Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  'Pay Now',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _firstController.dispose();
    _secondController.dispose();
    super.dispose();
  }
}
