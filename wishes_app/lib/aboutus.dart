import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:wishes_app/WishesHomeScreen.dart';
import 'package:wishes_app/widgets.dart';

class Aboutus extends StatelessWidget {
  const Aboutus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        toolbarHeight: 80,
        title: Text(
          'About us',
          style: TextStyle(
            fontSize: 20.sp,
          ),
        ),
        backgroundColor: Color(0xffc2114d),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                "About us",
                style: TextStyle(
                    fontSize: 20.sp,
                    color: Color(0xffc2114d),
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                "Welcome to Camel Developer , your number one source for all things. \n \nWe're dedicated to providing you the very best app.We're working to turn our passion to provide best apps with services and content. \n \nWe hope you enjoy our app as much as we enjoy offering them to you.\n \n\n \nSincerely, \n \nAli Imran Jazib ",
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 15.sp),
              ),
            ),
          ),
          MaterialButton(
            color: Color(0xffc2114d),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return WishesHomeScreen();
              }));
            },
            child: Text(
              'Go To Home Page',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
