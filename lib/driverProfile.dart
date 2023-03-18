import 'package:flutter/material.dart';
import 'package:tiff_valet/customNavigationBar.dart';
import 'package:tiff_valet/enum.dart';

class driverProfile extends StatefulWidget {
  const driverProfile({Key? key}) : super(key: key);

  @override
  State<driverProfile> createState() => _driverProfileState();
}

class _driverProfileState extends State<driverProfile> {
  String name = "Rajesh Bro";
  String valet_id = "FES800973";

  String valet_dl = "BA 72204428194"; // personal details
  String valet_mobile_number = "+91 7899871032"; // personal details
  String valet_aadhar_number = "3152 2313 3213"; // personal details
  String valet_address = "312/313/1,"; // personal details
  String valet_address_localtity = "Chowk Bhawandi, Lokhpur";
  String valet_address_City = "Prayagraj";
  String valet_address_State = "Uttar Pradesh"; // personal details

  int valet_locality_serving = 5; //Area Assigned
  int valet_service_radius = 8; //Area Assigned
  String valet_hub = "TIFF1203"; //Area Assigned
  String valet_hub_address = "90/1 "; //Area Assigned
  String valet_asset_provdided = "Bag,Tshirt,Bike"; //Area Assigned
  String hub_address_localtity = "Chauraha Ashok Nagar";
  String hub_address_City = "Bangalore";
  String hub_address_State = "Karnataka"; // personal details

  String valet_bank_name = "Bank of India"; // Bank Details
  String valet_IFSC_code = "SBIN0006792"; // Bank Details
  int valet_account_number = 3214435353232; // Bank Details
  String valet_pancard = "APLSH90167M"; // Bank Details

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        bottomNavigationBar:
            CustomBottomNavBar(selectedMenu: MenuState.driverProfile),
        body: Stack(
          children: [
            //For valet Image,name and id
            Positioned(
              top: 80,
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
                              //customer Profile
                              Container(
                                height: 100,
                                width: 100,
                                //child: pickedImage==null? AssetImage('assets/images/G60.png') : FileImage(File(pickedImage.path)),
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.white, width: 2),
                                  borderRadius: BorderRadius.circular(100),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        'assets/images/customer_image/cus7.png'),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {});
                                  },
                                  child: Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      color: Color(0xffEB4749),
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: Colors.white, width: 2),
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
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        name,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        valet_id,
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                ),
              ),
            ),

            Positioned(
              top: 260,

              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  //color: Colors.white,
                ),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 20.0, left: 10, bottom: 10, right: 20),
                  child: Column(
                    children: [
                      TabBar(
                          indicator: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color(0xFF8639B1),
                                  Color(0xFFEB2133),
                                  Color(0xFFFD9E41)
                                ],
                              ),
                              borderRadius: BorderRadius.circular(5)),
                          unselectedLabelColor: Colors.black,
                          tabs: [
                            Tab(
                              text: 'Personal',
                            ),
                            Tab(
                              text: 'Area Assigned',
                            ),
                            Tab(
                              text: 'Bank',
                            )
                          ]),
                      SizedBox(
                        height: 20,
                      ),

                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SizedBox(
                              height: 300,
                          child: TabBarView(
                            children: [



                              Container(

                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.white),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Driver Licence",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Color(0xff2d2d2d)),
                                            ),
                                            Text(
                                              valet_dl,
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Color(0xff2d2d2d)),
                                            ),
                                          ],
                                        ),
                                        Divider(),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Phone number",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Color(0xff2d2d2d)),
                                            ),
                                            Text(
                                              valet_mobile_number,
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Color(0xff2d2d2d)),
                                            )
                                          ],
                                        ),
                                        Divider(),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Aadhar Number",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Color(0xff2d2d2d)),
                                            ),
                                            Text(
                                              valet_aadhar_number,
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Color(0xff2d2d2d)),
                                            )
                                          ],
                                        ),
                                        Divider(),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Address",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Color(0xff2d2d2d)),
                                            ),
                                            Text(
                                              valet_address,
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Color(0xff2d2d2d)),
                                            )
                                          ],
                                        ),
                                        Divider(),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Locality",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Color(0xff2d2d2d)),
                                            ),
                                            Text(
                                              valet_address_localtity,
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Color(0xff2d2d2d)),
                                            )
                                          ],
                                        ),
                                        Divider(),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "City",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Color(0xff2d2d2d)),
                                            ),
                                            Text(
                                              valet_address_City,
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Color(0xff2d2d2d)),
                                            )
                                          ],
                                        ),
                                        Divider(),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "State",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Color(0xff2d2d2d)),
                                            ),
                                            Text(
                                              valet_address_State,
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Color(0xff2d2d2d)),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  )),


                              //holds area assigned details
                              Container(

                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.white),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Locality serving",
                                              style: TextStyle(
                                                  fontSize: 18, color: Color(0xff2d2d2d)),
                                            ),
                                            Text(
                                              valet_locality_serving.toString(),
                                              style: TextStyle(
                                                  fontSize: 18, color: Color(0xff2d2d2d)),
                                            ),
                                          ],
                                        ),
                                        Divider(),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Radius serving",
                                              style: TextStyle(
                                                  fontSize: 18, color: Color(0xff2d2d2d)),
                                            ),
                                            Text(
                                              valet_service_radius.toString(),
                                              style: TextStyle(
                                                  fontSize: 18, color: Color(0xff2d2d2d)),
                                            )
                                          ],
                                        ),
                                        Divider(),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "HUB ",
                                              style: TextStyle(
                                                  fontSize: 18, color: Color(0xff2d2d2d)),
                                            ),
                                            Text(
                                              valet_hub,
                                              style: TextStyle(
                                                  fontSize: 18, color: Color(0xff2d2d2d)),
                                            )
                                          ],
                                        ),
                                        Divider(),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Hub Address",
                                              style: TextStyle(
                                                  fontSize: 18, color: Color(0xff2d2d2d)),
                                            ),
                                            Text(
                                              valet_hub_address,
                                              style: TextStyle(
                                                  fontSize: 18, color: Color(0xff2d2d2d)),
                                            )
                                          ],
                                        ),
                                        Divider(),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Hub Locality",
                                              style: TextStyle(
                                                  fontSize: 18, color: Color(0xff2d2d2d)),
                                            ),
                                            Text(
                                              hub_address_localtity,
                                              style: TextStyle(
                                                  fontSize: 18, color: Color(0xff2d2d2d)),
                                            )
                                          ],
                                        ),
                                        Divider(),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Hub City",
                                              style: TextStyle(
                                                  fontSize: 18, color: Color(0xff2d2d2d)),
                                            ),
                                            Text(
                                              hub_address_City,
                                              style: TextStyle(
                                                  fontSize: 18, color: Color(0xff2d2d2d)),
                                            )
                                          ],
                                        ),
                                        Divider(),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Hub State",
                                              style: TextStyle(
                                                  fontSize: 18, color: Color(0xff2d2d2d)),
                                            ),
                                            Text(
                                              hub_address_State,
                                              style: TextStyle(
                                                  fontSize: 18, color: Color(0xff2d2d2d)),
                                            )
                                          ],
                                        ),
                                        Divider(),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Assets provided",
                                              style: TextStyle(
                                                  fontSize: 18, color: Color(0xff2d2d2d)),
                                            ),
                                            Text(
                                              valet_asset_provdided,
                                              style: TextStyle(
                                                  fontSize: 18, color: Color(0xff2d2d2d)),
                                            )
                                          ],
                                        )

                                      ],
                                    ),
                                  )),


//holds bank details
                              Container(

                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.white),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Bank name",
                                              style: TextStyle(
                                                  fontSize: 18, color: Color(0xff2d2d2d)),
                                            ),
                                            Text(
                                              valet_bank_name,
                                              style: TextStyle(
                                                  fontSize: 18, color: Color(0xff2d2d2d)),
                                            ),
                                          ],
                                        ),
                                        Divider(),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "IFSC ",
                                              style: TextStyle(
                                                  fontSize: 18, color: Color(0xff2d2d2d)),
                                            ),
                                            Text(
                                              valet_IFSC_code,
                                              style: TextStyle(
                                                  fontSize: 18, color: Color(0xff2d2d2d)),
                                            )
                                          ],
                                        ),
                                        Divider(),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Account number",
                                              style: TextStyle(
                                                  fontSize: 18, color: Color(0xff2d2d2d)),
                                            ),
                                            Text(
                                              valet_account_number.toString(),
                                              style: TextStyle(
                                                  fontSize: 18, color: Color(0xff2d2d2d)),
                                            )
                                          ],
                                        ),
                                        Divider(),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Pan Card",
                                              style: TextStyle(
                                                  fontSize: 18, color: Color(0xff2d2d2d)),
                                            ),
                                            Text(
                                              valet_pancard,
                                              style: TextStyle(
                                                  fontSize: 18, color: Color(0xff2d2d2d)),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ),


                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
