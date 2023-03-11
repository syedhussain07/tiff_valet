import 'package:flutter/material.dart';
import 'package:tiff_valet/login.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:Padding(padding: EdgeInsets.all(10),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 250,
          ),

          Container(
            height: 400,
            width: 900,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/delivery_valet.png'))),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'Let\'s Get Started',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Color(0xffeb4647),
                  fontSize: 35),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'Tiff  delivery partners app',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Color(0xffeb4647),
                    fontSize: 20),
              )),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Container(
              width: 900,
              height: 50,
              child: OutlinedButton(
                  onPressed: () {

                    Navigator.push(context,  MaterialPageRoute(builder: (context) => login()));
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.white,
                    elevation: 2,
                  ),
                  child: Text(
                    'Continue',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Color(0xffeb4647),
                        fontSize: 20),
                  )),
            ),
          )

          // Image.asset('assets/image/delivery_valet.png', width:300, height:100)
        ],
      ),)



    );
  }
}
