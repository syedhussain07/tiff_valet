import 'package:flutter/material.dart';

import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter_android/google_maps_flutter_android.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'dart:async';

import 'package:tiff_valet/constant.dart';

class customer_gps extends StatefulWidget {
  const customer_gps({Key? key}) : super(key: key);

  @override
  State<customer_gps> createState() => _customer_gpsState();
}

class _customer_gpsState extends State<customer_gps> {
  final Completer<GoogleMapController> _controller = Completer();
   LatLng sourceLocation=LatLng(25.425455629002617, 81.82164891103655);
  static const LatLng destination = LatLng(25.44930787528145, 81.85716305274505);


  BitmapDescriptor sourceIcon=BitmapDescriptor.defaultMarker;
  BitmapDescriptor destinationIcon=BitmapDescriptor.defaultMarker;
  BitmapDescriptor currentLocationIcon=BitmapDescriptor.defaultMarker;

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
    print(LatLng(currentLocation!.latitude!, currentLocation!.longitude!).toString()+"no are not");
    print(newLoc.toString()+" yes you are right");
    sourceLocation=LatLng(currentLocation!.latitude!, currentLocation!.longitude!);
    print(sourceLocation);

  });});
  }

  List<LatLng> polyineCoordinates = [];




  void setCustomMarkerIcon(){
    BitmapDescriptor.fromAssetImage(ImageConfiguration.empty, "assets/Icon/source_Icon.png").then((icon){
      sourceIcon=icon;
    });
    BitmapDescriptor.fromAssetImage(ImageConfiguration.empty, "assets/Icon/destination_icon.png").then((icon){
      destinationIcon=icon;
    });
    BitmapDescriptor.fromAssetImage(ImageConfiguration.empty, "assets/Icon/currentLocation_Icon.png").then((icon){
      currentLocationIcon=icon;
    });
  }

  void getPolyPoints() async {
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      google_api_key,
      PointLatLng(sourceLocation.latitude, sourceLocation.longitude),
      PointLatLng(destination.latitude, destination.longitude),
    );
    print(sourceLocation.toString()+"inside polylinee");
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) =>
          polyineCoordinates.add(LatLng(point.latitude, point.longitude),),);
      setState(() {

        print(sourceLocation.toString()+"inside polylineee if statement");
      });
    };

  }
  @override
  void initState(){

    getCurrentLocation();



    getPolyPoints();
    setCustomMarkerIcon();
    super.initState();
  }
  Widget build(BuildContext context) {

    print(sourceLocation.toString()+"inside widget");
    //print(currentLocation!.latitude!.toString()+"  "+currentLocation!.longitude!.toString());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            "Track order",
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
        ),
        body: currentLocation == null? Center(child: Text("Loading...")):
        GoogleMap(
          initialCameraPosition:
              CameraPosition(target: LatLng(currentLocation!.latitude!, currentLocation!.longitude!), zoom: 15),

          polylines: {
            Polyline(
              polylineId:  PolylineId("route"),
              points: polyineCoordinates,
              color: Color(0xffeb4749),
              width: 6,


            )
          },
          markers: {
            //  Marker(
            //    icon: currentLocationIcon,
            //   markerId: const MarkerId("currentLocation"),
            //   position: LatLng(currentLocation!.latitude!, currentLocation!.longitude!),
            //
            // ),
             Marker(
              icon: currentLocationIcon,
              markerId: MarkerId("Source"),
              position: sourceLocation,
            ),
             Marker(
              icon: destinationIcon,
              markerId: MarkerId("Destination"),
              position: destination,
            ),
          },
          onMapCreated: (mapController) {
            _controller.complete(mapController);
          },

        ));
  }
}
