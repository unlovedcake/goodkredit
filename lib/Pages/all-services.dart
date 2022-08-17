import 'package:flutter/material.dart';
import 'package:goodkredit/Pages/Home-Page/home-listview.dart';

import 'Home-Page/search-listview.dart';


class MyPlatforms {
  String name;
  Widget icon;
  MyPlatforms({required this.icon, required this.name});
}

//A MyPlatforms list created using that modal
final List<MyPlatforms> myPlatformsList = [
  MyPlatforms(
      icon: Row(
        children: const [
          Icon(
            Icons.payment,
            size: 40,
            color: Colors.orange,
          ),
          Text(
            "Buy Prepaid Load",
            style: TextStyle(
              fontSize: 18,
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
      name: "Buy Prepaid Load"),
  MyPlatforms(
      icon: Row(
        children: const [
          Icon(
            Icons.payments,
            size: 40,
            color: Colors.red,
          ),
          Text(
            "Pay Bills",
            style: TextStyle(fontSize: 18),
          )
        ],
      ),
      name: "Pay Bills"),
  MyPlatforms(
      icon: Row(
        children: const [
          Icon(
            Icons.description,
            size: 40,
            color: Colors.yellow,
          ),
          Text(
            "Buy GK Vouchers",
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          )
        ],
      ),
      name: "Buy GK Vouchers"),
  MyPlatforms(
      icon: Row(
        children: const [
          Icon(
            Icons.business_center,
            size: 40,
            color: Colors.blueGrey,
          ),
          Text(
            "GK Negosyo",
            style: TextStyle(fontSize: 18),
          )
        ],
      ),
      name: "GK Negosyo"),
  MyPlatforms(
      icon: Row(
        children: const [
          Icon(
            Icons.document_scanner,
            size: 40,
            color: Colors.amber,
          ),
          Text(
            "Scan Promo Code",
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          )
        ],
      ),
      name: "Scan Promo Code"),
  MyPlatforms(
      icon: Row(
        children: const [
          Icon(
            Icons.groups,
            size: 40,
            color: Colors.cyan,
          ),
          Text(
            "CPMPC",
            style: TextStyle(fontSize: 18),
          )
        ],
      ),
      name: "CPMPC"),
  MyPlatforms(
      icon: Row(
        children: const [
          Icon(
            Icons.smart_button,
            size: 40,
          ),
          Text(
            "Reload Smart Retail Wallet",
            style: TextStyle(fontSize: 18),
          )
        ],
      ),
      name: "Reload Smart Retail Wallet"),
  MyPlatforms(
      icon: Row(
        children: const [
          Icon(
            Icons.water_drop,
            size: 28,
            color: Colors.lightBlueAccent,
          ),
          Text(
            "Drop Off",
            style: TextStyle(fontSize: 10),
          )
        ],
      ),
      name: "Drop Off"),
  MyPlatforms(
      icon: Row(
        children: const [
          Icon(
            Icons.child_care,
            size: 28,
            color: Colors.amber,
          ),
          Text(
            "Refer A Friend",
            style: TextStyle(fontSize: 10),
          )
        ],
      ),
      name: "Refer A Friend"),
];

final List<String> myList = [
  "Buy Prepaid Load",
  "Pay Bills",
  "Buy GK Vouchers",
  "GK Negosyo",
  "Scan Promo Code",
  "CPMPC",
  "Reload Smart Retail Wallet",
  "Drop Off",
  "Refer A Friend",
];
//
//
//
// class AllServices extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Search Example"),
//         actions: [
//           IconButton(
//               icon: Icon(Icons.search),
//               onPressed: () {
//                 showSearch(context: context, delegate: SearchItem());
//               }),
//         ],
//       ),
//       body:  HomeListView(),
//     );
//   }
// }
//
//
//
// class SearchItem extends SearchDelegate<String> {
//   @override
//   List<Widget> buildActions(BuildContext context) {
//     return [
//       IconButton(
//           icon: Icon(Icons.clear),
//           onPressed: () {
//             query = "";
//           })
//     ];
//   }
//
//   @override
//   Widget? buildLeading(BuildContext context) {
//     return Container(child: Text("OKE"),);
//   }
//
//   @override
//   Widget buildResults(BuildContext context) {
//     return HomeListView();
//   }
//
//   @override
//   Widget buildSuggestions(BuildContext context) {
//     final suggestionsList = query.isEmpty
//         ? myList
//         : myList
//         .where((p) => p.toLowerCase().contains(query.toLowerCase()))
//         .toList();
//
//     if(query.isEmpty){
//
//       return HomeListView();
//     }
//
//     return ListView.builder(
//       itemBuilder: (context, index) => ListTile(
//         onTap: () {
//           close(context, suggestionsList[index]);
//           Navigator.push(
//               context,
//               MaterialPageRoute(
//                   builder: (context) => DetailScreen(
//                     item: myPlatformsList[
//                     index], //pass the index of the MyPlatforms list
//                   )));
//         },
//         title: Text(suggestionsList[index]),
//       ),
//       itemCount: suggestionsList.length,
//     );
//   }
// }
//
class DetailScreen extends StatelessWidget {
  final MyPlatforms
  item; //Get the item, as a object of MyPlatforms class so the we can acess its all properties like image and name;

  DetailScreen({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("${item.name}"),
        ),
        body: Center(
          child: Column(
            children: [
              Text(
                "${item.name}", //acessing the name property of the  MyPlatforms class
                style: TextStyle(fontSize: 22),
              ),
              const SizedBox(
                height: 20.0,
              ),
              item.icon //acessing the image property of the  MyPlatforms class
            ],
          ),
        ));
  }
}


class AllServices extends StatefulWidget {
  const AllServices({Key? key}) : super(key: key);

  @override
  State<AllServices> createState() => _AllServicesState();
}

class _AllServicesState extends State<AllServices> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Services",
        ),
        actions: [
          IconButton(
            onPressed: () {
              // method to show the search bar
              showSearch(
                  context: context,
                  // delegate to customize the search bar
                  delegate: CustomSearchDelegate()
              );
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body:  SearchListView(),
    );
  }
}
class CustomSearchDelegate extends SearchDelegate {
// Demo list to show querying
  List<String> searchTerms = [
    "Apple",
    "Banana",
    "Mango",
    "Pear",
    "Watermelons",
    "Blueberries",
    "Pineapples",
    "Strawberries"
  ];


  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

// second overwrite to pop out of search menu
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

// third overwrite to show query result
  @override
  Widget buildResults(BuildContext context) {

    List<MyPlatforms> matchQuery = [];
    for (var fruit in myPlatformsList) {
      if (fruit.name.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }

    // final suggestionsList = query.isEmpty
    //     ? myList
    //     : myList
    //     .where((p) => p.toLowerCase().contains(query.toLowerCase()))
    //     .toList();
    //
    //
    // return ListView.builder(
    //   itemBuilder: (context, index) => ListTile(
    //     onTap: () {
    //       close(context, suggestionsList[index]);
    //       Navigator.push(
    //           context,
    //           MaterialPageRoute(
    //               builder: (context) => DetailScreen(
    //                 item: myPlatformsList[
    //                 index], //pass the index of the MyPlatforms list
    //               )));
    //     },
    //     title: Text(suggestionsList[index]),
    //   ),
    //   itemCount: suggestionsList.length,
    // );
    // List<String> matchQuery = [];
    // for (var fruit in searchTerms) {
    //   if (fruit.toLowerCase().contains(query.toLowerCase())) {
    //     matchQuery.add(fruit);
    //   }
    // }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          leading: result.icon,
          title: Text(result.name),
        );
      },
    );
  }

// last overwrite to show the
// querying process at the runtime
  @override
  Widget buildSuggestions(BuildContext context) {

    List<MyPlatforms> matchQuery = [];
    for (var fruit in myPlatformsList) {
      if (fruit.name.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }

        final suggestionsList = query.isEmpty
        ? myList
        : myList
        .where((p) => p.toLowerCase().contains(query.toLowerCase()))
        .toList();


        if(query.isEmpty){
          return  SearchListView();
        }
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          close(context, matchQuery[index]);

          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailScreen(
                    item:  matchQuery[index], //pass the index of the MyPlatforms list
                  )));
        },

        title: Column(
          children: [
            matchQuery[index].icon,
            //Text(  matchQuery[index].name),
          ],
        ),
      ),
      itemCount:   matchQuery.length,
    );

    // List<String> matchQuery = [];
    // for (var fruit in searchTerms) {
    //   if (fruit.toLowerCase().contains(query.toLowerCase())) {
    //     matchQuery.add(fruit);
    //   }
    // }
    // return ListView.builder(
    //   itemCount: matchQuery.length,
    //   itemBuilder: (context, index) {
    //     var result = matchQuery[index];
    //     return ListTile(
    //       title: Text(result),
    //     );
    //   },
    // );
  }
}
