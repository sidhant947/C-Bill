import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class AxisScreen extends StatefulWidget {
  @override
  _AxisScreenState createState() => _AxisScreenState();
}

class _AxisScreenState extends State<AxisScreen> {
  final TextEditingController _firstController = TextEditingController();
  final TextEditingController _secondController = TextEditingController();

  String? _errorMessage;

  Future<void> _launchURL() async {
    final firstValue = _firstController.text;
    final secondValue = _secondController.text;

    final url = Uri.parse(
        'upi://pay?pa=CC.91$firstValue$secondValue@axisbank&pn=Axis&cu=INR');

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
        title: Text('Axis Bank'),
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
              onPressed: () {
                _launchURL();
              },
              child: Text('Pay Now'),
            ),
            SizedBox(height: 16),
            if (_errorMessage != null)
              Text(
                _errorMessage!,
                style: TextStyle(color: Colors.red),
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
