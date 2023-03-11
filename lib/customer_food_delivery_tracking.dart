import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'customer_food_delivery_tracking.dart';
import 'package:location/location.dart';
import 'dart:async';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:tiff_valet/constant.dart';

class customer_food_delivery_tracking extends StatefulWidget {
  final String customer_name;
  final int order_id;
  final double customer_lat;
  final double customer_long;
  customer_food_delivery_tracking({Key? key, required this.customer_name,required this.order_id,required this.customer_lat,required this.customer_long}){
    print(customer_lat);
    print(customer_name);
    print(order_id);
    print(customer_long);
  }

  @override
  State<customer_food_delivery_tracking> createState() => _customer_food_delivery_trackingState(this.customer_name,this.order_id,this.customer_lat,this.customer_long);
}




class _customer_food_delivery_trackingState extends State<customer_food_delivery_tracking> {
  final String customer_name;
  final int order_id;
  final double customer_lat;
  final double customer_long;
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
  _customer_food_delivery_trackingState(this.customer_name,this.order_id,this.customer_lat,this.customer_long);


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
                  color:Colors.blue,

                ),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(

                  ),
                ),


          ))
        ],
      ),
    );
  }
}



