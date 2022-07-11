import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sizer/sizer.dart';
import 'package:wishes_app/messagesPage.dart';
import 'package:wishes_app/preferences.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({Key? key}) : super(key: key);

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  void initState() {
    go();

    super.initState();
  }

  go() {
    setState(() {
      favouriteWishes = Mypreferences.fetchWishes();
      // Mypreferences.deleteWishes(favouriteWishes);
    });
  }

  // godelete() {
  //   setState(() {

  //     Mypreferences.deleteWishes();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    favouriteWishes.removeRange(0, favouriteWishes.length);
                    Mypreferences.deleteWishes(favouriteWishes);
                  });
                },
                icon: Icon(Icons.delete_forever))
          ],
          toolbarHeight: 80,
          title: Text(
            'Your Favourite Wishes',
            style: TextStyle(
              fontSize: 20.sp,
            ),
          ),
          backgroundColor: Color(0xffc2114d),
        ),
        body: logic());
  }

  logic() {
    Set finalSet = {};
    List finalList = [];
    for (var item in favouriteWishes) {
      finalSet.add(item);
    }
    finalList = finalSet.toList();
    if (favouriteWishes.isNotEmpty) {
      return ListView.builder(
        itemCount: finalList.length,
        itemBuilder: (context, i) {
          return Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                  constraints: BoxConstraints(minHeight: 15.h),
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Color(0xffc2114d))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          finalList[i].toString(),
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              //  fontFamily: 'Century Gothic',
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                              onPressed: () {
                                Share.share(favouriteWishes[i]);
                              },
                              icon: Icon(Icons.share)),
                          IconButton(
                              onPressed: () {
                                FlutterClipboard.copy(favouriteWishes[i])
                                    .whenComplete(() =>
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                backgroundColor:
                                                            Color(0xffc2114d),
                                                content: Text('Copied',
                                                    style: TextStyle(
                                                      
                                                        fontSize: 13.sp,
                                                        fontWeight: FontWeight
                                                            .bold)))));
                              },
                              icon: Icon(Icons.copy)),
                          // IconButton(
                          //     onPressed: () {
                          //       setState(() {
                          //         // godelete();
                          //       });
                          //       ScaffoldMessenger.of(context).showSnackBar(
                          //           SnackBar(content: Text('Deleted')));
                          //     },
                          //     icon: Icon(
                          //       Icons.delete,
                          //       color: Colors.black,
                          //     ))
                        ],
                      )
                    ],
                  )));
        },
      );
    } else {
      return Center(
        child: Text(
          'No Favourite',
          style: TextStyle(
              //  fontFamily: 'Century Gothic',
              fontSize: 15.sp,
              fontWeight: FontWeight.w400),
        ),
      );
    }
  }
}
