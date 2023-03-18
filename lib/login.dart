import 'package:flutter/material.dart';
import 'package:tiff_valet/otp_screen.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController countryController = TextEditingController();
  var phone="";

  @override
  void initState() {
    // TODO: implement initState
    countryController.text = "+91";
    super.initState();
  }
  @override
  TextEditingController phoneNumberController = TextEditingController();

  String _phoneNumber="";
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F5F5),
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0,left:10,right:10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Container(
                height: 300,
                decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(10),
                    image:DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/delivery_valet.png",)

                    )),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              "Login",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Enter your mobile number to get started and grab your first meal free.",
              style: TextStyle(
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: 55,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.white),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: 40,
                      child: TextField(

                        controller: countryController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(

                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Text(
                      "|",
                      style: TextStyle(fontSize: 33, color: Colors.grey),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: TextField(
                            controller: phoneNumberController,
                          maxLength: 10,
                          onChanged: (value)
                          {
                            phone=value;
                          },
                          // keyboardType: TextInputType.phone,
                          decoration: InputDecoration(

                            counterText: "",
                            border: InputBorder.none,
                            hintText: "Phone",
                          ),
                          keyboardType: TextInputType.number, // set the keyboard type to number

                        ))
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0,right:20,bottom:10),
              child: MaterialButton(
                  onPressed:(){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => otp_screen(phoneNumber: phoneNumberController.text,countryCode: countryController.text,)));
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
                        child: Text('Login',style: TextStyle(color: Colors.white),)

                    ),
                  )
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text("or continue with"),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Container(
                    width:40,
                    height:40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 1, color: Colors.white),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Center(child: Image(image: AssetImage('assets/images/google-logo-9808.png'))),
                    )),
                SizedBox(
                  width: 20,
                ),
                Container(
                    width:40,
                    height:40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 1, color: Colors.white),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Center(child: Image(image: AssetImage('assets/images/appleLogo.png'))),
                    ))

              ],
            )
          ],
        ),
      ),
    );
  }
}
