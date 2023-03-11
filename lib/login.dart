import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:tiff_valet/otp_screen.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  String _phoneNumber="";
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 100,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'Login',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Color(0xff000000),
                    fontSize: 35),
              ),
            ),
            SizedBox(
              height: 20,
            ),

            Container(
              child: IntlPhoneField(
                initialCountryCode:'IN',
                onChanged: (phone){
                  print(phone.completeNumber);
                  _phoneNumber=phone.completeNumber;
                },


              ),
            ),
            SizedBox(
              height: 500,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Container(
                width: 900,
                height: 50,
                child: OutlinedButton(
                    onPressed: () {

                      Navigator.push(context,  MaterialPageRoute(builder: (context) => otp_screen()));
                    },
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.white,
                      elevation: 2,
                    ),
                    child: Text(
                      'Login',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Color(0xffeb4647),
                          fontSize: 20),
                    )),
              ),
            )






          ],
        ),),

    );
  }
}
