import 'package:auto_animated/auto_animated.dart';

import 'package:flutter/material.dart';
import 'package:goodkredit/Widgets/utils.dart';

class FavouritesUsedListView extends StatefulWidget {
  @override
  _FavouritesUsedListViewState createState() => _FavouritesUsedListViewState();
}

class _FavouritesUsedListViewState extends State<FavouritesUsedListView> {
  int itemsCount = 0;
  List<Widget> icon = [
    Column(
      children: const [
        InkWell(
          child:Icon(
          Icons.ac_unit_outlined,
          size: 28,
            color: Colors.blue,
        ), ),
        Text("All Services",style: TextStyle(fontSize: 10),)
      ],
    ),
    Column(
      children: const [
        InkWell(child:Icon(
          Icons.ac_unit_outlined,
          size: 28,
          color: Colors.orange,
        ), ),
        Text("Buy Prepaid Load",style: TextStyle(fontSize: 10,),textAlign: TextAlign.center,)
      ],
    ),
    Column(
      children: const [
        InkWell(child:Icon(
          Icons.ac_unit_outlined,
          size: 28,
          color: Colors.red,
        ), ),
        Text("Pay Bills",style: TextStyle(fontSize: 10),)
      ],
    ),

    Column(
      children: const [
        InkWell(child:Icon(
          Icons.ac_unit_outlined,
          size: 28,
          color: Colors.red,
        ), ),
        Text("Pay Bills",style: TextStyle(fontSize: 10),)
      ],
    ),
    Column(
      children: const [
        InkWell(child:Icon(
          Icons.ac_unit_outlined,
          size: 28,
          color: Colors.red,
        ), ),
        Text("Pay Bills",style: TextStyle(fontSize: 10),)
      ],
    ),


  ];

  @override
  void initState() {
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
        const Padding(
          padding: EdgeInsets.only(left: 16.0),
          child: Text("Favourites",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
        ),
        SizedBox(
          height: 100,
          width: size.width,
          child: LiveGrid(

              shrinkWrap: true,
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
