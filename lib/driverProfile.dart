import 'package:flutter/material.dart';
import 'package:tiff_valet/customNavigationBar.dart';
import 'package:tiff_valet/enum.dart';

class driverProfile extends StatefulWidget {
  const driverProfile({Key? key}) : super(key: key);

  @override
  State<driverProfile> createState() => _driverProfileState();
}

class _driverProfileState extends State<driverProfile> {

  String name="Rajesh Bro";
  String valet_id="FES800973";
  String valet_dl="BA 72204428194";
  String valet_mobile_number="+91 7899871032";
  String valet_aadhar_number="3152 2313 3213";
  String valet_address="312/313/1, Chowk Bhawandi, Lokhpur";






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavBar(selectedMenu:MenuState.driverProfile),
      body: Stack(
       children: [
         Positioned(
           top: 100,
           child: Container(
             width: MediaQuery.of(context).size.width,
             child: Center(
               child: Column(
                 children: [
                   Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Stack(
                         children: [
                           Container(
                             height: 100,
                             width: 100,
                             //child: pickedImage==null? AssetImage('assets/images/G60.png') : FileImage(File(pickedImage.path)),
                             decoration: BoxDecoration(
                               border: Border.all(color: Colors.white, width: 2),
                               borderRadius: BorderRadius.circular(100),
                               image: DecorationImage(
                                 fit: BoxFit.cover,
                                 image:AssetImage('assets/images/customer_image/cus7.png'),
                               ),
                             ),
                           ),
                           Positioned(
                             bottom: 0,
                             right: 0,
                             child: GestureDetector(
                               onTap: () {
                                 setState(() {

                                 });
                               },
                               child: Container(
                                 height: 30,
                                 width: 30,
                                 decoration: BoxDecoration(
                                   color: Color(0xffEB4749),
                                   shape: BoxShape.circle,
                                   border: Border.all(color: Colors.white, width: 2),
                                 ),
                                 child: Icon(
                                   Icons.verified,
                                   color: Colors.white,
                                   size: 15,
                                 ),
                               ),
                             ),
                           )
                         ],
                       ),
                     ],
                   ),
                   SizedBox(height: 20,),
                   Text(name,
                     style: TextStyle(
                         color: Colors.black,
                         fontSize: 16,
                         fontWeight: FontWeight.w600),),
                   SizedBox(height: 5,),
                   Text(valet_id,
                     style: TextStyle(
                         color: Colors.grey,
                         fontSize: 14,
                         fontWeight: FontWeight.w400),)
                 ],
               ),
             ),
           ),
         ),
         Positioned(
           top: 280,
           bottom: 0,

           child: Container(
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(5.0),
               color: Colors.white,
             ),
             width: MediaQuery.of(context).size.width,
             height: MediaQuery.of(context).size.height,
             child: Padding(
               padding: const EdgeInsets.only(top: 20.0,left: 10,bottom:10,right: 20),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text('Personal Details',
                     style: TextStyle(
                         color: Colors.black,
                         fontSize: 18,
                         fontWeight: FontWeight.w600),),
                    SizedBox(height: 5,),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                     Text("Driver Licence"),
                         Text(valet_dl),
                   ],),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Text("Phone number"),
                       Text(valet_mobile_number)
                     ],),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Text("Aadhar Number"),
                       Text(valet_aadhar_number)
                     ],),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Text("Address"),
                       Text(valet_address)
                     ],)

                   
                   


                 ],

               ),
             ),
           ),
         ),
       ],
      ),
    );

  }
}
