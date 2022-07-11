import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:wishes_app/WishesHomeScreen.dart';
import 'package:wishes_app/aboutus.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({
    Key? key,
  }) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.only(top: 13.8.h),
      child: Drawer(
          child: Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              width: 50.w,
              height: 15.h,
              decoration: BoxDecoration(
                // color: Colors.amber,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 3.h,
                  ),
                  Image.asset(
                    'images/wishX.png',
                    height: 10.h,
                  ),

                  // Text(
                  //   'Welcome to WishX App - All Types of Wishes',
                  //   textAlign: TextAlign.center,
                  //   style: TextStyle(
                  //     fontSize: 20.sp,
                  //     fontWeight: FontWeight.bold,
                  //     color: Color(0xffc2114d),
                  //   ),
                  // ),
                ],
              )),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WishesHomeScreen(),
                  ));
            },
            child: ListTile(
              trailing: Icon(
                Icons.arrow_circle_right_outlined,
                color: Color(0xffc2114d),
              ),
              title: Text('Home'),
              leading: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Color(0xffc2114d))),
                child: CircleAvatar(
                  child: Icon(
                    Icons.home,
                    color: Color(0xffc2114d),
                  ),
                  backgroundColor: Colors.transparent,
                  radius: 20,
                ),
              ),
            ),
          ),
          // InkWell(
          //   onTap: () {
          //     // Navigator.push(
          //     //     context,
          //     //     MaterialPageRoute(
          //     //       builder: (context) => ContactUs(),
          //     //     ));
          //   },
          //   child: ListTile(
          //     title: Text('Contact us'),
          //     trailing: Icon(
          //       Icons.arrow_circle_right_outlined,
          //       color: Color(0xffc2114d),
          //     ),
          //     leading: Container(
          //       decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(20),
          //           border: Border.all(color: Color(0xffc2114d))),
          //       child: CircleAvatar(
          //         backgroundColor: Colors.transparent,
          //         radius: 20,
          //         child: Icon(
          //           Icons.contact_phone_outlined,
          //           color: Color(0xffc2114d),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Aboutus(),
                  ));
            },
            child: ListTile(
              trailing: Icon(
                Icons.arrow_circle_right_outlined,
                color: Color(0xffc2114d),
              ),
              title: Text('About us'),
              leading: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Color(0xffc2114d))),
                child: CircleAvatar(
                  child: Icon(
                    Icons.person,
                    color: Color(0xffc2114d),
                  ),
                  backgroundColor: Colors.transparent,
                  radius: 20,
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
