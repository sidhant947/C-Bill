import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final List<String> banks = ['/axis', '/icici', '/aubank', '/amex', '/idfc'];

  final List<String> banklogo = [
    'assets/axis.png',
    'assets/icici.png',
    'assets/aubank.png',
    'assets/amex.png',
    'assets/idfc.png'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("C-Bill"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: GestureDetector(
              child: Icon(Icons.person),
              onTap: () {
                Navigator.pushNamed(context, '/about');
              },
            ),
          )
        ],
      ),
      body: ListView.builder(
          itemCount: banks.length,
          itemBuilder: (BuildContext, index) {
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, banks[index].toString());
              },
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  height: 150,
                  child: Image.asset(banklogo[index].toString()),
                ),
              ),
            );
          }),
    );
  }
}
