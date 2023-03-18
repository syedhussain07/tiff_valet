import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:tiff_valet/customer_gps.dart';
import 'package:tiff_valet/home_screen.dart';

class otp_screen extends StatelessWidget {
  final String phoneNumber;
  final String countryCode;

  otp_screen({required this.phoneNumber,required this.countryCode});


  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(
            color: Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );
    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Color.fromRGBO(234, 239, 243, 1),
      ),
    );
    return Scaffold(
      body: Form(
        key: formKey,
        child: Padding(padding: EdgeInsets.all(20),
          child: Column(

            children: [
              SizedBox(
                height: 100,
              ),
              Center(
                child: Text(
                  'OTP Verification',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Color(0xff000000),
                      fontSize: 35),
                ),
              ),
              SizedBox(
                height: 15,
              ),

              Text("Enter the code sent to the number"),
              SizedBox(
                height: 5,
              ),
              Text(countryCode+" "+phoneNumber),
              SizedBox(
                height: 30,
              ),

              Pinput(
                length: 6,
                // defaultPinTheme: defaultPinTheme,
                // focusedPinTheme: focusedPinTheme,
                // submittedPinTheme: submittedPinTheme,

                showCursor: true,
                onCompleted: (pin) => print(pin),
              ),
              SizedBox(
                height: 20,
              ),

              buildTimer(),

              //OtpForm(),
              Expanded(child: SizedBox()),
              Text("Didn't recieve code?"),
              SizedBox(
                height: 5,
              ),

              GestureDetector(
                onTap: () {// OTP code resend
                },
                child: Text("Resend OTP",
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0,right:20,bottom:10),
                child: MaterialButton(
                    onPressed:(){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => home_screen(delivered_customer_name: "delivered_customer_name")));
                    },
                    padding: const EdgeInsets.only(right:0.0),
                    child: Ink(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFF8639B1), Color(0xFFEB2133), Color(0xFFFD9E41)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      ),
                      child: Container(
                          constraints: const BoxConstraints(minWidth: 60.0, minHeight: 60.0), // min sizes for Material buttons
                          alignment: Alignment.center,
                          child: Text('Verify',style: TextStyle(color: Colors.white),)

                      ),
                    )
                ),
              ),

              // Container(
              //   width: 400,
              //   height: 50,
              //   child: OutlinedButton(onPressed: (){
              //     //Navigator.push(context, MaterialPageRoute(builder: (context) => customer_gps()));
              //   },
              //       child:  const Text('Verify Otp', style: TextStyle(color: Colors.black, fontSize: 20),)) ,
              // ),
              //

            ],
          ) ,



        ),
      ),
    );
  }
  Row buildTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("This code will expired in "),
        TweenAnimationBuilder(
          tween: Tween(begin: 30.0, end: 0.0),
          duration: Duration(seconds: 30),
          builder: (_, dynamic value, child) => Text("00:${value.toInt()}",),
        ),
      ],
    );
  }
}
