import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sizer/sizer.dart';
import 'package:wishes_app/favourite.dart';
import 'package:wishes_app/messagesPage.dart';
import 'package:wishes_app/widgets.dart';
import 'package:wishes_app/wishesModel.dart';

class WishesHomeScreen extends StatefulWidget {
  WishesHomeScreen({Key? key}) : super(key: key);

  @override
  State<WishesHomeScreen> createState() => _WishesHomeScreenState();
}

class _WishesHomeScreenState extends State<WishesHomeScreen> {
  go(BuildContext c, String text) {
    Navigator.push(
        c,
        MaterialPageRoute(
          builder: (context) => MessagesPage(
            title: text,
          ),
        ));
  }

  // final List wishes = [
  @override
  Widget build(BuildContext context) {
    DateTime timeBackPressed = DateTime.now();
    Set myset = {};
    List unique = [];
    for (var item in wishes) {
      myset.add(item.catagory);
    }
    unique = myset.toList();
    return WillPopScope(
      onWillPop: () async {
        final difference = DateTime.now().difference(timeBackPressed);
        final isExitWarning = difference >= Duration(seconds: 2);
        timeBackPressed = DateTime.now();
        if (isExitWarning) {
          final message = 'Press back again';
          Fluttertoast.showToast(msg: message);
          return false;
        } else {
          Fluttertoast.cancel();
          return true;
        }
      },
      child: Scaffold(
        drawer: MyDrawer(),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xffc2114d),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => FavouritePage()));
          },
          child: Icon(Icons.favorite),
        ),
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  exit(0);
                },
                icon: Icon(Icons.power_settings_new))
          ],
          toolbarHeight: 80,
          title: Text(
            'WishX - All Types of Wishes',
            style: TextStyle(
              fontSize: 18.sp,
            ),
          ),
          backgroundColor: Color(0xffc2114d),
        ),
        body: GridView.builder(
            clipBehavior: Clip.hardEdge,
            itemCount: unique.length,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (c, i) {
              return Padding(
                padding: const EdgeInsets.all(15.0),
                child: InkWell(
                  onTap: () {
                    go(c, unique[i]);
                  },
                  child: Container(
                    width: 10.w,
                    height: 10.h,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xffc2114d), width: 2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        unique[i],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 15.sp, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
