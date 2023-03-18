import 'package:flutter/material.dart';
import 'package:tiff_valet/customNavigationBar.dart';
import 'enum.dart';


class valet_Performance extends StatefulWidget {
  const valet_Performance({Key? key}) : super(key: key);

  @override
  State<valet_Performance> createState() => _valet_PerformanceState();
}

class _valet_PerformanceState extends State<valet_Performance> {

  int daily_trip=7;
  int daily_login_hour=20;
  int daily_total_orders=70;

  int weekly_trip=63;
  int weekly_login_hour=110;
  int weekly_total_orders=456;


  int monthly_trip=765;
  int monthly_login_hour=400;
  int monthly_total_orders=2145;


  double onTimeDelivery= 98.2;
  double deliveryAccuracy= 87.11;
  double customerRating=4.2;
  int total_trip=1903;
  int total_login_hour=9012;
  int total_orders=19822;



  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(

        bottomNavigationBar: CustomBottomNavBar(selectedMenu:MenuState.valetPerformance),

        body: Padding(
          padding: const EdgeInsets.only(top: 100.0, left: 20, right: 20),
          child: Column(
            children: [
              Text(
                'Performance',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Color(0xff000000),
                    fontSize: 30),
              ),
              SizedBox(height: 40,),
              TabBar(
                  indicator: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF8639B1),
                        Color(0xFFEB2133),
                        Color(0xFFFD9E41)
                      ],
                  ),
                  borderRadius: BorderRadius.circular(5)

                  ),
                unselectedLabelColor: Colors.black,

                  tabs: [
                Tab(text:'Daily',),
                Tab(text:'Weekly',),
                Tab(text:'Monthly',)


              ]),
              SizedBox(height: 20,),

              SizedBox(
                height: 120,

                child: TabBarView(
                  children: [
                    //holds daily data
                    Container(
                      height:120,

                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(5),
                       color: Colors.white
                     ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20,right: 20,top: 20,),
                            child: Row(
                              children: [
                                Expanded(
                                    child: Container(
                                        decoration: BoxDecoration(
                                          color: Color(0XFFF5F5F5),
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: Column(
                                              children: [
                                                Text(daily_trip.toString(),style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600) ,),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text("Trips",
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                    ))
                                              ],
                                            ),
                                          ),
                                        ))), // daily trips
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                    child: Container(
                                        decoration: BoxDecoration(
                                          color: Color(0XFFF5F5F5),
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: Column(
                                              children: [

                                                Text(daily_login_hour.toString(),style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600) ,),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  "Login Hours",
                                                  style: TextStyle(
                                                    color: Colors.black,

                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ))), // daily login hours
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                    child: Container(
                                        decoration: BoxDecoration(
                                          color: Color(0XFFF5F5F5),
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: Column(
                                              children: [

                                                Text(daily_total_orders.toString(),style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600) ,),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  "Orders",
                                                  style: TextStyle(
                                                    color: Colors.black,

                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ))),// daily order delivery
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),

                        ],
                      ),),

                    //holds weekly data
                    Container(decoration: BoxDecoration(
                      color: Color(0Xffffffff),
                      borderRadius: BorderRadius.circular(10),
                    ), child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20,right: 20,top: 20,),
                          child: Row(
                            children: [
                              Expanded(
                                  child: Container(
                                      decoration: BoxDecoration(
                                        color: Color(0XFFF5F5F5),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: Column(
                                            children: [
                                              Text(weekly_trip.toString(),style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600) ,),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text("Trips",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                  ))
                                            ],
                                          ),
                                        ),
                                      ))), // daily trips
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Container(
                                      decoration: BoxDecoration(
                                        color: Color(0XFFF5F5F5),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: Column(
                                            children: [

                                              Text(weekly_login_hour.toString(),style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600) ,),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                "Login Hours",
                                                style: TextStyle(
                                                  color: Colors.black,

                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ))), // daily login hours
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Container(
                                      decoration: BoxDecoration(
                                        color: Color(0XFFF5F5F5),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: Column(
                                            children: [

                                              Text(weekly_total_orders.toString(),style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600) ,),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                "Orders",
                                                style: TextStyle(
                                                  color: Colors.black,

                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ))),// daily order delivery
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),

                      ],
                    ),),

                   //holds monthly data
                    Container(decoration:BoxDecoration(
                      color: Color(0Xffffffff),
                      borderRadius: BorderRadius.circular(10),
                    ), child:Column(children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20,right: 20,top: 20,),
                          child: Row(
                            children: [
                              Expanded(
                                  child: Container(
                                      decoration: BoxDecoration(
                                        color: Color(0XFFF5F5F5),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: Column(
                                            children: [
                                              Text(monthly_trip.toString(),style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600) ,),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text("Trips",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                  ))
                                            ],
                                          ),
                                        ),
                                      ))), // daily trips
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Container(
                                      decoration: BoxDecoration(
                                        color: Color(0XFFF5F5F5),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: Column(
                                            children: [

                                              Text(monthly_login_hour.toString(),style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600) ,),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                "Login Hours",
                                                style: TextStyle(
                                                  color: Colors.black,

                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ))), // daily login hours
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Container(
                                      decoration: BoxDecoration(
                                        color: Color(0XFFF5F5F5),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: Column(
                                            children: [

                                              Text(monthly_total_orders.toString(),style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600) ,),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                "Orders",
                                                style: TextStyle(
                                                  color: Colors.black,

                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ))),// daily order delivery
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),

                      ],),)
                  ],
                ),
              ),

              SizedBox(height: 20,),

              Container(
                //height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xffffffff),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Color(0xfff5f5f5),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Icon(Icons.timer_outlined,size: 20,),
                                ),


                              ),
                              SizedBox(width: 10,),
                              Text("On-time delivery rate"),
                            ],
                          ),

                          Text(onTimeDelivery.toString()+"%"),





                        ],
                      ),
                      Divider( ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Color(0xfff5f5f5),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Icon(Icons.center_focus_weak_outlined,size: 20,),
                                ),


                              ),
                              SizedBox(width: 10,),
                              Text("Order Accuracy"),
                            ],
                          ),

                          Text(deliveryAccuracy.toString()+"%"),





                        ],
                      ),
                      Divider( ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Color(0xfff5f5f5),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Icon(Icons.star,size: 20,),
                                ),


                              ),
                              SizedBox(width: 10,),
                              Text("Customer Rating"),
                            ],
                          ),

                          Text(customerRating.toString()),





                        ],
                      ),
                      Divider( ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Color(0xfff5f5f5),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Icon(Icons.route,size: 20,),
                                ),


                              ),
                              SizedBox(width: 10,),
                              Text("Total Trips"),
                            ],
                          ),

                          Text(total_trip.toString()),





                        ],
                      ),

                      Divider( ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Color(0xfff5f5f5),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Icon(Icons.hourglass_bottom,size: 20,),
                                ),


                              ),
                              SizedBox(width: 10,),
                              Text("Total Hours"),
                            ],
                          ),

                          Text(total_login_hour.toString()),





                        ],
                      ),
                      Divider( ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Color(0xfff5f5f5),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Icon(Icons.shopping_bag,size: 20,),
                                ),


                              ),
                              SizedBox(width: 10,),
                              Text("Total Orders"),
                            ],
                          ),

                          Text(total_orders.toString()),





                        ],
                      ),
                    ],
                  ),
                ),
              ),
           
            ],
          ),
        ),
      ),
    );
  }
}
