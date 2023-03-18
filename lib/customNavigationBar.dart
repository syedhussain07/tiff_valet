import 'package:flutter/material.dart';
import 'package:tiff_valet/home_screen.dart';
import 'package:tiff_valet/enum.dart';
import 'package:tiff_valet/driverProfile.dart';
import 'package:tiff_valet/valet_performance.dart';
import 'package:tiff_valet/customerHealthDataUpdate.dart';

class CustomBottomNavBar extends StatelessWidget {

  CustomBottomNavBar({required this.selectedMenu});
  final MenuState selectedMenu;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0,-15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(5),
          topRight: Radius.circular(5),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed:(){
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => home_screen(delivered_customer_name: "")));
              },
              icon: Icon(
                Icons.home,
                color: MenuState.home == selectedMenu?Colors.red:Colors.black,
              ),
            ),
            IconButton(
              onPressed:(){
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => customerWeightUpdate()));
              },
              icon: Icon(
                Icons.monitor_weight_rounded,
                color: MenuState.customerWeight == selectedMenu?Colors.red:Colors.black,
              ),
            ),
            IconButton(
              onPressed:(){
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => driverProfile()));
              },
              icon: Icon(
                Icons.person,
                color: MenuState.driverProfile == selectedMenu?Colors.red:Colors.black,
              ),
            ),
            IconButton(
              onPressed:(){
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => valet_Performance()));
              },
              icon: Icon(
                Icons.graphic_eq,
                color: MenuState.valetPerformance == selectedMenu?Colors.red:Colors.black,
              ),
            ),
            // IconButton(
            //   onPressed:(){},
            //   icon: Icon(
            //     Icons.person,
            //     color: MenuState.profile == selectedMenu?Colors.red:Colors.black,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}