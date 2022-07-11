import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:wishes_app/widgets.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        toolbarHeight: 80,
        title: Text(
          'Contact us',
          style: TextStyle(
            fontSize: 20.sp,
          ),
        ),
        backgroundColor: Color(0xffc2114d),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Contact us',
            style: TextStyle(
                fontSize: 20.sp,
                color: Color(0xffc2114d),
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 2.h,
          ),
          // MyTextField('Enter Your Name', 'Enter Your Name',
          //     mLexngth: 10, pIcon: Icon(Icons.person)),
          // MyTextField(
          //   'Enter Your Email',
          //   'Enter Your Email',
          //   mLexngth: 15,
          //   pIcon: Icon(Icons.email),
          // ),
          // MyTextField('Enter Your Question?', 'Enter Your Question?',
          //     pIcon: Icon(Icons.question_answer), mLine: 20, mLexngth: 500),
          // MyTextField('Enter Your Name', 'Enter Your Name'),
          // IconButton(onPressed: () {}, icon: Icon(Icons.one_k),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {},
                child: Container(
                  width: 30.w,
                  height: 5.h,
                  child: Center(
                      child: Text(
                    'Submit',
                    style: TextStyle(
                        fontSize: 18.sp,
                        color: Color(0xffc2114d),
                        fontWeight: FontWeight.bold),
                  )),
                  decoration: BoxDecoration(
                      // color: Color(0xffc2114d),
                      border: Border.all(
                        color: Color(0xffc2114d),
                      ),
                      borderRadius: BorderRadius.circular(50)),
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              InkWell(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onTap: () {},
                child: Container(
                  width: 30.w,
                  height: 5.h,
                  child: Center(
                      child: Text(
                    'Rest',
                    style: TextStyle(
                        fontSize: 18.sp,
                        color: Color(0xffc2114d),
                        fontWeight: FontWeight.bold),
                  )),
                  decoration: BoxDecoration(
                      // color: Color(0xffc2114d),
                      border: Border.all(
                        color: Color(0xffc2114d),
                      ),
                      borderRadius: BorderRadius.circular(50)),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  // Widget MyTextField(String hText, String lText,
  //     {Icon? pIcon, int? mLexngth, int? mLine}) {
  //   return Padding(
  //     padding: const EdgeInsets.all(18.0),
  //     child: TextFormField(
  //       minLines: 1,
  //       maxLines: mLine,
  //       maxLength: mLexngth,
  //       cursorColor: Color(0xffc2114d),
  //       decoration: InputDecoration(
  //           hintText: hText,
  //           labelText: lText,
  //           border: OutlineInputBorder(),
  //           prefixIcon: pIcon,
  //           prefixIconColor: Color(0xffc2114d)),
  //     ),
  //   );
  // }
}
