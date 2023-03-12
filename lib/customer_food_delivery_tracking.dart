import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tiff_valet/deliveredFeedback.dart';
import 'customer_food_delivery_tracking.dart';
import 'package:location/location.dart';
import 'dart:async';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:tiff_valet/constant.dart';

import 'package:tiff_valet/not_delivered.dart';

class customer_food_delivery_tracking extends StatefulWidget {
  final String customer_name;
  final int order_id;
  final double customer_lat;
  final double customer_long;
  final String customer_image;
  final String customer_meal;
  final String customer_address;
  customer_food_delivery_tracking({Key? key, required this.customer_name,required this.order_id,required this.customer_lat,required this.customer_long, required this.customer_image, required this.customer_meal, required this.customer_address}){
    print(customer_lat);
    print(customer_name);
    print(order_id);
    print(customer_long);
  }

  @override
  State<customer_food_delivery_tracking> createState() => _customer_food_delivery_trackingState(this.customer_name,this.order_id,this.customer_lat,this.customer_long,this.customer_image,this.customer_meal, this.customer_address);
}




class _customer_food_delivery_trackingState extends State<customer_food_delivery_tracking> {
  final String customer_name;
  final int order_id;
  final double customer_lat;
  final double customer_long;
  final  String customer_image;
  final String customer_meal;
  final String customer_address;
  LatLng?  customerLocationInitialize;
  List<LatLng> polyineCoordinates = [];
  LatLng lateInit=LatLng(0, 0);






  final Completer<GoogleMapController> _controller = Completer();

  LocationData? currentLocation;
  void getCurrentLocation()async{
    Location location= Location();
    location.getLocation().then(
          (location){ currentLocation=location;
      print(currentLocation.toString()+"currentLocaktion");
      },);
    GoogleMapController googleMapController= await  _controller.future;

    location.onLocationChanged.listen((newLoc) { currentLocation=newLoc;
    googleMapController.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(target: LatLng(newLoc.latitude!,newLoc.longitude!),zoom: 20),),);
    setState(() {
      print(newLoc.toString()+"newLoc");


    });});

  }
  _customer_food_delivery_trackingState(this.customer_name,this.order_id,this.customer_lat,this.customer_long,this.customer_image,this.customer_meal,this.customer_address);


  BitmapDescriptor sourceIcon = BitmapDescriptor.defaultMarker;

  void setCustomMarkerIcon() {
    BitmapDescriptor.fromAssetImage(
        ImageConfiguration.empty, "assets/Icon/source_Icon.png")
        .then((icon) {
      sourceIcon = icon;
    });
  }

  // void getPolyPoints() async {
  //   PolylinePoints polylinePoints = PolylinePoints();
  //   PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
  //     google_api_key,
  //     PointLatLng(),
  //     PointLatLng(currentLocation!.latitude!, currentLocation!.longitude!),
  //
  //   );
  //
  //   if (result.points.isNotEmpty) {
  //     result.points.forEach((PointLatLng point) =>
  //         polyineCoordinates.add(LatLng(point.latitude, point.longitude),),);
  //     setState(() {});
  //   };
  //
  // }
  @override
  void initState() {

    // TODO: implement initState
    super.initState();
    getCurrentLocation();
    // LatLng  customerLocation = LatLng(customer_lat,customer_long);
    // customerLocationInitialize=customerLocation;
    setCustomMarkerIcon();

  // getPolyPoints();

  }
  @override
  Widget build(BuildContext context) {
    print(currentLocation.toString()+" build inside widget");
    // LatLng  customerLocation = LatLng(customer_lat,customer_long);
    // customerLocationInitialize=customerLocation;


    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 30,
            left: 0,
            right: 0,
            height:400,
          //width: 800,
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                  target: LatLng(customer_lat,customer_long),zoom: 20),
              polylines: {
                Polyline(
                  polylineId:  PolylineId("route"),
                  points: polyineCoordinates,
                  color: Color(0xffeb4749),
                  width: 6,


                )
              },
              markers: {
                // Marker(
                //   // icon: currentLocationIcon,
                //   markerId: const MarkerId("currentLocation"),
                //   position: LatLng(currentLocation!.latitude!, currentLocation!.longitude!),
                // ),
                Marker(
                  icon: sourceIcon,
                  markerId: MarkerId("Source"),
                  position:  LatLng(customer_lat,customer_long),
                ),

              },
              zoomGesturesEnabled: true,
              onMapCreated: (mapController) {
                _controller.complete(mapController);
              },

            ),
          ),
          Positioned(
            top: 425,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0),topRight: Radius.circular(20)),
                  color:Color(0xfff5f5f5),

                ),



                //customers details with address phone number and delivery mark
                child: Padding(
                  padding: EdgeInsets.only(left: 20,right: 30, top: 20),
                  child: Column(

                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(

                        children: [
                          Text("Delivery ID : "+order_id.toString(),style: TextStyle( color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w600) ),
                          Expanded(child: SizedBox()),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                              color: Color(0xfffffffff),
                            ) ,

                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Help"),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 10,),
                      Divider(color: Colors.white,thickness:2,),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0,left: 10,right: 10),
                            child: Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image:DecorationImage(
                                    fit: BoxFit.cover,
                                    image:AssetImage(customer_image,)

                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 180,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(customer_name,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),),
                                SizedBox(
                                  height: 2,
                                ),
                                Text(customer_meal,
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),),
                                SizedBox(
                                  height: 2,
                                ),
                                Text(customer_address.toString(),
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),),

                              ],




                            ),
                          ),
                          Expanded(child: SizedBox()),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text("Call"),
                                  SizedBox(width: 5,),
                                  Icon(Icons.call, size: 18,)
                                ],
                              ),
                            ),
                          ),

                        ],
                      ),
                      SizedBox(height: 10,),
                      Divider(color: Colors.white,thickness:2,),
                      SizedBox(height: 10,),



                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Order Details",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),),
                              SizedBox(
                                height: 2,
                              ),
                              Text(order_id.toString(),
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),),
                              SizedBox(
                                height: 2,
                              ),

                              Text("1 box of "+customer_meal+" meal",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),),
                            ],
                          ),
                          Expanded(child: SizedBox()),
                          TextButton(onPressed: (){}, child: Text("View Receipt",style: TextStyle(
                              color: Colors.red,
                              fontSize: 16,
                              fontWeight: FontWeight.w600
                          ),))
                        ],
                      ),




                      SizedBox(height: 10,),
                      Divider(color: Colors.white,thickness:2,),
                      SizedBox(height: 10,),

                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Message customer",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),),
                              SizedBox(
                                height: 2,
                              ),
                              Text("I have reached the door.\n"+
                                  "Please collect your order",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),),



                            ],
                          ),
                          Expanded(child: SizedBox()),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: MaterialButton(
                                onPressed:(){
                                  //Navigator.push(context, MaterialPageRoute(builder: (context) => otp_screen(phoneNumber: phoneNumberController.text,countryCode: countryController.text,)));
                                },

                                child: Ink(
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [Color(0xFF8639B1), Color(0xFFEB2133), Color(0xFFFD9E41)],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                       // constraints: const BoxConstraints(minWidth: 60.0, minHeight: 60.0), // min sizes for Material buttons
                                        alignment: Alignment.center,
                                        child: Text('Send',style: TextStyle(color: Colors.white),)

                                    ),
                                  ),
                                )
                            ),
                          ),
                        ],
                      ),



                      SizedBox(height: 10,),
                      Divider(color: Colors.white,thickness:2,),
                      SizedBox(height: 10,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: MaterialButton(onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder:(context)=> not_deliverable(customer_name: customer_name,
                                order_id: order_id,)));
                            },

                            child: Ink(
                              decoration: const BoxDecoration(
                               color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 10,bottom: 10),
                                child: Container(
                                    constraints: const BoxConstraints(minWidth: 30.0, minHeight: 30.0), // min sizes for Material buttons
                                    alignment: Alignment.center,
                                    child: Text('Not delivered',style: TextStyle(color: Color(0xff2d2d2d)),)

                                ),
                              ),
                            ),),
                          ),
                          SizedBox(width: 20,),
                          Expanded(
                            child: MaterialButton(onPressed: (){

                              Navigator.push(context, MaterialPageRoute(builder: (context)=> deliveredFeedback(
                                customer_name: customer_name,
                                order_id: order_id,

                                customer_image: customer_image,
                                customer_meal: customer_meal,
                                customer_address: customer_address,
                              ))) ;
                            },
                              child: Ink(
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [Color(0xFF8639B1), Color(0xFFEB2133), Color(0xFFFD9E41)],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 10,bottom: 10),
                                  child: Container(
                                     constraints: const BoxConstraints(minWidth: 30.0, minHeight: 30.0), // min sizes for Material buttons
                                      alignment: Alignment.center,
                                      child: Text('Mark as Delivered',style: TextStyle(color: Colors.white),)

                                  ),
                                ),
                              ),
                            ),
                          ),


                        ],
                      )


                    ],

                  ),
                ),


          ))
        ],
      ),
    );
  }
}



