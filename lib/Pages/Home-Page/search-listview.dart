import 'package:auto_animated/auto_animated.dart';

import 'package:flutter/material.dart';
import 'package:goodkredit/Pages/all-services.dart';
import 'package:goodkredit/Router/navigate-route.dart';
import 'package:goodkredit/Widgets/utils.dart';

class SearchListView extends StatefulWidget {
  const SearchListView({Key? key}) : super(key: key);

  @override
  _SearchListViewState createState() => _SearchListViewState();
}

class _SearchListViewState extends State<SearchListView> {
  int itemsCount = 0;
  List<Widget> icon = [];


  @override
  void initState() {


    icon = [

      Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Card(
            child: Row(
              children: const [
                Icon(
                  Icons.payment,
                  size: 40,
                  color: Colors.orange,
                ),
                Text("Billings",style: TextStyle(fontSize: 22,),textAlign: TextAlign.center,)
              ],
            ),
          ),
          InkWell(
            onTap:() => print("Buy Prepaid"),
            child: Row(
              children: const [
                Icon(
                  Icons.payment,
                  size: 40,
                  color: Colors.orange,
                ),
                Text("Buy Prepaid Load",style: TextStyle(fontSize: 18,),textAlign: TextAlign.center,)
              ],
            ),
          ),
          InkWell(
            onTap:() => print("Pay Bills"),
            child: Row(
              children: const [
                Icon(
                  Icons.payments,
                  size: 40,
                  color: Colors.red,
                ),
                Text("Pay Bills",style: TextStyle(fontSize: 18),)
              ],
            ),
          ),
          InkWell(
            onTap:() => print("Buy GK"),
            child: Row(
              children: const [
                Icon(
                  Icons.description,
                  size: 40,
                  color: Colors.yellow,
                ),
                Text("Buy GK Vouchers",style: TextStyle(fontSize: 18),textAlign: TextAlign.center,)
              ],
            ),
          ),

        ],
      ),

      Column(
       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Card(
            child: Row(
              children: const [
                Icon(
                  Icons.payment,
                  size: 40,
                  color: Colors.orange,
                ),
                Text("COOP",style: TextStyle(fontSize: 22,),textAlign: TextAlign.center,)
              ],
            ),
          ),
          InkWell(
            onTap:() => print("GK Negosyo"),
            child: Row(
              children: const [
                Icon(
                  Icons.business_center,
                  size: 40,
                  color: Colors.blueGrey,
                ),
                Text("GK Negosyo",style: TextStyle(fontSize: 18),)
              ],
            ),
          ),
          InkWell(
            onTap:() => print("Scan"),
            child: Row(
              children: const [
                Icon(
                  Icons.document_scanner,
                  size: 40,
                  color: Colors.amber,
                ),
                Text("Scan Promo Code",style: TextStyle(fontSize: 18),textAlign: TextAlign.center,)
              ],
            ),
          ),
          InkWell(
            onTap:() => print("CMPC"),
            child: Row(
              children: const [
                Icon(
                  Icons.groups,
                  size: 40,
                  color: Colors.cyan,
                ),
                Text("CPMPC",style: TextStyle(fontSize: 18),)
              ],
            ),
          ),
          InkWell(
            onTap:() => print("Reload"),
            child: Row(
              children: const [
                Icon(
                  Icons.smart_button,
                  size: 40,
                ),
                Text("Reload Smart Retwail Wallet",style: TextStyle(fontSize: 18),)
              ],
            ),
          ),
        ],
      ),


      Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Card(
            child: Row(
              children: const [
                Icon(
                  Icons.payment,
                  size: 40,
                  color: Colors.orange,
                ),
                Text("OTHERS",style: TextStyle(fontSize: 22,),textAlign: TextAlign.center,)
              ],
            ),
          ),
          InkWell(
            onTap:() => print("Drop"),
            child: Row(
              children: const [
                Icon(
                  Icons.water_drop,
                  size: 28,
                  color: Colors.lightBlueAccent,
                ),
                Text("Drop Off",style: TextStyle(fontSize: 10),)
              ],
            ),
          ),
          InkWell(
            onTap:() => print("Refer"),
            child: Row(
              children: const [
                Icon(
                  Icons.child_care,
                  size: 28,
                  color: Colors.amber,
                ),
                Text("Refer A Friend",style: TextStyle(fontSize: 10),)
              ],
            ),
          ),
          InkWell(
            onTap:() => print("News"),
            child: Row(
              children: const [
                Icon(
                    Icons.new_releases,
                    size: 28,
                    color: Colors.green
                ),
                Text("What's News",style: TextStyle(fontSize: 10),)
              ],
            ),
          ),
          InkWell(
            onTap:() => print("SMS"),
            child: Row(
              children: const [
                Icon(
                  Icons.sms,
                  size: 28,
                ),
                Text("FREE SMS",style: TextStyle(fontSize: 10),)
              ],
            ),
          ),
          InkWell(
            onTap:() => print("Votes"),
            child: Row(
              children: const [
                Icon(
                  Icons.how_to_vote,
                  size: 28,
                  color: Colors.redAccent,
                ),
                Text("Votes",style: TextStyle(fontSize: 10),)
              ],
            ),
          ),
          InkWell(
            onTap:() => print("Play By QR"),
            child: Row(
              children: const [
                Icon(
                  Icons.qr_code_outlined,
                  size: 28,
                ),
                Text("Play By QR",style: TextStyle(fontSize: 10),)
              ],
            ),
          ),

        ],
      ),


    ];

    itemsCount = icon.length;

    Future.delayed(Duration(milliseconds: 1000) * 5, () {
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

    return LiveList(
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.all(16),
        showItemInterval: Duration(milliseconds: 50),
        showItemDuration: Duration(milliseconds: 150),
        visibleFraction: 0.001,
        itemCount: itemsCount,

        itemBuilder: animationItemBuilder((index) => icon[index]));
  }
}
