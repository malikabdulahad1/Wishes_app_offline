import 'dart:math';

import 'package:clipboard/clipboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sizer/sizer.dart';
import 'package:wishes_app/preferences.dart';
import 'package:wishes_app/widgets.dart';
import 'package:wishes_app/wishesModel.dart';

// ignore: must_be_immutable
class MessagesPage extends StatefulWidget {
  String? title;
  MessagesPage({this.title});
  bool isfavourite = false;
  Color? c;
  @override
  State<MessagesPage> createState() => _MessagesPageState();
}

List<String> favouriteWishes = [];
bool isselected = false;
var rand = Random();

class _MessagesPageState extends State<MessagesPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    checkColor() {
      if (favouriteWishes.contains(WishesModel().Messages == favouriteWishes)) {
        isselected = true;
      } else {
        isselected = false;
      }
    }

    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        toolbarHeight: 80,
        title: Text(
          widget.title!,
          style: TextStyle(fontSize: 20.sp),
        ),
        backgroundColor: Color(0xffc2114d),
      ),
      body: CupertinoScrollbar(
        thickness: 5.0,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Column(
                      children: [
                        Column(
                          children: wishes
                              .where(
                                  (element) => element.catagory == widget.title)
                              .map(
                                (e) => Padding(
                                  padding: const EdgeInsets.all(14.0),
                                  child: Container(
                                      constraints:
                                          BoxConstraints(minHeight: 15.h),
                                      decoration: BoxDecoration(
                                          color: Colors.grey.withOpacity(0.2),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                              color: Color(0xffc2114d))),
                                      margin: EdgeInsets.all(2),
                                      child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Center(
                                                child: Text(
                                                  e.Messages!,
                                                  textAlign: TextAlign.justify,
                                                  style: TextStyle(
                                                      //  fontFamily: 'Century Gothic',
                                                      fontSize: 15.sp,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  IconButton(
                                                      onPressed: () {
                                                        Share.share(
                                                            e.Messages!);
                                                      },
                                                      icon: Icon(Icons.share)),
                                                  IconButton(
                                                      onPressed: () {
                                                        FlutterClipboard.copy(
                                                                e.Messages!)
                                                            .whenComplete(() => ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                                                backgroundColor:
                                                                    Color(
                                                                        0xffc2114d),
                                                                duration: Duration(
                                                                    seconds: 2),
                                                                content: Text(
                                                                    'Copied',
                                                                    style: TextStyle(
                                                                        fontSize: 13
                                                                            .sp,
                                                                        fontWeight:
                                                                            FontWeight.bold)))));
                                                      },
                                                      icon: Icon(Icons.copy)),
                                                  IconButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          favouriteWishes
                                                              .add(e.Messages!);
                                                          checkColor();

                                                          Mypreferences.saveWishes(
                                                              favouriteWishes);
                                                          print(
                                                              favouriteWishes);
                                                        });

                                                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                                            duration: Duration(
                                                                seconds: 1),
                                                            dismissDirection:
                                                                DismissDirection
                                                                    .startToEnd,
                                                            backgroundColor:
                                                                Color(
                                                                    0xffc2114d),
                                                            content: Text(
                                                                'Wishes add in favourite',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        13.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold))));
                                                      },
                                                      icon: Icon(
                                                        Icons.favorite,
                                                        color: favouriteWishes
                                                                .contains(
                                                                    e.Messages)
                                                            ? Color(0xffc2114d)
                                                            : Colors.black,
                                                      ))
                                                ],
                                              )
                                            ],
                                          ))),
                                ),
                              )
                              .toList(),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
