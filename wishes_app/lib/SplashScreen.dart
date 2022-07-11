import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:wishes_app/WishesHomeScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 5), () {
      setState(() {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => WishesHomeScreen(),
            ));
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              'images/wishX.png',
              height: 20.h,
            ),
          )
        ],
      ),
    );
  }
}
