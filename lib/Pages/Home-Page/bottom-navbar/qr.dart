import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QR extends StatefulWidget {
  const QR({Key? key}) : super(key: key);

  @override
  State<QR> createState() => _QRState();
}

class _QRState extends State<QR> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("QR"),
        ),
        body: Center(
            child: Container(
              child: Text("QR"),
            )));
  }
}
