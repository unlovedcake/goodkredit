import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:auto_animated/auto_animated.dart';

import 'package:flutter/material.dart';
import 'package:goodkredit/Pages/all-services.dart';
import 'package:goodkredit/Router/navigate-route.dart';
import 'package:goodkredit/Widgets/utils.dart';

class HomeListView extends StatefulWidget {
  const HomeListView({Key? key}) : super(key: key);

  @override
  _HomeListViewState createState() => _HomeListViewState();
}

class _HomeListViewState extends State<HomeListView> {
  int itemsCount = 0;
  List<Widget> icon = [];

  @override
  void initState() {
    icon = [
      Column(
        children: [
          InkWell(
            onTap: () {
              NavigateRoute.gotoPage(context, AllServices());
            },
            child: Icon(
              Icons.ac_unit_outlined,
              size: 28,
              color: Colors.blue,
            ),
          ),
          //Text("All Services",style: TextStyle(fontSize: 10),)
        ],
      ),
      Column(
        children: const [
          InkWell(
            child: Icon(
              Icons.payment,
              size: 28,
              color: Colors.orange,
            ),
          ),
          Text(
            "Buy Prepaid Load",
            style: TextStyle(
              fontSize: 10,
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
      Column(
        children: const [
          InkWell(
            child: Icon(
              Icons.payments,
              size: 28,
              color: Colors.red,
            ),
          ),
          Text(
            "Pay Bills",
            style: TextStyle(fontSize: 10),
          )
        ],
      ),
      Column(
        children: const [
          InkWell(
            child: Icon(
              Icons.description,
              size: 28,
              color: Colors.yellow,
            ),
          ),
          Text(
            "Buy GK Vouchers",
            style: TextStyle(fontSize: 10),
            textAlign: TextAlign.center,
          )
        ],
      ),
      Column(
        children: const [
          InkWell(
            child: Icon(
              Icons.business_center,
              size: 28,
              color: Colors.blueGrey,
            ),
          ),
          Text(
            "GK Negosyo",
            style: TextStyle(fontSize: 10),
          )
        ],
      ),
      Column(
        children: const [
          InkWell(
            child: Icon(
              Icons.document_scanner,
              size: 28,
              color: Colors.amber,
            ),
          ),
          Text(
            "Scan Promo Code",
            style: TextStyle(fontSize: 10),
            textAlign: TextAlign.center,
          )
        ],
      ),
      Column(
        children: const [
          InkWell(
            child: Icon(
              Icons.groups,
              size: 28,
              color: Colors.cyan,
            ),
          ),
          Text(
            "CPMPC",
            style: TextStyle(fontSize: 10),
          )
        ],
      ),
      Column(
        children: const [
          InkWell(
            child: Icon(
              Icons.smart_button,
              size: 28,
            ),
          ),
          Text(
            "Reload Smart Retwail Wallet",
            style: TextStyle(fontSize: 10),
          )
        ],
      ),
      Column(
        children: const [
          InkWell(
            child: Icon(
              Icons.water_drop,
              size: 28,
              color: Colors.lightBlueAccent,
            ),
          ),
          Text(
            "Drop Off",
            style: TextStyle(fontSize: 10),
          )
        ],
      ),
      Column(
        children: const [
          InkWell(
            child: Icon(
              Icons.child_care,
              size: 28,
              color: Colors.amber,
            ),
          ),
          Text(
            "Refer A Friend",
            style: TextStyle(fontSize: 10),
          )
        ],
      ),
      Column(
        children: const [
          InkWell(
            child: Icon(Icons.new_releases, size: 28, color: Colors.green),
          ),
          Text(
            "What's News",
            style: TextStyle(fontSize: 10),
          )
        ],
      ),
      Column(
        children: const [
          InkWell(
            child: Icon(
              Icons.sms,
              size: 28,
            ),
          ),
          Text(
            "FREE SMS",
            style: TextStyle(fontSize: 10),
          )
        ],
      ),
      Column(
        children: const [
          InkWell(
            child: Icon(
              Icons.how_to_vote,
              size: 28,
              color: Colors.redAccent,
            ),
          ),
          Text(
            "Votes",
            style: TextStyle(fontSize: 10),
          )
        ],
      ),
      Column(
        children: const [
          InkWell(
            child: Icon(
              Icons.qr_code_outlined,
              size: 28,
            ),
          ),
          Text(
            "Play By QR",
            style: TextStyle(fontSize: 10),
          )
        ],
      ),
    ];

    itemsCount = icon.length;

    Future.delayed(Duration(milliseconds: 700) * 5, () {
      if (!mounted) {
        return;
      }
      setState(() {
        if (icon.length > itemsCount) {
          itemsCount += 4;
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Padding(
          padding: EdgeInsets.only(left: 16.0),
          child: SizedBox(
            width: 250.0,
            child: AnimatedTextKit(
              repeatForever: false,
              animatedTexts: [
                ScaleAnimatedText('Services'),

              ],
              onTap: () {
                print("Tap Event");
              },
            ),
          ),
          // child: Text(
          //   "Services",
          //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          // ),
        ),
        Container(
          height: 350,
          child: LiveGrid(
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.all(16),
              showItemInterval: Duration(milliseconds: 50),
              showItemDuration: Duration(milliseconds: 150),
              visibleFraction: 0.001,
              itemCount: itemsCount,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemBuilder: animationItemBuilder((index) => icon[index])),
        ),
      ],
    );
  }
}
