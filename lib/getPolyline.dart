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
  customer_food_delivery_tracking({Key? key, required this.customer_name,required this.order_id,required this.customer_long,required this.customer_lat}){
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
  late LatLng  customerLocationInitialize;
  List<LatLng> polyineCoordinates = [];






  final Completer<GoogleMapController> _controller = Completer();

  LocationData? currentLocation;
  void getCurrentLocation()async{
    Location location= Location();
    location.getLocation().then(
          (location){ currentLocation=location;
      print(currentLocation);
      },);
    GoogleMapController googleMapController= await  _controller.future;

    location.onLocationChanged.listen((newLoc) { currentLocation=newLoc;
    googleMapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(newLoc.latitude!,newLoc.longitude!),zoom: 20),),);
    setState(() {

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

  void getPolyPoints() async {
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      google_api_key,
      PointLatLng(currentLocation!.latitude!,currentLocation!.longitude!),
      PointLatLng(customerLocationInitialize.latitude, customerLocationInitialize.longitude),

    );

    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) =>
          polyineCoordinates.add(LatLng(point.latitude, point.longitude),),);
      setState(() {});
    };

  }
  @override
  void initState() {

    // TODO: implement initState

    LatLng  customerLocation = LatLng(customer_lat,customer_long);
    customerLocationInitialize=customerLocation;
    setCustomMarkerIcon();
    getCurrentLocation();
    getPolyPoints();
    super.initState();
  }
  Widget build(BuildContext context) {
    // LatLng  customerLocation = LatLng(customer_lat,customer_long);
    // customerLocationInitialize=customerLocation;


    return Scaffold(
      body: Column(
        children: [
          Container(
              height: 600,
              //  width: 400,
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
                  Marker(
                    // icon: currentLocationIcon,
                    markerId: const MarkerId("currentLocation"),
                    position: LatLng(currentLocation!.latitude!, currentLocation!.longitude!),
                  ),
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

              )

          ),
          MaterialButton(
              onPressed: (){
            currentLocation;
            print(currentLocation);
          },
            child: Text('Locate Me'),

          ),
          Text(customer_name)

        ],
      ),
    );
  }
}



