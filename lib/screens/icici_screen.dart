import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class IciciScreen extends StatefulWidget {
  @override
  _IciciScreenState createState() => _IciciScreenState();
}

class _IciciScreenState extends State<IciciScreen> {
  final TextEditingController _firstController = TextEditingController();

  Future<void> _launchURL() async {
    final firstValue = _firstController.text;

    final url =
        Uri.parse('upi://pay?pa=ccpay.$firstValue@icici&pn=ICICI&cu=INR');

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
        title: Text('ICICI Bank'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              maxLength: 16,
              controller: _firstController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter 16 digit Card number',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
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
    super.dispose();
  }
}
