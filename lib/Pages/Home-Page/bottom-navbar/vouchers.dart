import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Vouchers extends StatefulWidget {
  const Vouchers({Key? key}) : super(key: key);

  @override
  State<Vouchers> createState() => _VouchersState();
}

class _VouchersState extends State<Vouchers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Vouchers"),
        ),
        body: Center(
            child: Container(
      child: Text("Vouchers"),
    )));
  }
}
